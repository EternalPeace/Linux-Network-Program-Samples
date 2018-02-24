/*
 * Copyright (c) 1987, 1988 Regents of the University of California.
 * All rights reserved.
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
 *	@(#)vba.c	7.6 (Berkeley) 12/16/90
 */

/*
 * Tahoe VERSAbus adapator support routines.
 */

#include "sys/param.h"
#include "sys/buf.h"
#include "sys/cmap.h"
#include "sys/conf.h"
#include "dk.h"
#include "sys/map.h"
#include "sys/systm.h"
#include "sys/user.h"
#include "sys/vmparam.h"
#include "sys/vmmac.h"
#include "sys/proc.h"
#include "sys/syslog.h"
#include "sys/malloc.h"

#include "../include/mtpr.h"
#include "../include/pte.h"

#include "../vba/vbavar.h"

/*
 * Allocate private page map and intermediate buffer
 * for a VERSAbus device, large enough for maximum transfer size.
 * Intermediate buffer 
 * Make intermediate buffer uncacheable.
 */
vbainit(vb, xsize, flags)
	register struct vb_buf *vb;
	int xsize, flags;
{
	register struct pte *pte;
	register n;

	vb->vb_flags = flags;
	if (vbmapalloc((int)btoc(xsize) + 1, &vb->vb_map, &vb->vb_utl) == 0) {
		printf("vbmap exhausted\n");
		return (0);
	}
	n = roundup(xsize, NBPG);
	vb->vb_bufsize = n;
	if (vb->vb_rawbuf == 0)
		vb->vb_rawbuf = (caddr_t)malloc((u_long)n, M_DEVBUF, M_NOWAIT);
	if (vb->vb_rawbuf == 0) {
		printf("no memory for device buffer\n");
		return (0);
	}
	if ((int)vb->vb_rawbuf & PGOFSET)
		panic("vbinit pgoff");
	vb->vb_physbuf = (u_long)kvtophys(vb->vb_rawbuf);
	if (flags & VB_20BIT)
		vb->vb_maxphys = btoc(VB_MAXADDR20);
	else if (flags & VB_24BIT)
		vb->vb_maxphys = btoc(VB_MAXADDR24);
	else
		vb->vb_maxphys = btoc(VB_MAXADDR32);
	if (btoc(vb->vb_physbuf + n) > vb->vb_maxphys)
		panic("vbinit physbuf");
	
	/*
	 * Make raw buffer pages uncacheable.
	 */
	pte = kvtopte(vb->vb_rawbuf);
	for (n = btoc(n); n--; pte++)
		pte->pg_nc = 1;
	mtpr(TBIA, 0);
	return (1);
}

/*
 * Due to unknown hardware or software errors, some sites have problems
 * with strange crashes or corruption of text images when DMA is attempted
 * to kernel addresses spanning a page boundary, or to user addresses
 * (even if the buffer is physically contiguous).  To avoid this behavior,
 * the following toggles inhibit such transfers when set.
 *	vba_copyk: copy transfers to kernel address that span a page boundary
 *	vba_copyu: copy transfers to user addresses
 */
#ifndef VBA_TRICKY
int vba_copyk = 1;
int vba_copyu = 1;
#else
int vba_copyk = 0;
int vba_copyu = 0;
#endif

/*
 * Check a transfer to see whether it can be done directly
 * to the destination buffer, or whether it must be copied.
 * On Tahoe, the lack of a bus I/O map forces data to be copied
 * to a physically-contiguous buffer whenever one of the following is true:
 *	1) The data length is not a multiple of sector size.
 *	   (The swapping code does this, unfortunately.)
 *	2) The buffer is not physically contiguous and the controller
 *	   does not support scatter-gather operations.
 *	3) The physical address for I/O is higher than addressible
 *	   by the device.
 * This routine is called by the start routine.
 * If copying is necessary, the intermediate buffer is mapped;
 * if the operation is a write, the data is copied into the buffer.
 * It returns the physical address of the first byte for DMA, to
 * be presented to the controller.
 */
u_long
vbasetup(bp, vb, sectsize)
	register struct buf *bp;
	register struct vb_buf *vb;
	int sectsize;
{
	register struct pte *spte, *dpte;
	register int p, i;
	int npf, o, v;

	o = (int)bp->b_un.b_addr & PGOFSET;
	npf = btoc(bp->b_bcount + o);
	vb->vb_iskernel = (((int)bp->b_un.b_addr & KERNBASE) == KERNBASE);
	if (vb->vb_iskernel) {
		spte = kvtopte(bp->b_un.b_addr);
if (vba_copyk && (o != 0 || npf > 1)) goto copy;
	} else {
		spte = vtopte((bp->b_flags&B_DIRTY) ? &proc[2] : bp->b_proc,
		    btop(bp->b_un.b_addr));
if (vba_copyu) goto copy;
	}
	if (bp->b_bcount % sectsize != 0 || (o & (sizeof(long) - 1)) != 0)
		goto copy;
	else if ((vb->vb_flags & VB_SCATTER) == 0 ||
	    vb->vb_maxphys != btoc(VB_MAXADDR32)) {
		dpte = spte;
		p = (dpte++)->pg_pfnum;
		for (i = npf; --i > 0; dpte++) {
			if ((v = dpte->pg_pfnum) != p + CLSIZE &&
			    (vb->vb_flags & VB_SCATTER) == 0)
				goto copy;
			if (p >= vb->vb_maxphys)
				goto copy;
			p = v;
		}
		if (p >= vb->vb_maxphys)
			goto copy;
	}
	vb->vb_copy = 0;
	if (vb->vb_iskernel)
		vbastat.k_raw++;
	else
		vbastat.u_raw++;
	return ((spte->pg_pfnum << PGSHIFT) + o);

copy:
	vb->vb_copy = 1;
	if (bp->b_bcount > vb->vb_bufsize)
		panic("vba xfer too large");
	if (vb->vb_iskernel) {
		if ((bp->b_flags & B_READ) == 0)
			bcopy(bp->b_un.b_addr, vb->vb_rawbuf,
			    (unsigned)bp->b_bcount);
		vbastat.k_copy++;
	} else  {
		dpte = vb->vb_map;
		for (i = npf, p = (int)vb->vb_utl; i--; p += NBPG) {
			*(int *)dpte++ = (spte++)->pg_pfnum |
			    PG_V | PG_KW | PG_N;
			mtpr(TBIS, p);
		}
		if ((bp->b_flags & B_READ) == 0)
			bcopy(vb->vb_utl + o, vb->vb_rawbuf,
			    (unsigned)bp->b_bcount);
		vbastat.u_copy++;
	}
	return (vb->vb_physbuf);
}

