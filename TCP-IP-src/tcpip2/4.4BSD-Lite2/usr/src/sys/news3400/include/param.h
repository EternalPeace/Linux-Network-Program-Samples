/*
 * Copyright (c) 1988 University of Utah.
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * the Systems Programming Group of the University of Utah Computer
 * Science Department and Ralph Campbell.
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
 * from: Utah $Hdr: machparam.h 1.11 89/08/14$
 *
 *	@(#)param.h	8.3 (Berkeley) 5/14/95
 */

/*
 * Machine dependent constants for DEC Station 3100.
 */
#define	MACHINE	"news3400"
#define NCPUS 1
#define COFF

/*
 * Round p (pointer or byte index) up to a correctly-aligned value for all
 * data types (int, long, ...).   The result is u_int and must be cast to
 * any desired pointer type.
 */
#define	ALIGNBYTES	7
#define	ALIGN(p)	(((u_int)(p) + ALIGNBYTES) &~ ALIGNBYTES)

#define	NBPG		4096		/* bytes/page */
#define	PGOFSET		(NBPG-1)	/* byte offset into page */
#define	PGSHIFT		12		/* LOG2(NBPG) */
#define	NPTEPG		(NBPG/4)

#define NBSEG		0x400000	/* bytes/segment */
#define	SEGOFSET	(NBSEG-1)	/* byte offset into segment */
#define	SEGSHIFT	22		/* LOG2(NBSEG) */

#define	KERNBASE	0x80000000	/* start of kernel virtual */
#define	BTOPKERNBASE	((u_long)KERNBASE >> PGSHIFT)

#define	DEV_BSIZE	512
#define	DEV_BSHIFT	9		/* log2(DEV_BSIZE) */
#define BLKDEV_IOSIZE	2048
#define	MAXPHYS		(128 * 1024)	/* max raw I/O transfer size */

#define	CLSIZE		1
#define	CLSIZELOG2	0

/* NOTE: SSIZE, SINCR and UPAGES must be multiples of CLSIZE */
#define	SSIZE		1		/* initial stack size/NBPG */
#define	SINCR		1		/* increment of stack/NBPG */

#define	UPAGES		2		/* pages of u-area */
#define	UADDR		0xffffd000	/* address of u */
#define	UVPN		(UADDR>>PGSHIFT)/* virtual page number of u */
#define	KERNELSTACK	(UADDR+UPAGES*NBPG)	/* top of kernel stack */

/*
 * Constants related to network buffer management.
 * MCLBYTES must be no larger than CLBYTES (the software page size), and,
 * on machines that exchange pages of input or output buffers with mbuf
 * clusters (MAPPED_MBUFS), MCLBYTES must also be an integral multiple
 * of the hardware page size.
 */
#define	MSIZE		128		/* size of an mbuf */
#define	MCLBYTES	1024
#define	MCLSHIFT	10
#define	MCLOFSET	(MCLBYTES - 1)
#ifndef NMBCLUSTERS
#ifdef GATEWAY
#define	NMBCLUSTERS	512		/* map size, max cluster allocation */
#else
#define	NMBCLUSTERS	256		/* map size, max cluster allocation */
#endif
#endif

/*
 * Size of kernel malloc arena in CLBYTES-sized logical pages
 */ 
#ifndef NKMEMCLUSTERS
#define	NKMEMCLUSTERS	(2048*1024/CLBYTES)
#endif

/* pages ("clicks") (4096 bytes) to disk blocks */
#define	ctod(x)	((x)<<(PGSHIFT-DEV_BSHIFT))
#define	dtoc(x)	((x)>>(PGSHIFT-DEV_BSHIFT))
#define	dtob(x)	((x)<<DEV_BSHIFT)

/* pages to bytes */
#define	ctob(x)	((x)<<PGSHIFT)

/* bytes to pages */
#define	btoc(x)	(((unsigned)(x)+(NBPG-1))>>PGSHIFT)

#define	btodb(bytes)	 		/* calculates (bytes / DEV_BSIZE) */ \
	((bytes) >> DEV_BSHIFT)
#define	dbtob(db)			/* calculates (db * DEV_BSIZE) */ \
	((db) << DEV_BSHIFT)

/*
 * Map a ``block device block'' to a file system block.
 * This should be device dependent, and should use the bsize
 * field from the disk label.
 * For now though just use DEV_BSIZE.
 */
