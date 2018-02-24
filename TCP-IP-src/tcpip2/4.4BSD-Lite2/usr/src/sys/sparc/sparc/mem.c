/*
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This software was developed by the Computer Systems Engineering group
 * at Lawrence Berkeley Laboratory under DARPA contract BG 91-66 and
 * contributed to Berkeley.
 *
 * All advertising materials mentioning features or use of this software
 * must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Lawrence Berkeley Laboratory.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)mem.c	8.2 (Berkeley) 12/10/93
 *
 * from: $Header: mem.c,v 1.9 92/11/26 03:05:03 torek Exp $
 */

/*
 * Memory special file
 */

#include <sys/param.h>
#include <sys/proc.h>
#include <sys/conf.h>
#include <sys/buf.h>
#include <sys/systm.h>
#include <sys/malloc.h>

#include <vm/vm.h>

/*ARGSUSED*/
mmrw(dev, uio, flags)
	dev_t dev;
	struct uio *uio;
	int flags;
{
	register struct iovec *iov;
	register caddr_t va;
	register int o;
	register u_int c;
	int error = 0;
	caddr_t zbuf = NULL;
	extern caddr_t vmempage;
	static struct {
		int	locked;
		int	wanted;
	} physlock;

	if (minor(dev) == 0) {
		/* lock against other uses of shared vmempage */
		while (physlock.locked) {
			physlock.wanted = 1;
			(void)tsleep((caddr_t)&physlock, PZERO, "mmrw", 0);
		}
		physlock.locked = 1;
	}
	while (uio->uio_resid > 0 && error == 0) {
		iov = uio->uio_iov;
		if (iov->iov_len == 0) {
			uio->uio_iov++;
			uio->uio_iovcnt--;
			if (uio->uio_iovcnt < 0)
				panic("mmrw");
			continue;
		}
		switch (minor(dev)) {

/* minor device 0 is physical memory */
		case 0:
			o = uio->uio_offset;
			va = vmempage;
			if (pmap_enter_hw(kernel_pmap, (vm_offset_t)va, 
			    (vm_offset_t)trunc_page(o), 
			    uio->uio_rw == UIO_READ ?
			    VM_PROT_READ : VM_PROT_WRITE, 1)) {
				error = EFAULT;
				goto unlock;
			}
			o = (int)uio->uio_offset & PGOFSET;
			c = min(uio->uio_resid, (u_int)(NBPG - o));
			error = uiomove(&va[o], (int)c, uio);
			pmap_remove(kernel_pmap,
			    (vm_offset_t)va, (vm_offset_t)va + PAGE_SIZE);
			continue;

/* minor device 1 is kernel memory */
		case 1:
			va = (caddr_t)(int)uio->uio_offset;
			c = min(iov->iov_len, MAXPHYS);
			if (!kernacc(va, c,
			    uio->uio_rw == UIO_READ ? B_READ : B_WRITE))
				return (EFAULT);
			error = uiomove(va, (int)c, uio);
			continue;

/* minor device 2 is EOF/RATHOLE */
		case 2:
			if (uio->uio_rw == UIO_WRITE)
				uio->uio_resid = 0;
			return (0);

/* XXX should add sbus, `prom', etc */

/* minor device 12 (/dev/zero) is source of nulls on read, rathole on write */
		case 12:
			if (uio->uio_rw == UIO_WRITE) {
				uio->uio_resid = 0;
				return (0);
			}
			if (zbuf == NULL) {	/* XXX grot */
				zbuf = (caddr_t)malloc(CLBYTES,
				    M_TEMP, M_WAITOK);
				bzero(zbuf, CLBYTES);
			}
			c = min(iov->iov_len, CLBYTES);
			error = uiomove(zbuf, (int)c, uio);
			continue;

		default:
			return (ENXIO);
		}
		if (error)
			break;
		iov->iov_base += c;
		iov->iov_len -= c;
		uio->uio_offset += c;
		uio->uio_resid -= c;
	}
	if (zbuf)
		free(zbuf, M_TEMP);
	if (minor(dev) == 0) {
unlock:
		physlock.locked = 0;
		if (physlock.wanted)
			wakeup((caddr_t)&physlock);
	}
	return (error);
}