/*
 * Called by the driver's interrupt routine, after DMA is completed.
 * If the operation was a read, copy data to final buffer if necessary
 * or invalidate data cache for cacheable direct buffers.
 * Similar to the vbastart routine, but in the reverse direction.
 */
vbadone(bp, vb)
	register struct buf *bp;
	register struct vb_buf *vb;
{
	register npf;
	register caddr_t v;
	int o;

	if (bp->b_flags & B_READ) {
		o = (int)bp->b_un.b_addr & PGOFSET;
		if (vb->vb_copy) {
			if (vb->vb_iskernel)
				bcopy(vb->vb_rawbuf, bp->b_un.b_addr,
				    (unsigned)(bp->b_bcount - bp->b_resid));
			else {
				bcopy(vb->vb_rawbuf, vb->vb_utl + o,
				    (unsigned)(bp->b_bcount - bp->b_resid));
				dkeyinval(bp->b_proc);
			}
		} else {
			if (vb->vb_iskernel) {
				npf = btoc(bp->b_bcount + o);
				for (v = bp->b_un.b_addr; npf--; v += NBPG)
					mtpr(P1DC, (int)v);
			} else
				dkeyinval(bp->b_proc);
		}
	}
}

/*
 * Set up a scatter-gather operation for SMD/E controller.
 * This code belongs half-way between {hd,vd}.c and this file.
 */

#include "dk.h"
#if NVD > 0
#include "vdreg.h"

vd_sgsetup(bp, vb, sg)
	register struct buf *bp;
	struct vb_buf *vb;
	struct trsg *sg;
{
	register struct pte *spte;
	register struct addr_chain *adr;
	register int i;
	int o;

	vb->vb_iskernel = (((int)bp->b_un.b_addr & KERNBASE) == KERNBASE);
	vb->vb_copy = 0;
	if (vb->vb_iskernel) {
		spte = kvtopte(bp->b_un.b_addr);
		vbastat.k_sg++;
	} else {
		spte = vtopte((bp->b_flags&B_DIRTY) ? &proc[2] : bp->b_proc,
		    btop(bp->b_un.b_addr));
		vbastat.u_sg++;
	}

	o = (int)bp->b_un.b_addr & PGOFSET;
	i = min(NBPG - o, bp->b_bcount);
	sg->start_addr.wcount = i >> 1;
	sg->start_addr.memadr = ((spte++)->pg_pfnum << PGSHIFT) + o;
	i = bp->b_bcount - i;
	if (i > VDMAXPAGES * NBPG)
		panic("vba xfer too large");
	i = i >> 1;
	for (adr = sg->addr_chain; i > 0; adr++, i -= NBPG / 2) {
		adr->nxt_addr = (spte++)->pg_pfnum << PGSHIFT;
		adr->nxt_len = imin(i, NBPG / 2);
	}
	adr->nxt_addr = 0;
	adr++->nxt_len = 0;
	return ((adr - sg->addr_chain) * sizeof(*adr) / sizeof(long));
}
#endif

#include "hd.h"
#if NHD > 0
#include "hdreg.h"

hd_sgsetup(bp, vb, sg)
	register struct buf *bp;
	struct vb_buf *vb;
	struct chain *sg;
{
	register struct pte *spte;
	register struct addr_chain *adr;
	register int i, cnt;
	int o;

	if (bp->b_bcount > HDC_MAXBC ||
	    bp->b_bcount % sizeof(long) - 1 ||
	    (u_int)bp->b_un.b_addr % sizeof(long) - 1)
		return(0);

	vb->vb_iskernel = (((int)bp->b_un.b_addr & KERNBASE) == KERNBASE);
	vb->vb_copy = 0;
	if (vb->vb_iskernel) {
		spte = kvtopte(bp->b_un.b_addr);
		vbastat.k_sg++;
	} else {
		spte = vtopte((bp->b_flags&B_DIRTY) ? &proc[2] : bp->b_proc,
		    btop(bp->b_un.b_addr));
		vbastat.u_sg++;
	}

	o = (int)bp->b_un.b_addr & PGOFSET;
	i = min(NBPG - o, bp->b_bcount);
	sg->wcount = i >> 2;
	sg->memadr = ((spte++)->pg_pfnum << PGSHIFT) + o;
	cnt = 0;
	for (i = (bp->b_bcount - i) >> 2; i > 0; i -= NBPG / sizeof(long)) {
		if (++cnt == HDC_MAXCHAIN)
			return(0);
		sg->wcount |= LWC_DATA_CHAIN;
		++sg;
		sg->wcount = imin(i, NBPG / sizeof(long));
		sg->memadr = (spte++)->pg_pfnum << PGSHIFT;
	}
	return(1);
}
#endif