#define	bdbtofsb(bn)	((bn) / (BLKDEV_IOSIZE/DEV_BSIZE))

/*
 * Mach derived conversion macros
 */
#define pmax_round_page(x)	((((unsigned)(x)) + NBPG - 1) & ~(NBPG-1))
#define pmax_trunc_page(x)	((unsigned)(x) & ~(NBPG-1))
#define pmax_btop(x)		((unsigned)(x) >> PGSHIFT)
#define pmax_ptob(x)		((unsigned)(x) << PGSHIFT)

#ifdef news3400
#define	splnet		spl2
#define	splsoftclock	spl2
#define	splbio		spl3
#define	spltty		spl4
#define	splimp		spl4
#define	splclock	spl5
#define	splstatclock	spl5
#endif /* news3400 */

#ifdef KERNEL
#ifndef LOCORE
extern	int cpuspeed;
#define	DELAY(n)	{ register int N = cpuspeed * (n) / 2; while (--N > 0); }
#endif
#else /* !KERNEL */
#define	DELAY(n)	{ register int N = (n); while (--N > 0); }
#endif /* !KERNEL */

#ifndef LOCORE
extern int	intrcnt[];
extern char	*intrnames[];
#endif /* !LOCORE */

#define	INTR_CLOCK	0
#define	INTR_SOFTCLK	1
#define	INTR_SOFTINT	2
#define	INTR_AST	3
#define	INTR_SCSI00	4
#define	INTR_SCSI01	5
#define	INTR_SCSI02	6
#define	INTR_SCSI03	7
#define	INTR_SCSI04	8
#define	INTR_SCSI05	9
#define	INTR_SCSI06	10
#define	INTR_SCSI07	11
#define	INTR_SCSI10	12
#define	INTR_SCSI11	13
#define	INTR_SCSI12	14
#define	INTR_SCSI13	15
#define	INTR_SCSI14	16
#define	INTR_SCSI15	17
#define	INTR_SCSI16	18
#define	INTR_SCSI17	19
#define	INTR_ETHER0	20
#define	INTR_ETHER1	21
#define	INTR_ETHER2	22
#define	INTR_VME2	23
#define	INTR_VME4	24
#define	INTR_RS0	25
#define	INTR_RS1	26
#define	INTR_RS2	27
#define	INTR_RS3	28
#define	INTR_RS4	29
#define	INTR_RS5	30
#define	INTR_RS6	31
#define	INTR_RS7	32
#define	INTR_RS8	33
#define	INTR_RS9	34
#define	INTR_RS10	35
#define	INTR_RS11	36
#define	INTR_PRINTER	37
#define	INTR_FD		38
#define	INTR_AUDIO	39
#define	INTR_KEYBOARD	40
#define	INTR_MOUSE	41
#define	INTR_BITMAP	42
#define	INTR_FDDI	43
#define INTR_RENDER	44

#define	NINTRSLOT	45		/* # of intrcnt[] slot */

#ifndef _SIMPLELOCK_H_
#define _SIMPLELOCK_H_
/*
 * A simple spin lock.
 *
 * This structure only sets one bit of data, but is sized based on the
 * minimum word size that can be operated on by the hardware test-and-set
 * instruction. It is only needed for multiprocessors, as uniprocessors
 * will always run to completion or a sleep. It is an error to hold one
 * of these locks while a process is sleeping.
 */
struct simplelock {
	int	lock_data;
};

#if !defined(DEBUG) && NCPUS > 1
/*
 * The simple-lock routines are the primitives out of which the lock
 * package is built. The machine-dependent code must implement an
 * atomic test_and_set operation that indivisibly sets the simple lock
 * to non-zero and returns its old value. It also assumes that the
 * setting of the lock to zero below is indivisible. Simple locks may
 * only be used for exclusive locks.
 */
static __inline void
simple_lock_init(lkp)
	struct simplelock *lkp;
{

	lkp->lock_data = 0;
}

static __inline void
simple_lock(lkp)
	__volatile struct simplelock *lkp;
{

	while (test_and_set(&lkp->lock_data))
		continue;
}

static __inline int
simple_lock_try(lkp)
	__volatile struct simplelock *lkp;
{

	return (!test_and_set(&lkp->lock_data))
}

static __inline void
simple_unlock(lkp)
	__volatile struct simplelock *lkp;
{

	lkp->lock_data = 0;
}
#endif /* NCPUS > 1 */
#endif /* !_SIMPLELOCK_H_ */
