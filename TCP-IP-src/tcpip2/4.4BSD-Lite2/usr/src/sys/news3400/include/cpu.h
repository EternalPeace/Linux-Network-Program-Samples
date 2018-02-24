/*
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Ralph Campbell and Kazumasa Utashiro of Software Research
 * Associates, Inc.
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
 *	@(#)cpu.h	8.3 (Berkeley) 5/17/95
 */

#ifndef _CPU_H_
#define _CPU_H_

#include <machine/machConst.h>

/*
 * Exported definitions unique to pmax/mips cpu support.
 */

/*
 * definitions of cpu-dependent requirements
 * referenced in generic code
 */
#define	COPY_SIGCODE		/* copy sigcode above user stack in exec */

#define	cpu_exec(p)		(p->p_md.md_ss_addr = 0) /* init single step */
#define	cpu_swapin(p)		/* nothing */
#define	cpu_wait(p)		/* nothing */
#define cpu_setstack(p, ap)	(p)->p_md.md_regs[SP] = ap
#define cpu_set_init_frame(p, fp) (p)->p_md.md_regs = fp
#define	BACKTRACE(p)		/* not implemented */

/*
 * Arguments to hardclock and gatherstats encapsulate the previous
 * machine state in an opaque clockframe.
 */
struct clockframe {
	int	pc;	/* program counter at time of interrupt */
	int	sr;	/* status register at time of interrupt */
};

#define	CLKF_USERMODE(framep)	((framep)->sr & MACH_SR_KU_PREV)
#define	CLKF_BASEPRI(framep)	\
	((~(framep)->sr & (MACH_INT_MASK | MACH_SR_INT_ENA_PREV)) == 0)
#define	CLKF_PC(framep)		((framep)->pc)
#define	CLKF_INTR(framep)	(0)

/*
 * Preempt the current process if in interrupt from user mode,
 * or after the current trap/syscall if in system mode.
 */
#define	need_resched()	{ want_resched = 1; aston(); }

/*
 * Give a profiling tick to the current process when the user profiling
 * buffer pages are invalid.  On the PMAX, request an ast to send us
 * through trap, marking the proc as needing a profiling tick.
 */
#define	need_proftick(p)	{ (p)->p_flag |= SOWEUPC; aston(); }

/*
 * Notify the current process (p) that it has a signal pending,
 * process as soon as possible.
 */
#define	signotify(p)	aston()

#define aston()		(astpending = 1)

int	astpending;	/* need to trap before returning to user mode */
int	want_resched;	/* resched() was called */

/*
 * CPU identification, from PRID register.
 */
union cpuprid {
	int	cpuprid;
	struct {
#if BYTE_ORDER == BIG_ENDIAN
		u_int	pad1:16;	/* reserved */
		u_int	cp_imp:8;	/* implementation identifier */
		u_int	cp_majrev:4;	/* major revision identifier */
		u_int	cp_minrev:4;	/* minor revision identifier */
#else
		u_int	cp_minrev:4;	/* minor revision identifier */
		u_int	cp_majrev:4;	/* major revision identifier */
		u_int	cp_imp:8;	/* implementation identifier */
		u_int	pad1:16;	/* reserved */
#endif
	} cpu;
};

/*
 * MIPS CPU types (cp_imp).
 */
#define	MIPS_R2000	0x01
#define	MIPS_R3000	0x02
#define	MIPS_R6000	0x03
#define	MIPS_R4000	0x04
#define	MIPS_R6000A	0x06

/*
 * MIPS FPU types
 */
#define	MIPS_R2010_FPU	0x02
#define	MIPS_R3010_FPU	0x03
#define	MIPS_R6010_FPU	0x04
#define	MIPS_R4000_FPU	0x05

struct intr_tab {
	void	(*func)();	/* pointer to interrupt routine */
	int	unit;		/* logical unit number */
};

#ifdef KERNEL
union	cpuprid cpu;
union	cpuprid fpu;
u_int	machDataCacheSize;
u_int	machInstCacheSize;
extern	struct intr_tab intr_tab[];
#endif

#endif /* _CPU_H_ */
