/*
 * Copyright (c) 1988 University of Utah.
 * Copyright (c) 1992 OMRON Corporation.
 * Copyright (c) 1980, 1990, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * the Systems Programming Group of the University of Utah Computer
 * Science Department.
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
 * from: Utah $Hdr: locore.s 1.62 92/01/20$
 * from: hp300/hp300/locore.s	8.5 (Berkeley) 11/14/93
 *
 *	@(#)locore.s	8.4 (Berkeley) 12/6/93
 */

/*
 * STACKCHECK enables two types of kernel stack checking:
 *	1. stack "overflow".  On every clock interrupt we ensure that
 *	   the current kernel stack has not grown into the user struct
 *	   page, i.e. size exceeded UPAGES-1 pages.
 *	2. stack "underflow".  Before every rte to user mode we ensure
 *	   that we will be exactly at the base of the stack after the
 *	   exception frame has been popped.
 * Both checks are performed at splclock since they operate on the
 * global temporary stack.
 */
/* #define	STACKCHECK */

#include "assym.s"
#include <luna68k/luna68k/vectors.s>

/*
 * Temporary stack for a variety of purposes.
 * Try and make this the first thing is the data segment so it
 * is page aligned.  Note that if we overflow here, we run into
 * our text segment.
 */
	.data
	.space	NBPG
tmpstk:

	.text
/*
 * This is where we wind up if the kernel jumps to location 0.
 * (i.e. a bogus PC)  This is known to immediately follow the vector
 * table and is hence at 0x400 (see reset vector in vectors.s).
 */
	.globl	_panic
	pea	Ljmp0panic
	jbsr	_panic
	/* NOTREACHED */
Ljmp0panic:
	.asciz	"kernel jump to zero"
	.even

/*
 * Do a dump.
 * Called by auto-restart.
 */
	.globl	_dumpsys
	.globl	_doadump
_doadump:
	jbsr	_dumpsys
	jbsr	_doboot
	/*NOTREACHED*/

/*
 * Trap/interrupt vector routines
 */ 

	.globl	_trap, _nofault, _longjmp
_buserr:
	tstl	_nofault		| device probe?
	jeq	Lberr			| no, handle as usual
	movl	_nofault,sp@-		| yes,
	jbsr	_longjmp		|  longjmp(nofault)
Lberr:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	_addrerr		| no, skip
	clrl	sp@-			| stack adjust count
	moveml	#0xFFFF,sp@-		| save user registers
	movl	usp,a0			| save the user SP
	movl	a0,sp@(FR_SP)		|   in the savearea
	lea	sp@(FR_HW),a1		| grab base of HW berr frame
	moveq	#0,d0
	movw	a1@(12),d0		| grab SSW
	movl	a1@(20),d1		| and fault VA
	btst	#11,d0			| check for mis-aligned access
	jeq	Lberr2			| no, skip
	addl	#3,d1			| yes, get into next page
	andl	#PG_FRAME,d1		| and truncate
Lberr2:
	movl	d1,sp@-			| push fault VA
	movl	d0,sp@-			| and padded SSW
	btst	#10,d0			| ATC bit set?
	jeq	Lisberr			| no, must be a real bus error
	movc	dfc,d1			| yes, get MMU fault
	movc	d0,dfc			| store faulting function code
	movl	sp@(4),a0		| get faulting address
	.word	0xf568			| ptestr a0@
	movc	d1,dfc
	.long	0x4e7a0805		| movc mmusr,d0
	movw	d0,sp@			| save (ONLY LOW 16 BITS!)
	jra	Lismerr
#endif
_addrerr:
	clrl	sp@-			| stack adjust count
	moveml	#0xFFFF,sp@-		| save user registers
	movl	usp,a0			| save the user SP
	movl	a0,sp@(FR_SP)		|   in the savearea
	lea	sp@(FR_HW),a1		| grab base of HW berr frame
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lbenot040		| no, skip
	movl	a1@(8),sp@-		| yes, push fault address
	clrl	sp@-			| no SSW for address fault
	jra	Lisaerr			| go deal with it
Lbenot040:
#endif
	moveq	#0,d0
	movw	a1@(10),d0		| grab SSW for fault processing
	btst	#12,d0			| RB set?
	jeq	LbeX0			| no, test RC
	bset	#14,d0			| yes, must set FB
	movw	d0,a1@(10)		| for hardware too
LbeX0:
	btst	#13,d0			| RC set?
	jeq	LbeX1			| no, skip
	bset	#15,d0			| yes, must set FC
	movw	d0,a1@(10)		| for hardware too
LbeX1:
	btst	#8,d0			| data fault?
	jeq	Lbe0			| no, check for hard cases
	movl	a1@(16),d1		| fault address is as given in frame
	jra	Lbe10			| thats it
Lbe0:
	btst	#4,a1@(6)		| long (type B) stack frame?
	jne	Lbe4			| yes, go handle
	movl	a1@(2),d1		| no, can use save PC
	btst	#14,d0			| FB set?
	jeq	Lbe3			| no, try FC
	addql	#4,d1			| yes, adjust address
	jra	Lbe10			| done
Lbe3:
	btst	#15,d0			| FC set?
	jeq	Lbe10			| no, done
	addql	#2,d1			| yes, adjust address
	jra	Lbe10			| done
Lbe4:
	movl	a1@(36),d1		| long format, use stage B address
	btst	#15,d0			| FC set?
	jeq	Lbe10			| no, all done
	subql	#2,d1			| yes, adjust address
Lbe10:
	movl	d1,sp@-			| push fault VA
	movl	d0,sp@-			| and padded SSW
	movw	a1@(6),d0		| get frame format/vector offset
	andw	#0x0FFF,d0		| clear out frame format
	cmpw	#12,d0			| address error vector?
	jeq	Lisaerr			| yes, go to it
	movl	d1,a0			| fault address
	ptestr	#1,a0@,#7		| do a table search
	pmove	psr,sp@			| save result
	btst	#7,sp@			| bus error bit set?
	jeq	Lismerr			| no, must be MMU fault
	clrw	sp@			| yes, re-clear pad word
	jra	Lisberr			| and process as normal bus error
Lismerr:
	movl	#T_MMUFLT,sp@-		| show that we are an MMU fault
	jra	Ltrapnstkadj		| and deal with it
Lisaerr:
	movl	#T_ADDRERR,sp@-		| mark address error
	jra	Ltrapnstkadj		| and deal with it
Lisberr:
	movl	#T_BUSERR,sp@-		| mark bus error
Ltrapnstkadj:
	jbsr	_trap			| handle the error
	lea	sp@(12),sp		| pop value args
	movl	sp@(FR_SP),a0		| restore user SP
	movl	a0,usp			|   from save area
	movw	sp@(FR_ADJ),d0		| need to adjust stack?
	jne	Lstkadj			| yes, go to it
	moveml	sp@+,#0x7FFF		| no, restore most user regs
	addql	#8,sp			| toss SSP and stkadj
	jra	rei			| all done
Lstkadj:
	lea	sp@(FR_HW),a1		| pointer to HW frame
	addql	#8,a1			| source pointer
	movl	a1,a0			| source
	addw	d0,a0			|  + hole size = dest pointer
	movl	a1@-,a0@-		| copy
	movl	a1@-,a0@-		|  8 bytes
	movl	a0,sp@(FR_SP)		| new SSP
	moveml	sp@+,#0x7FFF		| restore user registers
	movl	sp@,sp			| and our SP
	jra	rei			| all done

/*
 * FP exceptions.
 */
_fpfline:
#if defined(LUNA2)
	cmpw	#0x202c,sp@(6)		| format type 2?
	jne	_illinst		| no, not an FP emulation
#ifdef HPFPLIB
	.globl fpsp_unimp
	jmp	fpsp_unimp		| yes, go handle it
#else
	clrl	sp@-			| stack adjust count
	moveml	#0xFFFF,sp@-		| save registers
	moveq	#T_FPEMULI,d0		| denote as FP emulation trap
	jra	fault			| do it
#endif
#else
	jra	_illinst
#endif

_fpunsupp:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	_illinst		| no, treat as illinst
#ifdef HPFPLIB
	.globl	fpsp_unsupp
	jmp	fpsp_unsupp		| yes, go handle it
#else
	clrl	sp@-			| stack adjust count
	moveml	#0xFFFF,sp@-		| save registers
	moveq	#T_FPEMULD,d0		| denote as FP emulation trap
	jra	fault			| do it
#endif
#else
	jra	_illinst
#endif

/*
 * Handles all other FP coprocessor exceptions.
 * Note that since some FP exceptions generate mid-instruction frames
 * and may cause signal delivery, we need to test for stack adjustment
 * after the trap call.
 */
_fpfault:
#ifdef FPCOPROC
	clrl	sp@-		| stack adjust count
	moveml	#0xFFFF,sp@-	| save user registers
	movl	usp,a0		| and save
	movl	a0,sp@(FR_SP)	|   the user stack pointer
	clrl	sp@-		| no VA arg
	movl	_curpcb,a0	| current pcb
	lea	a0@(PCB_FPCTX),a0 | address of FP savearea
	fsave	a0@		| save state
	tstb	a0@		| null state frame?
	jeq	Lfptnull	| yes, safe
	clrw	d0		| no, need to tweak BIU
	movb	a0@(1),d0	| get frame size
	bset	#3,a0@(0,d0:w)	| set exc_pend bit of BIU
Lfptnull:
	fmovem	fpsr,sp@-	| push fpsr as code argument
	frestore a0@		| restore state
	movl	#T_FPERR,sp@-	| push type arg
	jra	Ltrapnstkadj	| call trap and deal with stack cleanup
#else
	jra	_badtrap	| treat as an unexpected trap
#endif

#ifdef HPFPLIB
/*
 * We wind up here from the 040 FP emulation library after
 * the exception has been processed.
 */
	.globl	_fault
_fault:
	subql	#4,sp		| space for rts addr
	movl	d0,sp@-		| scratch register
	movw	sp@(14),d0	| get vector offset
	andl	#0xFFF,d0	| mask out frame type and clear high word
	cmpl	#0x100,d0	| HP-UX style reschedule trap?
	jne	Lfault1		| no, skip
	movl	sp@+,d0		| restore scratch register
	addql	#4,sp		| pop space
	jra	Lrei1		| go do AST
Lfault1:
	cmpl	#0xC0,d0	| FP exception?
	jlt	Lfault2		| no, skip
	movl	sp@+,d0		| yes, backoff
	addql	#4,sp		|  and prepare for normal trap frame
	jra	_fpfault	| go to it
Lfault2:
	addl	#Lvectab,d0	| convert to vector table offset
	exg	d0,a0
	movl	a0@,sp@(4) 	| get exception vector and save for rts
	exg	d0,a0
	movl	sp@+,d0		|   scratch registers
	rts			| return to handler from vectab
#endif

/*
 * Coprocessor and format errors can generate mid-instruction stack
 * frames and cause signal delivery hence we need to check for potential
 * stack adjustment.
 */
_coperr:
	clrl	sp@-		| stack adjust count
	moveml	#0xFFFF,sp@-
	movl	usp,a0		| get and save
	movl	a0,sp@(FR_SP)	|   the user stack pointer
	clrl	sp@-		| no VA arg
	clrl	sp@-		| or code arg
	movl	#T_COPERR,sp@-	| push trap type
	jra	Ltrapnstkadj	| call trap and deal with stack adjustments

_fmterr:
	clrl	sp@-		| stack adjust count
	moveml	#0xFFFF,sp@-
	movl	usp,a0		| get and save
	movl	a0,sp@(FR_SP)	|   the user stack pointer
	clrl	sp@-		| no VA arg
	clrl	sp@-		| or code arg
	movl	#T_FMTERR,sp@-	| push trap type
	jra	Ltrapnstkadj	| call trap and deal with stack adjustments

/*
 * Other exceptions only cause four and six word stack frame and require
 * no post-trap stack adjustment.
 */
_illinst:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
	moveq	#T_ILLINST,d0
	jra	fault

_zerodiv:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
	moveq	#T_ZERODIV,d0
	jra	fault

_chkinst:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
	moveq	#T_CHKINST,d0
	jra	fault

_trapvinst:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
	moveq	#T_TRAPVINST,d0
	jra	fault

_privinst:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
	moveq	#T_PRIVINST,d0
	jra	fault

	.globl	fault
fault:
	movl	usp,a0			| get and save
	movl	a0,sp@(FR_SP)		|   the user stack pointer
	clrl	sp@-			| no VA arg
	clrl	sp@-			| or code arg
	movl	d0,sp@-			| push trap type
	jbsr	_trap			| handle trap
	lea	sp@(12),sp		| pop value args
	movl	sp@(FR_SP),a0		| restore
	movl	a0,usp			|   user SP
	moveml	sp@+,#0x7FFF		| restore most user regs
	addql	#8,sp			| pop SP and stack adjust
	jra	rei			| all done

	.globl	_straytrap
_badtrap:
	moveml	#0xC0C0,sp@-		| save scratch regs
	movw	sp@(22),sp@-		| push exception vector info
	clrw	sp@-
	movl	sp@(22),sp@-		| and PC
	jbsr	_straytrap		| report
	addql	#8,sp			| pop args
	moveml	sp@+,#0x0303		| restore regs
	jra	rei			| all done

	.globl	_syscall
_trap0:
	clrl	sp@-			| stack adjust count
	moveml	#0xFFFF,sp@-		| save user registers
	movl	usp,a0			| save the user SP
	movl	a0,sp@(FR_SP)		|   in the savearea
	movl	d0,sp@-			| push syscall number
	jbsr	_syscall		| handle it
	addql	#4,sp			| pop syscall arg
	movl	sp@(FR_SP),a0		| grab and restore
	movl	a0,usp			|   user SP
	moveml	sp@+,#0x7FFF		| restore most registers
	addql	#8,sp			| pop SP and stack adjust
	jra	rei			| all done

/*
 * trap1 is sigreturn and trap2 is breakpoint.
 */
_trap1:
	jra	sigreturn		| trap1 is sigreturn

_trap2:
	jra	_trace			| trap2 is breakpoint

/*
 * Trap 12 is the entry point for the cachectl "syscall" (both HPUX & BSD)
 *	cachectl(command, addr, length)
 * command in d0, addr in a1, length in d1
 */
	.globl	_cachectl
_trap12:
	movl	d1,sp@-			| push length
	movl	a1,sp@-			| push addr
	movl	d0,sp@-			| push command
	jbsr	_cachectl		| do it
	lea	sp@(12),sp		| pop args
	jra	rei			| all done

/*
 * Trap 15 is used for:
 *	- KGDB traps
 *	- trace traps for SUN binaries (not fully supported yet)
 * We just pass it on and let trap() sort it all out
 */
_trap15:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
#ifdef KGDB
	moveq	#T_TRAP15,d0
	movw	sp@(FR_HW),d1		| get PSW
	andw	#PSL_S,d1		| from user mode?
	jeq	fault			| yes, just a regular fault
	movl	d0,sp@-
	.globl	_kgdb_trap_glue
	jbsr	_kgdb_trap_glue		| returns if no debugger
	addl	#4,sp
#endif
	moveq	#T_TRAP15,d0
	jra	fault

/*
 * Hit a breakpoint (trap 1 or 2) instruction.
 * Push the code and treat as a normal fault.
 */
_trace:
	clrl	sp@-
	moveml	#0xFFFF,sp@-
#ifdef KGDB
	moveq	#T_TRACE,d0
	movw	sp@(FR_HW),d1		| get SSW
	andw	#PSL_S,d1		| from user mode?
	jeq	fault			| no, regular fault
	movl	d0,sp@-
	jbsr	_kgdb_trap_glue		| returns if no debugger
	addl	#4,sp
#endif
	moveq	#T_TRACE,d0
	jra	fault

/*
 * The sigreturn() syscall comes here.  It requires special handling
 * because we must open a hole in the stack to fill in the (possibly much
 * larger) original stack frame.
 */
sigreturn:
	lea	sp@(-84),sp		| leave enough space for largest frame
	movl	sp@(84),sp@		| move up current 8 byte frame
	movl	sp@(88),sp@(4)
	movl	#84,sp@-		| default: adjust by 84 bytes
	moveml	#0xFFFF,sp@-		| save user registers
	movl	usp,a0			| save the user SP
	movl	a0,sp@(FR_SP)		|   in the savearea
	movl	#SYS_sigreturn,sp@-	| push syscall number
	jbsr	_syscall		| handle it
	addql	#4,sp			| pop syscall#
	movl	sp@(FR_SP),a0		| grab and restore
	movl	a0,usp			|   user SP
	lea	sp@(FR_HW),a1		| pointer to HW frame
	movw	sp@(FR_ADJ),d0		| do we need to adjust the stack?
	jeq	Lsigr1			| no, just continue
	moveq	#92,d1			| total size
	subw	d0,d1			|  - hole size = frame size
	lea	a1@(92),a0		| destination
	addw	d1,a1			| source
	lsrw	#1,d1			| convert to word count
	subqw	#1,d1			| minus 1 for dbf
Lsigrlp:
	movw	a1@-,a0@-		| copy a word
	dbf	d1,Lsigrlp		| continue
	movl	a0,a1			| new HW frame base
Lsigr1:
	movl	a1,sp@(FR_SP)		| new SP value
	moveml	sp@+,#0x7FFF		| restore user registers
	movl	sp@,sp			| and our SP
	jra	rei			| all done

/*
 * Interrupt handlers.
 * All DIO device interrupts are auto-vectored.  Most can be configured
 * to interrupt in the range IPL2 to IPL5.  Here are our assignments:
 *
 *	Level 0:	Spurious: ignored.
 *	Level 1:	(low XP)
 *	Level 2:	SCSI
 *	Level 3:	LANCE
 *	Level 4:	[PC98]
 *	Level 5:	Clock
 *	Level 6:	RS232C
 *	Level 7:	Non-maskable: parity errors, Abort SW
 */
	.globl	_hardclock, _nmihand

_spurintr:
	addql	#1,_intrcnt+0
	addql	#1,_cnt+V_INTR
	jra	rei

_lev1intr:
	addql	#1,_intrcnt+4
	addql	#1,_cnt+V_INTR
	jra	rei			| XP not surpported yet	XXXX

_lev2intr:
	addql	#1,_intrcnt+8
	moveml	#0xC0C0,sp@-
	jbsr	__scintr	
	moveml	sp@+,#0x0303
	addql	#1,_cnt+V_INTR
	jra	rei

_lev3intr:
	addql	#1,_intrcnt+12
	moveml	#0xC0C0,sp@-
	jbsr	__leintr
	moveml	sp@+,#0x0303
	addql	#1,_cnt+V_INTR
	jra	rei

_lev4intr:
	addql	#1,_intrcnt+16
	addql	#1,_cnt+V_INTR
	jra	rei			| EX-PC not surpported yet XXXX

_lev6intr:
	addql	#1,_intrcnt+24
	moveml	#0xC0C0,sp@-
	jbsr	__siointr
	moveml	sp@+,#0x0303
	addql	#1,_cnt+V_INTR
	jra	rei

_lev5intr:
#ifdef STACKCHECK
	.globl	_panicstr,_badkstack
	cmpl	#_kstack+NBPG,sp	| are we still in stack page?
	jcc	Lstackok		| yes, continue normally
	tstl	_curproc		| if !curproc could have switch_exited,
	jeq	Lstackok		|     might be on tmpstk
	tstl	_panicstr		| have we paniced?
	jne	Lstackok		| yes, do not re-panic
	movl	sp@(4),tmpstk-4		| no, copy common
	movl	sp@,tmpstk-8		|  frame info
	movl	sp,tmpstk-16		| no, save original SP
	lea	tmpstk-16,sp		| switch to tmpstk
	moveml	#0xFFFE,sp@-		| push remaining registers
	movl	#1,sp@-			| is an overflow
	jbsr	_badkstack		| badkstack(1, frame)
	addql	#4,sp
	moveml	sp@+,#0x7FFF		| restore most registers
	movl	sp@,sp			| and SP
Lstackok:
#endif
	moveml	#0xC0C0,sp@-
	lea	sp@(16),a1		| a1 = &clockframe
	btst	#CLK_INT,CLOCK_REG 	| system-clock intrrupt?
	jeq	Lnottimer		| no, skip hardclock
	movb	#CLK_CLR,CLOCK_REG	| clear system-clock interrupt
        tstl	_clock_on		| system-clock started?
        jeq	Lnottimer		| no, skip hardclock
	addql	#1,_intrcnt+28		| count hardclock interrupt
	movl	a1,sp@-
	jbsr	_hardclock		| hardclock(&frame)
	addql	#4,sp
Lnottimer:
	moveml	sp@+,#0x0303		| restore scratch regs
	addql	#1,_cnt+V_INTR		| chalk up another interrupt
	jra	rei			| all done

_lev7intr:
	addql	#1,_intrcnt+36
	clrl	sp@-			| pad SR to longword
	moveml	#0xFFFF,sp@-		| save registers
	movl	usp,a0			| and save
	movl	a0,sp@(FR_SP)		|   the user stack pointer
	jbsr	_nmihand		| call handler
	movl	sp@(FR_SP),a0		| restore
	movl	a0,usp			|   user SP
	moveml	sp@+,#0x7FFF		| and remaining registers
	addql	#8,sp			| pop SSP and align word
	jra	rei			| all done

/*
 * Emulation of VAX REI instruction.
 *
 * This code deals with checking for and servicing ASTs
 * (profiling, scheduling) and software interrupts (network, softclock).
 * We check for ASTs first, just like the VAX.  To avoid excess overhead
 * the T_ASTFLT handling code will also check for software interrupts so we
 * do not have to do it here.  After identifing that we need an AST we
 * drop the IPL to allow device interrupts.
 *
 * This code is complicated by the fact that sendsig may have been called
 * necessitating a stack cleanup.
 */
	.comm	_ssir,1
	.globl	_astpending
rei:
#ifdef STACKCHECK
	tstl	_panicstr		| have we paniced?
	jne	Ldorte1			| yes, do not make matters worse
#endif
	tstl	_astpending		| AST pending?
	jeq	Lchksir			| no, go check for SIR
Lrei1:
	btst	#5,sp@			| yes, are we returning to user mode?
	jne	Lchksir			| no, go check for SIR
	movw	#PSL_LOWIPL,sr		| lower SPL
	clrl	sp@-			| stack adjust
	moveml	#0xFFFF,sp@-		| save all registers
	movl	usp,a1			| including
	movl	a1,sp@(FR_SP)		|    the users SP
	clrl	sp@-			| VA == none
	clrl	sp@-			| code == none
	movl	#T_ASTFLT,sp@-		| type == async system trap
	jbsr	_trap			| go handle it
	lea	sp@(12),sp		| pop value args
	movl	sp@(FR_SP),a0		| restore user SP
	movl	a0,usp			|   from save area
	movw	sp@(FR_ADJ),d0		| need to adjust stack?
	jne	Laststkadj		| yes, go to it
	moveml	sp@+,#0x7FFF		| no, restore most user regs
	addql	#8,sp			| toss SP and stack adjust
#ifdef STACKCHECK
	jra	Ldorte
#else
	rte				| and do real RTE
#endif
Laststkadj:
	lea	sp@(FR_HW),a1		| pointer to HW frame
	addql	#8,a1			| source pointer
	movl	a1,a0			| source
	addw	d0,a0			|  + hole size = dest pointer
	movl	a1@-,a0@-		| copy
	movl	a1@-,a0@-		|  8 bytes
	movl	a0,sp@(FR_SP)		| new SSP
	moveml	sp@+,#0x7FFF		| restore user registers
	movl	sp@,sp			| and our SP
#ifdef STACKCHECK
	jra	Ldorte
#else
	rte				| and do real RTE
#endif
Lchksir:
	tstb	_ssir			| SIR pending?
	jeq	Ldorte			| no, all done
	movl	d0,sp@-			| need a scratch register
	movw	sp@(4),d0		| get SR
	andw	#PSL_IPL7,d0		| mask all but IPL
	jne	Lnosir			| came from interrupt, no can do
	movl	sp@+,d0			| restore scratch register
Lgotsir:
	movw	#SPL1,sr		| prevent others from servicing int
	tstb	_ssir			| too late?
	jeq	Ldorte			| yes, oh well...
	clrl	sp@-			| stack adjust
	moveml	#0xFFFF,sp@-		| save all registers
	movl	usp,a1			| including
	movl	a1,sp@(FR_SP)		|    the users SP
	clrl	sp@-			| VA == none
	clrl	sp@-			| code == none
	movl	#T_SSIR,sp@-		| type == software interrupt
	jbsr	_trap			| go handle it
	lea	sp@(12),sp		| pop value args
	movl	sp@(FR_SP),a0		| restore
	movl	a0,usp			|   user SP
	moveml	sp@+,#0x7FFF		| and all remaining registers
	addql	#8,sp			| pop SP and stack adjust
#ifdef STACKCHECK
	jra	Ldorte
#else
	rte
#endif
Lnosir:
	movl	sp@+,d0			| restore scratch register
Ldorte:
#ifdef STACKCHECK
	movw	#SPL6,sr		| avoid trouble
	btst	#5,sp@			| are we returning to user mode?
	jne	Ldorte1			| no, skip it
	movl	a6,tmpstk-20
	movl	d0,tmpstk-76
	moveq	#0,d0
	movb	sp@(6),d0		| get format/vector
	lsrl	#3,d0			| convert to index
	lea	_exframesize,a6		|  into exframesize
	addl	d0,a6			|  to get pointer to correct entry
	movw	a6@,d0			| get size for this frame
	addql	#8,d0			| adjust for unaccounted for bytes
	lea	_kstackatbase,a6	| desired stack base
	subl	d0,a6			|   - frame size == our stack
	cmpl	a6,sp			| are we where we think?
	jeq	Ldorte2			| yes, skip it
	lea	tmpstk,a6		| will be using tmpstk
	movl	sp@(4),a6@-		| copy common
	movl	sp@,a6@-		|   frame info
	clrl	a6@-
	movl	sp,a6@-			| save sp
	subql	#4,a6			| skip over already saved a6
	moveml	#0x7FFC,a6@-		| push remaining regs (d0/a6/a7 done)
	lea	a6@(-4),sp		| switch to tmpstk (skip saved d0)
	clrl	sp@-			| is an underflow
	jbsr	_badkstack		| badkstack(0, frame)
	addql	#4,sp
	moveml	sp@+,#0x7FFF		| restore most registers
	movl	sp@,sp			| and SP
	rte
Ldorte2:
	movl	tmpstk-76,d0
	movl	tmpstk-20,a6
Ldorte1:
#endif
	rte				| real return

/*
 * Kernel access to the current processes kernel stack is via a fixed
 * virtual address.  It is at the same address as in the users VA space.
 * Umap contains the KVA of the first of UPAGES PTEs mapping VA _kstack.
 */
	.data
	.set	_kstack,KERNELSTACK	| KERNELSTACK(0x3ff00000) != USRSTACK
_Umap:	.long	0
	.globl	_kstack, _Umap

/*
 * Initialization
 *
 * Kernel is loaded at 0.
 * VBR contains zero from ROM.  Exceptions will continue to vector
 * through ROM until MMU is turned on at which time they will vector
 * through our table (vectors.s).
 */
	.comm	_lowram,4

	.text
	.globl	_edata
	.globl	_etext,_end
	.globl	start
start:
	movw	#PSL_HIGHIPL,sr		| no interrupts
	lea	tmpstk,sp		| give ourselves a temporary stack 
	clrl	d0			| XXXX if loader set vbr = 0 
	movc	d0,vbr			| XXXX please remove these 2 lines
/* 
 * a5 contains parameters address from booter.
 * First, we copy whole parameters to Kernel InterFace Field
 */

	movl	#KIFF_SIZE,sp@-		| KIFF size
	pea	_KernInter		| KIFF address
	pea	a5@			| bootor's KIFF address
	jbsr	_bcopy
	lea	sp@(12),sp		| pop value args

	movl	a5@(KI_MAXADDR),d0	| maxaddr
	moveq	#PGSHIFT,d1
	lsrl	d1,d0			| convert to page (click) number
	movl	d0,_maxmem		| argument saved in maxmem
	movl	d0,_physmem		| physmem = maxmem
	clrl	_lowram			| lowram = 0
	movl	#0,a5			| kernel is loaded at 0
	movl	#CACHE_OFF,d0
	movc	d0,cacr			| clear and disable on-chip cache(s)

#if defined(LUNA2)
/* determine our CPU/MMU combo - check for all regardless of kernel config */
	movl	#0x200,d0		| data freeze bit
	movc	d0,cacr			|   only exists on 68030
	movc	cacr,d0			| read it back
	tstl	d0			| zero?
	jeq	Lnot68030		| yes, we have 68040(LUNA2)
	movl	#1,_machineid		| no, must be a LUNA-I
	movl	#-1,_mmutype		| set to reflect 68030 PMMU
	jra	Lstart1
Lnot68030:
	movl	#2,_machineid		| must be a LUNA-II
	movl	#-2,_mmutype		| set to reflect 68040 MMU
#ifdef HPFPLIB
	movl	#3,_processor		| HP-UX style processor id
#endif
Lstart1:
#endif
/* set 60 to hz, when running LUNA-I */
	.globl	_modify_clock_param
	jbsr	_modify_clock_param

/* initialize source/destination control registers for movs */
	moveq	#FC_USERD,d0		| user space
	movc	d0,sfc			|   as source
	movc	d0,dfc			|   and destination of transfers
	
/*
 * LUNA  PIO initialization.
 */
	movw	PIO0_A,d0		| dipsw-1,2 (from port A&B)
	movw	d0,_dipswitch

/* configure kernel and proc0 VA space so we can get going */
	.globl	_Sysseg, _pmap_bootstrap, _avail_start
	movl	#_end,d5		| end of static kernel text/data
	addl	#NBPG-1,d5
	andl	#PG_FRAME,d5		| round to a page
	movl	d5,a4			| PA=VA
	pea	a5@			| firstpa
	pea	a4@			| nextpa
	jbsr	_pmap_bootstrap		| bootstrap(firstpa, nextpa)
	addql	#8,sp

/*
 * Prepare to enable MMU.
 */
	movl	_Sysseg,d1		| system segment table addr read value (a KVA)
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmotommu1		| no, skip
	
	.long	0x4e7b1807		| movc d1,srp
/* we must set tt-registers here */
	movl	#0x403FA040,d0		| tt0 for LUNA2 0x40000000-0x7fffffff
	.long	0x4e7b0004		| movc d0,itt0
	.long	0x4e7b0006		| movc d0,dtt0
	movl	#0x807FA040,d0		| tt1 for LUNA2 0x80000000-0xffffffff
	.long	0x4e7b0005		| movc d0,itt1
	.long	0x4e7b0007		| movc d0,dtt1
	.word	0xf4d8			| cinva bc
	.word	0xf518			| pflusha
	movl	#0x8000,d0
	.long	0x4e7b0003		| movc d0,tc
	movl	#0x80008000,d0
	movc	d0,cacr			| turn on both caches
	jmp	Lenab1
Lmotommu1:
#endif
	lea	_protorp,a0
	movl	#0x80000202,a0@		| nolimit + share global + 4 byte PTEs
	movl	d1,a0@(4)		| + segtable address
	pmove	a0@,srp			| load the supervisor root pointer
	movl	#0x80000002,a0@		| reinit upper half for CRP loads
/* we must set tt-registers here */
	lea	_protott0,a0		| tt0 for LUNA1 0x40000000-0x7fffffff
	.word	0xf010			| pmove	a0@,mmutt0
	.word	0x0800
	lea	_protott1,a0		| tt1 for LUNA1 0x80000000-0xffffffff
	.word	0xf010			| pmove	a0@,mmutt1
	.word	0x0c00
	lea	_mapping_tc,a2
	movl	#0x82c0aa00,a2@		| value to load TC with
	pmove	a2@,tc			| load it

/*
 * Should be running mapped from this point on
 */
Lenab1:
#ifdef FPCOPROC
/* fpp check */
	movl	a1,sp@-
	jbsr	_checkfpp		| check fpp
	frestore _fppnull		| reset
	movl	sp@+,a1
#endif
/* select the software page size now */
	lea	tmpstk,sp		| temporary stack
	jbsr	_vm_set_page_size	| select software page size
/* set kernel stack, user SP, and initial pcb */
	lea	_kstack,a1		| proc0 kernel stack
	lea	a1@(UPAGES*NBPG-4),sp	| set kernel stack to end of area
	movl	#USRSTACK-4,a2
	movl	a2,usp			| init user SP
	movl	_proc0paddr,a1		| get proc0 pcb addr
	movl	a1,_curpcb		| proc0 is running
#ifdef FPCOPROC
	clrl	a1@(PCB_FPCTX)		| ensure null FP context
	movl	a1,sp@-
	jbsr	_m68881_restore		| restore it (does not kill a1)
	addql	#4,sp
#endif
/* flush TLB and turn on caches */
	jbsr	_TBIA			| invalidate TLB
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jeq	Lnocache0		| yes, cache already on
#endif
	movl	#CACHE_ON,d0
	movc	d0,cacr			| clear cache(s)
Lnocache0:
/* final setup for C code */
	movw	#PSL_LOWIPL,sr		| lower SPL
	movl	d7,_boothowto		| save reboot flags
	movl	d6,_bootdev		|   and boot device
/*
 * Create a fake exception frame that returns to user mode,
 * make space for the rest of a fake saved register set, and
 * pass the first available RAM and a pointer to the register
 * set to "main()".  "main()" will call "icode()", which fakes
 * an "execve()" system call, which is why we need to do that
 * ("main()" sets "u.u_ar0" to point to the register set).
 * When "main()" returns, we're running in process 1 and have
 * successfully faked the "execve()".  We load up the registers from
 * that set; the "rte" loads the PC and PSR, which jumps to "init".
 */
  	clrw	sp@-			| vector offset/frame type
	clrl	sp@-			| PC - filled in by "execve"
  	movw	#PSL_USER,sp@-		| in user mode
	clrw	sp@-			| pad SR to longword
	lea	sp@(-64),sp		| construct space for D0-D7/A0-A7
	pea	sp@			| addr of space for D0
	jbsr	_main			| main(firstaddr, r0)
	addql	#4,sp			| pop args
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lnoflush		| no, skip
	.word	0xf478			| cpusha dc
	.word	0xf498			| cinva ic
Lnoflush:
#endif
	movl	sp@(60),a0		| grab and load
	movl	a0,usp			|   user SP
	moveml	sp@+,#0x7FFF		| load most registers (all but SSP)
	addql	#6,sp			| pop SSP and align word
  	rte

/*
 * Signal "trampoline" code (18 bytes).  Invoked from RTE setup by sendsig().
 * 
 * Stack looks like:
 *
 *	sp+0 ->	signal number
 *	sp+4	signal specific code
 *	sp+8	pointer to signal context frame (scp)
 *	sp+12	address of handler
 *	sp+16	saved hardware state
 *			.
 *			.
 *	scp+0->	beginning of signal context frame
 */
	.globl	_sigcode, _esigcode, _sigcodetrap
	.data
_sigcode:
	movl	sp@(12),a0		| signal handler addr	(4 bytes)
	jsr	a0@			| call signal handler	(2 bytes)
	addql	#4,sp			| pop signo		(2 bytes)
_sigcodetrap:
	trap	#1			| special syscall entry	(2 bytes)
	movl	d0,sp@(4)		| save errno		(4 bytes)
	moveq	#1,d0			| syscall == exit	(2 bytes)
	trap	#0			| exit(errno)		(2 bytes)
	.align	2
_esigcode:

/*
 * Primitives
 */ 

#ifdef __STDC__
#define EXPORT(name)		.globl _ ## name; _ ## name:
#else
#define EXPORT(name)		.globl _/**/name; _/**/name:
#endif
#ifdef GPROF
#if __GNUC__ >= 2
#define		ENTRY(name)		EXPORT(name) link a6,\#0; jbsr mcount; unlk a6
#else
#define		ENTRY(name)		EXPORT(name) link a6,#0; jbsr mcount; unlk a6
#endif
#define ALTENTRY(name, rname) ENTRY(name); jra rname+12
#else
#define		ENTRY(name)		EXPORT(name)
#define ALTENTRY(name, rname)		ENTRY(name)
#endif

/*
 * For gcc2
 */
ENTRY(__main)
	rts

/*
 * copypage(fromaddr, toaddr)
 *
 * Optimized version of bcopy for a single page-aligned NBPG byte copy.
 */
ENTRY(copypage)
	movl	sp@(4),a0		| source address
	movl	sp@(8),a1		| destination address
	movl	#NBPG/32,d0		| number of 32 byte chunks
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmlloop			| no, use movl
Lm16loop:
	.long	0xf6209000		| move16 a0@+,a1@+
	.long	0xf6209000		| move16 a0@+,a1@+
	subql	#1,d0
	jne	Lm16loop
	rts
#endif
Lmlloop:
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	movl	a0@+,a1@+
	subql	#1,d0
	jne	Lmlloop
	rts

/*
 * copyinstr(fromaddr, toaddr, maxlength, &lencopied)
 *
 * Copy a null terminated string from the user address space into
 * the kernel address space.
 *
 * NOTE: maxlength must be < 64K (due to use of DBcc)
 */
ENTRY(copyinstr)
	movl	_curpcb,a0		| current pcb
	movl	#Lcisflt1,a0@(PCB_ONFAULT) | set up to catch faults
	movl	sp@(4),a0		| a0 = fromaddr
	movl	sp@(8),a1		| a1 = toaddr
	moveq	#0,d0
	movw	sp@(14),d0		| d0 = maxlength
	jlt	Lcisflt1		| negative count, error
	jeq	Lcisdone		| zero count, all done
	subql	#1,d0			| set up for dbeq
Lcisloop:
	movsb	a0@+,d1			| grab a byte
	nop
	movb	d1,a1@+			| copy it
	dbeq	d0,Lcisloop		| if !null and more, continue
	jne	Lcisflt2		| ran out of room, error
	moveq	#0,d0			| got a null, all done
Lcisdone:
	tstl	sp@(16)			| return length desired?
	jeq	Lcisret			| no, just return
	subl	sp@(4),a0		| determine how much was copied
	movl	sp@(16),a1		| return location
	movl	a0,a1@			| stash it
Lcisret:
	movl	_curpcb,a0		| current pcb
	clrl	a0@(PCB_ONFAULT) 	| clear fault addr
	rts
Lcisflt1:
	moveq	#EFAULT,d0		| copy fault
	jra	Lcisdone
Lcisflt2:
	moveq	#ENAMETOOLONG,d0	| ran out of space
	jra	Lcisdone	

/*
 * copyoutstr(fromaddr, toaddr, maxlength, &lencopied)
 *
 * Copy a null terminated string from the kernel
 * address space to the user address space.
 * NOTE: maxlength must be < 64K
 */
ENTRY(copyoutstr)
	movl	_curpcb,a0		| current pcb
	movl	#Lcosflt1,a0@(PCB_ONFAULT) | set up to catch faults
	movl	sp@(4),a0		| a0 = fromaddr
	movl	sp@(8),a1		| a1 = toaddr
	moveq	#0,d0
	movw	sp@(14),d0		| d0 = maxlength
	jlt	Lcosflt1		| negative count, error
	jeq	Lcosdone		| zero count, all done
	subql	#1,d0			| set up for dbeq
Lcosloop:
	movb	a0@+,d1			| grab a byte
	movsb	d1,a1@+			| copy it
	nop
	dbeq	d0,Lcosloop		| if !null and more, continue
	jne	Lcosflt2		| ran out of room, error
	moveq	#0,d0			| got a null, all done
Lcosdone:
	tstl	sp@(16)			| return length desired?
	jeq	Lcosret			| no, just return
	subl	sp@(4),a0		| determine how much was copied
	movl	sp@(16),a1		| return location
	movl	a0,a1@			| stash it
Lcosret:
	movl	_curpcb,a0		| current pcb
	clrl	a0@(PCB_ONFAULT) 	| clear fault addr
	rts
Lcosflt1:
	moveq	#EFAULT,d0		| copy fault
	jra	Lcosdone
Lcosflt2:
	moveq	#ENAMETOOLONG,d0	| ran out of space
	jra	Lcosdone	

/*
 * copystr(fromaddr, toaddr, maxlength, &lencopied)
 *
 * Copy a null terminated string from one point to another in
 * the kernel address space.
 *
 * NOTE: maxlength must be < 64K (due to use of DBcc)
 */
ENTRY(copystr)
	movl	sp@(4),a0		| a0 = fromaddr
	movl	sp@(8),a1		| a1 = toaddr
	moveq	#0,d0
	movw	sp@(14),d0		| d0 = maxlength
	jlt	Lcsflt1			| negative count, error
	jeq	Lcsdone			| zero count, all done
	subql	#1,d0			| set up for dbeq
Lcsloop:
	movb	a0@+,a1@+		| copy a byte
	dbeq	d0,Lcsloop		| if !null and more, continue
	jne	Lcsflt2			| ran out of room, error
	moveq	#0,d0			| got a null, all done
Lcsdone:
	tstl	sp@(16)			| return length desired?
	jeq	Lcsret			| no, just return
	subl	sp@(4),a0		| determine how much was copied
	movl	sp@(16),a1		| return location
	movl	a0,a1@			| stash it
Lcsret:
	rts
Lcsflt1:
	moveq	#EFAULT,d0		| copy fault
	jra	Lcsdone
Lcsflt2:
	moveq	#ENAMETOOLONG,d0	| ran out of space
	jra	Lcsdone	

/* 
 * Copyin(from_user, to_kernel, len)
 * Copyout(from_kernel, to_user, len)
 *
 * Copy specified amount of data between kernel and user space.
 *
 * XXX both use the DBcc instruction which has 16-bit limitation so only
 * 64k units can be copied, where "unit" is either a byte or a longword
 * depending on alignment.  To be safe, assume it can copy at most
 * 64k bytes.  Don't make MAXBSIZE or MAXPHYS larger than 64k without
 * fixing this code!
 */
ENTRY(copyin)
	movl	sp@(12),d0		| get size
#ifdef MAPPEDCOPY
	.globl	_mappedcopysize,_mappedcopyin
	cmpl	_mappedcopysize,d0	| size >= mappedcopysize
	jcc	_mappedcopyin		| yes, go do it the new way
#endif
	movl	d2,sp@-			| scratch register
	movl	_curpcb,a0		| current pcb
	movl	#Lciflt,a0@(PCB_ONFAULT) | set up to catch faults
	tstl	d0			| check count
	jlt	Lciflt			| negative, error
	jeq	Lcidone			| zero, done
	movl	sp@(8),a0		| src address
	movl	sp@(12),a1		| dest address
	movl	a0,d2
	btst	#0,d2			| src address odd?
	jeq	Lcieven			| no, go check dest
	movsb	a0@+,d1			| yes, get a byte
	nop
	movb	d1,a1@+			| put a byte
	subql	#1,d0			| adjust count
	jeq	Lcidone			| exit if done
Lcieven:
	movl	a1,d2
	btst	#0,d2			| dest address odd?
	jne	Lcibloop		| yes, must copy by bytes
	movl	d0,d2			| no, get count
	lsrl	#2,d2			| convert to longwords
	jeq	Lcibloop		| no longwords, copy bytes
Lcilloop:
	movsl	a0@+,d1			| get a long
	nop
	movl	d1,a1@+			| put a long
	subql	#1,d2
	jne	Lcilloop		| til done
	andl	#3,d0			| what remains
	jeq	Lcidone			| all done
Lcibloop:
	movsb	a0@+,d1			| get a byte
	nop
	movb	d1,a1@+			| put a byte
	subql	#1,d0
	jne	Lcibloop		| til done
Lcidone:
	movl	_curpcb,a0		| current pcb
	clrl	a0@(PCB_ONFAULT) 	| clear fault catcher
	movl	sp@+,d2			| restore scratch reg
	rts
Lciflt:
	moveq	#EFAULT,d0		| got a fault
	jra	Lcidone

ENTRY(copyout)
	movl	sp@(12),d0		| get size
#ifdef MAPPEDCOPY
	.globl	_mappedcopysize,_mappedcopyout
	cmpl	_mappedcopysize,d0	| size >= mappedcopysize
	jcc	_mappedcopyout		| yes, go do it the new way
#endif
	movl	d2,sp@-			| scratch register
	movl	_curpcb,a0		| current pcb
	movl	#Lcoflt,a0@(PCB_ONFAULT) | catch faults
	tstl	d0			| check count
	jlt	Lcoflt			| negative, error
	jeq	Lcodone			| zero, done
	movl	sp@(8),a0		| src address
	movl	sp@(12),a1		| dest address
	movl	a0,d2
	btst	#0,d2			| src address odd?
	jeq	Lcoeven			| no, go check dest
	movb	a0@+,d1			| yes, get a byte
	movsb	d1,a1@+			| put a byte
	nop
	subql	#1,d0			| adjust count
	jeq	Lcodone			| exit if done
Lcoeven:
	movl	a1,d2
	btst	#0,d2			| dest address odd?
	jne	Lcobloop		| yes, must copy by bytes
	movl	d0,d2			| no, get count
	lsrl	#2,d2			| convert to longwords
	jeq	Lcobloop		| no longwords, copy bytes
Lcolloop:
	movl	a0@+,d1			| get a long
	movsl	d1,a1@+			| put a long
	nop
	subql	#1,d2
	jne	Lcolloop		| til done
	andl	#3,d0			| what remains
	jeq	Lcodone			| all done
Lcobloop:
	movb	a0@+,d1			| get a byte
	movsb	d1,a1@+			| put a byte
	nop
	subql	#1,d0
	jne	Lcobloop		| til done
Lcodone:
	movl	_curpcb,a0		| current pcb
	clrl	a0@(PCB_ONFAULT) 	| clear fault catcher
	movl	sp@+,d2			| restore scratch reg
	rts
Lcoflt:
	moveq	#EFAULT,d0		| got a fault
	jra	Lcodone

/*
 * non-local gotos
 */
ENTRY(setjmp)
	movl	sp@(4),a0	| savearea pointer
	moveml	#0xFCFC,a0@	| save d2-d7/a2-a7
	movl	sp@,a0@(48)	| and return address
	moveq	#0,d0		| return 0
	rts

ENTRY(longjmp)
	movl	sp@(4),a0
	moveml	a0@+,#0xFCFC
	movl	a0@,sp@
	moveq	#1,d0
	rts

/*
 * The following primitives manipulate the run queues.  _whichqs tells which
 * of the 32 queues _qs have processes in them.  Setrunqueue puts processes
 * into queues, Remrq removes them from queues.  The running process is on
 * no queue, other processes are on a queue related to p->p_priority, divided
 * by 4 actually to shrink the 0-127 range of priorities into the 32 available
 * queues.
 */

	.globl	_whichqs,_qs,_cnt,_panic
	.globl	_curproc,_want_resched

/*
 * Setrunqueue(p)
 *
 * Call should be made at spl6(), and p->p_stat should be SRUN
 */
ENTRY(setrunqueue)
	movl	sp@(4),a0
	tstl	a0@(P_BACK)
	jeq	Lset1
	movl	#Lset2,sp@-
	jbsr	_panic
Lset1:
	clrl	d0
	movb	a0@(P_PRIORITY),d0
	lsrb	#2,d0
	movl	_whichqs,d1
	bset	d0,d1
	movl	d1,_whichqs
	lslb	#3,d0
	addl	#_qs,d0
	movl	d0,a0@(P_FORW)
	movl	d0,a1
	movl	a1@(P_BACK),a0@(P_BACK)
	movl	a0,a1@(P_BACK)
	movl	a0@(P_BACK),a1
	movl	a0,a1@(P_FORW)
	rts

Lset2:
	.asciz	"setrunqueue"
	.even

/*
 * Remrq(p)
 *
 * Call should be made at spl6().
 */
ENTRY(remrq)
	movl	sp@(4),a0
	clrl	d0
	movb	a0@(P_PRIORITY),d0
	lsrb	#2,d0
	movl	_whichqs,d1
	bclr	d0,d1
	jne	Lrem1
	movl	#Lrem3,sp@-
	jbsr	_panic
Lrem1:
	movl	d1,_whichqs
	movl	a0@(P_FORW),a1
	movl	a0@(P_BACK),a1@(P_BACK)
	movl	a0@(P_BACK),a1
	movl	a0@(P_FORW),a1@(P_FORW)
	movl	#_qs,a1
	movl	d0,d1
	lslb	#3,d1
	addl	d1,a1
	cmpl	a1@(P_FORW),a1
	jeq	Lrem2
	movl	_whichqs,d1
	bset	d0,d1
	movl	d1,_whichqs
Lrem2:
	clrl	a0@(P_BACK)
	rts

Lrem3:
	.asciz	"remrq"
Lsw0:
	.asciz	"switch"
	.even

	.globl	_curpcb
	.globl	_masterpaddr	| XXX compatibility (debuggers)
	.data
_masterpaddr:			| XXX compatibility (debuggers)
_curpcb:
	.long	0
mdpflag:
	.byte	0		| copy of proc md_flags low byte
	.align	2
	.comm	nullpcb,SIZEOF_PCB
	.text

/*
 * At exit of a process, do a switch for the last time.
 * The mapping of the pcb at p->p_addr has already been deleted,
 * and the memory for the pcb+stack has been freed.
 * The ipl is high enough to prevent the memory from being reallocated.
 */
ENTRY(switch_exit)
	movl	#nullpcb,_curpcb	| save state into garbage pcb
	lea	tmpstk,sp		| goto a tmp stack
	jra	_cpu_switch

/*
 * When no processes are on the runq, Swtch branches to Idle
 * to wait for something to come ready.
 */
	.globl	idle
idle:
	stop	#PSL_LOWIPL
Idle:
	movw	#PSL_HIGHIPL,sr
	tstl	_whichqs
	jeq	idle
	movw	#PSL_LOWIPL,sr
	jra	Lsw1

Lbadsw:
	movl	#Lsw0,sp@-
	jbsr	_panic
	/*NOTREACHED*/

/*
 * cpu_switch()
 *
 * NOTE: On the mc68851 (318/319/330) we attempt to avoid flushing the
 * entire ATC.  The effort involved in selective flushing may not be
 * worth it, maybe we should just flush the whole thing?
 *
 * NOTE 2: With the new VM layout we now no longer know if an inactive
 * user's PTEs have been changed (formerly denoted by the SPTECHG p_flag
 * bit).  For now, we just always flush the full ATC.
 */
ENTRY(cpu_switch)
	movl	_curpcb,a0		| current pcb
	movw	sr,a0@(PCB_PS)		| save sr before changing ipl
#ifdef notyet
	movl	_curproc,sp@-		| remember last proc running
#endif
	clrl	_curproc
	addql	#1,_cnt+V_SWTCH

Lsw1:
	/*
	 * Find the highest-priority queue that isn't empty,
	 * then take the first proc from that queue.
	 */
	clrl	d0
	lea	_whichqs,a0
	movl	a0@,d1
Lswchk:
	btst	d0,d1
	jne	Lswfnd
	addqb	#1,d0
	cmpb	#32,d0
	jne	Lswchk
	jra	Idle
Lswfnd:
	movw	#PSL_HIGHIPL,sr		| lock out interrupts
	movl	a0@,d1			| and check again...
	bclr	d0,d1
	jeq	Lsw1			| proc moved, rescan
	movl	d1,a0@			| update whichqs
	moveq	#1,d1			| double check for higher priority
	lsll	d0,d1			| process (which may have snuck in
	subql	#1,d1			| while we were finding this one)
	andl	a0@,d1
	jeq	Lswok			| no one got in, continue
	movl	a0@,d1
	bset	d0,d1			| otherwise put this one back
	movl	d1,a0@
	jra	Lsw1			| and rescan
Lswok:
	movl	d0,d1
	lslb	#3,d1			| convert queue number to index
	addl	#_qs,d1			| locate queue (q)
	movl	d1,a1
	cmpl	a1@(P_FORW),a1		| anyone on queue?
	jeq	Lbadsw			| no, panic
	movl	a1@(P_FORW),a0		| p = q->p_forw
	movl	a0@(P_FORW),a1@(P_FORW)	| q->p_forw = p->p_forw
	movl	a0@(P_FORW),a1		| q = p->p_forw
	movl	a0@(P_BACK),a1@(P_BACK)	| q->p_back = p->p_back
	cmpl	a0@(P_FORW),d1		| anyone left on queue?
	jeq	Lsw2			| no, skip
	movl	_whichqs,d1
	bset	d0,d1			| yes, reset bit
	movl	d1,_whichqs
Lsw2:
	movl	a0,_curproc
	clrl	_want_resched
#ifdef notyet
	movl	sp@+,a1
	cmpl	a0,a1			| switching to same proc?
	jeq	Lswdone			| yes, skip save and restore
#endif
	/*
	 * Save state of previous process in its pcb.
	 */
	movl	_curpcb,a1
	moveml	#0xFCFC,a1@(PCB_REGS)	| save non-scratch registers
	movl	usp,a2			| grab USP (a2 has been saved)
	movl	a2,a1@(PCB_USP)		| and save it
#ifdef FPCOPROC
	lea	a1@(PCB_FPCTX),a2	| pointer to FP save area
	fsave	a2@			| save FP state
	tstb	a2@			| null state frame?
	jeq	Lswnofpsave		| yes, all done
	fmovem	fp0-fp7,a2@(216)	| save FP general registers
	fmovem	fpcr/fpsr/fpi,a2@(312)	| save FP control registers
Lswnofpsave:
#endif

#ifdef DIAGNOSTIC
	tstl	a0@(P_WCHAN)
	jne	Lbadsw
	cmpb	#SRUN,a0@(P_STAT)
	jne	Lbadsw
#endif
	clrl	a0@(P_BACK)		| clear back link
	movb	a0@(P_MDFLAG+3),mdpflag	| low byte of p_md.md_flags
	movl	a0@(P_ADDR),a1		| get p_addr
	movl	a1,_curpcb

	/* see if pmap_activate needs to be called; should remove this */
	movl	a0@(P_VMSPACE),a0	| vmspace = p->p_vmspace
#ifdef DIAGNOSTIC
	tstl	a0			| map == VM_MAP_NULL?
	jeq	Lbadsw			| panic
#endif
	lea	a0@(VM_PMAP),a0		| pmap = &vmspace.vm_pmap
	tstl	a0@(PM_STCHG)		| pmap->st_changed?
	jeq	Lswnochg		| no, skip
	pea	a1@			| push pcb (at p_addr)
	pea	a0@			| push pmap
	jbsr	_pmap_activate		| pmap_activate(pmap, pcb)
	addql	#8,sp
	movl	_curpcb,a1		| restore p_addr
Lswnochg:

	movl	#PGSHIFT,d1
	movl	a1,d0
	lsrl	d1,d0			| convert p_addr to page number
	lsll	#2,d0			| and now to Sysmap offset
	addl	_Sysmap,d0		| add Sysmap base to get PTE addr
#ifdef notdef
	movw	#PSL_HIGHIPL,sr		| go crit while changing PTEs
#endif
	lea	tmpstk,sp		| now goto a tmp stack for NMI
	movl	d0,a0			| address of new context
	movl	_Umap,a2		| address of PTEs for kstack
	moveq	#UPAGES-1,d0		| sizeof kstack
Lres1:
	movl	a0@+,d1			| get PTE
	andl	#~PG_PROT,d1		| mask out old protection
	orl	#PG_RW+PG_V,d1		| ensure valid and writable
	movl	d1,a2@+			| load it up
	dbf	d0,Lres1		| til done
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lres1a			| no, skip
	.word	0xf518			| yes, pflusha
	movl	a1@(PCB_USTP),d0	| get USTP
	moveq	#PGSHIFT,d1
	lsll	d1,d0			| convert to addr
	.long	0x4e7b0806		| movc d0,urp
	jra	Lcxswdone
Lres1a:
#endif
	movl	#CACHE_CLR,d0
	movc	d0,cacr			| invalidate cache(s)
	pflusha				| flush entire TLB
	movl	a1@(PCB_USTP),d0	| get USTP
	moveq	#PGSHIFT,d1
	lsll	d1,d0			| convert to addr
	lea	_protorp,a0		| CRP prototype
	movl	d0,a0@(4)		| stash USTP
	pmove	a0@,crp			| load new user root pointer
Lcxswdone:
	moveml	a1@(PCB_REGS),#0xFCFC	| and registers
	movl	a1@(PCB_USP),a0
	movl	a0,usp			| and USP
#ifdef FPCOPROC
	lea	a1@(PCB_FPCTX),a0	| pointer to FP save area
	tstb	a0@			| null state frame?
	jeq	Lresfprest		| yes, easy
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lresnot040		| no, skip
	clrl	sp@-			| yes...
	frestore sp@+			| ...magic!
Lresnot040:
#endif
	fmovem	a0@(312),fpcr/fpsr/fpi	| restore FP control registers
	fmovem	a0@(216),fp0-fp7	| restore FP general registers
Lresfprest:
	frestore a0@			| restore state
#endif
	movw	a1@(PCB_PS),sr		| no, restore PS
	moveq	#1,d0			| return 1 (for alternate returns)
	rts

/*
 * savectx(pcb, altreturn)
 * Update pcb, saving current processor state and arranging
 * for alternate return ala longjmp in switch if altreturn is true.
 */
ENTRY(savectx)
	movl	sp@(4),a1
	movw	sr,a1@(PCB_PS)
	movl	usp,a0			| grab USP
	movl	a0,a1@(PCB_USP)		| and save it
	moveml	#0xFCFC,a1@(PCB_REGS)	| save non-scratch registers
#ifdef FPCOPROC
	lea	a1@(PCB_FPCTX),a0	| pointer to FP save area
	fsave	a0@			| save FP state
	tstb	a0@			| null state frame?
	jeq	Lsvnofpsave		| yes, all done
	fmovem	fp0-fp7,a0@(216)	| save FP general registers
	fmovem	fpcr/fpsr/fpi,a0@(312)	| save FP control registers
Lsvnofpsave:
#endif
	tstl	sp@(8)			| altreturn?
	jeq	Lsavedone
	movl	sp,d0			| relocate current sp relative to a1
	subl	#_kstack,d0		|   (sp is relative to kstack):
	addl	d0,a1			|   a1 += sp - kstack;
	movl	sp@,a1@			| write return pc at (relocated) sp@
Lsavedone:
	moveq	#0,d0			| return 0
	rts

/*
 * {fu,su},{byte,sword,word}
 */
ALTENTRY(fuiword, _fuword)
ENTRY(fuword)
	movl	sp@(4),a0		| address to read
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	movsl	a0@,d0			| do read from user space
	nop
	jra	Lfsdone

ENTRY(fusword)
	movl	sp@(4),a0
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	moveq	#0,d0
	movsw	a0@,d0			| do read from user space
	nop
	jra	Lfsdone

/* Just like fusword, but tells trap code not to page in. */
ENTRY(fuswintr)
	movl	sp@(4),a0
	movl	_curpcb,a1
	movl	#_fswintr,a1@(PCB_ONFAULT)
	moveq	#0,d0
	movsw	a0@,d0
	nop
	jra	Lfsdone

ALTENTRY(fuibyte, _fubyte)
ENTRY(fubyte)
	movl	sp@(4),a0		| address to read
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	moveq	#0,d0
	movsb	a0@,d0			| do read from user space
	nop
	jra	Lfsdone

Lfserr:
	moveq	#-1,d0			| error indicator
Lfsdone:
	clrl	a1@(PCB_ONFAULT) 	| clear fault address
	rts

/* Just like Lfserr, but the address is different (& exported). */
	.globl	_fswintr
_fswintr:
	moveq	#-1,d0
	jra	Lfsdone


/*
 * Write a longword in user instruction space.
 * Largely the same as suword but with a final i-cache purge on those
 * machines with split caches.
 */
ENTRY(suiword)
	movl	sp@(4),a0		| address to write
	movl	sp@(8),d0		| value to put there
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	movsl	d0,a0@			| do write to user space
	nop
	moveq	#0,d0			| indicate no fault
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lsuicpurge		| no, skip
	.word	0xf498			| cinva ic (XXX overkill)
	jra	Lfsdone
Lsuicpurge:
#endif
	movl	#IC_CLEAR,d1
	movc	d1,cacr			| invalidate i-cache
	jra	Lfsdone

ENTRY(suword)
	movl	sp@(4),a0		| address to write
	movl	sp@(8),d0		| value to put there
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	movsl	d0,a0@			| do write to user space
	nop
	moveq	#0,d0			| indicate no fault
	jra	Lfsdone

ENTRY(susword)
	movl	sp@(4),a0		| address to write
	movw	sp@(10),d0		| value to put there
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	movsw	d0,a0@			| do write to user space
	nop
	moveq	#0,d0			| indicate no fault
	jra	Lfsdone

ENTRY(suswintr)
	movl	sp@(4),a0
	movw	sp@(10),d0
	movl	_curpcb,a1
	movl	#_fswintr,a1@(PCB_ONFAULT)
	movsw	d0,a0@
	nop
	moveq	#0,d0
	jra	Lfsdone

ALTENTRY(suibyte, _subyte)
ENTRY(subyte)
	movl	sp@(4),a0		| address to write
	movb	sp@(11),d0		| value to put there
	movl	_curpcb,a1		| current pcb
	movl	#Lfserr,a1@(PCB_ONFAULT) | where to return to on a fault
	movsb	d0,a0@			| do write to user space
	nop
	moveq	#0,d0			| indicate no fault
	jra	Lfsdone

#if defined(LUNA2)
ENTRY(suline)
	movl	sp@(4),a0		| address to write
	movl	_curpcb,a1		| current pcb
	movl	#Lslerr,a1@(PCB_ONFAULT) | where to return to on a fault
	movl	sp@(8),a1		| address of line
	movl	a1@+,d0			| get lword
	movsl	d0,a0@+			| put lword
	nop				| sync
	movl	a1@+,d0			| get lword
	movsl	d0,a0@+			| put lword
	nop				| sync
	movl	a1@+,d0			| get lword
	movsl	d0,a0@+			| put lword
	nop				| sync
	movl	a1@+,d0			| get lword
	movsl	d0,a0@+			| put lword
	nop				| sync
	moveq	#0,d0			| indicate no fault
	jra	Lsldone
Lslerr:
	moveq	#-1,d0
Lsldone:
	movl	_curpcb,a1		| current pcb
	clrl	a1@(PCB_ONFAULT) 	| clear fault address
	rts
#endif

/*
 * Invalidate entire TLB.
 */
ENTRY(TBIA)
__TBIA:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmotommu3		| no, skip
	.word	0xf518			| yes, pflusha
	rts
Lmotommu3:
#endif
	pflusha				| flush entire TLB
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip d-cache
	rts

/*
 * Invalidate any TLB entry for given VA (TB Invalidate Single)
 */
ENTRY(TBIS)
#ifdef DEBUG
	tstl	fulltflush		| being conservative?
	jne	__TBIA			| yes, flush entire TLB
#endif
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmotommu4		| no, skip
	movl	sp@(4),a0
	movc	dfc,d1
	moveq	#1,d0			| user space
	movc	d0,dfc
	.word	0xf508			| pflush a0@
	moveq	#5,d0			| super space
	movc	d0,dfc
	.word	0xf508			| pflush a0@
	movc	d1,dfc
	rts
Lmotommu4:
#endif
	movl	sp@(4),a0		| get addr to flush
	pflush	#0,#0,a0@		| flush address from both sides
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip data cache
	rts

/*
 * Invalidate supervisor side of TLB
 */
ENTRY(TBIAS)
#ifdef DEBUG
	tstl	fulltflush		| being conservative?
	jne	__TBIA			| yes, flush everything
#endif
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmotommu5		| no, skip
	.word	0xf518			| yes, pflusha (for now) XXX
	rts
Lmotommu5:
#endif
	pflush #4,#4			| flush supervisor TLB entries
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip d-cache
	rts

/*
 * Invalidate user side of TLB
 */
ENTRY(TBIAU)
#ifdef DEBUG
	tstl	fulltflush		| being conservative?
	jne	__TBIA			| yes, flush everything
#endif
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	Lmotommu6		| no, skip
	.word	0xf518			| yes, pflusha (for now) XXX
	rts
Lmotommu6:
#endif
	pflush	#0,#4			| flush user TLB entries
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip d-cache
	rts

/*
 * Invalidate instruction cache
 */
ENTRY(ICIA)
#if defined(LUNA2)
ENTRY(ICPA)
	cmpl	#-2,_mmutype		| 68040
	jne	Lmotommu7		| no, skip
	.word	0xf498			| cinva ic
	rts
Lmotommu7:
#endif
	movl	#IC_CLEAR,d0
	movc	d0,cacr			| invalidate i-cache
	rts

/*
 * Invalidate data cache.
 * NOTE: we do not flush 68030 on-chip cache as there are no aliasing
 * problems with DC_WA.  The only cases we have to worry about are context
 * switch and TLB changes, both of which are handled "in-line" in resume
 * and TBI*.
 */
ENTRY(DCIA)
__DCIA:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040
	jne	Lmotommu8		| no, skip
	/* XXX implement */
	rts
Lmotommu8:
#endif
	rts

ENTRY(DCIS)
__DCIS:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040
	jne	Lmotommu9		| no, skip
	/* XXX implement */
	rts
Lmotommu9:
#endif
	rts

ENTRY(DCIU)
__DCIU:
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040
	jne	LmotommuA		| no, skip
	/* XXX implement */
	rts
LmotommuA:
#endif
	rts

#if defined(LUNA2)
ENTRY(ICPL)
	movl	sp@(4),a0		| address
	.word	0xf488			| cinvl ic,a0@
	rts
ENTRY(ICPP)
	movl	sp@(4),a0		| address
	.word	0xf490			| cinvp ic,a0@
	rts
ENTRY(DCPL)
	movl	sp@(4),a0		| address
	.word	0xf448			| cinvl dc,a0@
	rts
ENTRY(DCPP)
	movl	sp@(4),a0		| address
	.word	0xf450			| cinvp dc,a0@
	rts
ENTRY(DCPA)
	.word	0xf458			| cinva dc
	rts
ENTRY(DCFL)
	movl	sp@(4),a0		| address
	.word	0xf468			| cpushl dc,a0@
	rts
ENTRY(DCFP)
	movl	sp@(4),a0		| address
	.word	0xf470			| cpushp dc,a0@
	rts
#endif

ENTRY(PCIA)
#if defined(LUNA2)
ENTRY(DCFA)
	cmpl	#-2,_mmutype		| 68040
	jne	LmotommuB		| no, skip
	.word	0xf478			| cpusha dc
	rts
LmotommuB:
#endif
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip d-cache
	rts

#if 0 /****************************************************************/
/* external cache control */
ENTRY(ecacheon)
	rts

ENTRY(ecacheoff)
	rts
#endif /****************************************************************/

/*
 * Get callers current SP value.
 * Note that simply taking the address of a local variable in a C function
 * doesn't work because callee saved registers may be outside the stack frame
 * defined by A6 (e.g. GCC generated code).
 */
	.globl	_getsp
_getsp:
	movl	sp,d0			| get current SP
	addql	#4,d0			| compensate for return address
	rts

	.globl	_getsfc, _getdfc
_getsfc:
	movc	sfc,d0
	rts
_getdfc:
	movc	dfc,d0
	rts

/*
 * Load a new user segment table pointer.
 */
ENTRY(loadustp)
	movl	sp@(4),d0		| new USTP
	moveq	#PGSHIFT,d1
	lsll	d1,d0			| convert to addr
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	LmotommuC		| no, skip
	.long	0x4e7b0806		| movc d0,urp
	rts
LmotommuC:
#endif
	lea	_protorp,a0		| CRP prototype
	movl	d0,a0@(4)		| stash USTP
	pmove	a0@,crp			| load root pointer
	movl	#DC_CLEAR,d0
	movc	d0,cacr			| invalidate on-chip d-cache
	rts

ENTRY(ploadw)
	movl	sp@(4),a0		| address to load
	ploadw	#1,a0@			| pre-load translation
	rts

/*
 * Set processor priority level calls.  Most are implemented with
 * inline asm expansions.  However, spl0 requires special handling
 * as we need to check for our emulated software interrupts.
 */

ENTRY(spl0)
	moveq	#0,d0
	movw	sr,d0			| get old SR for return
	movw	#PSL_LOWIPL,sr		| restore new SR
	tstb	_ssir			| software interrupt pending?
	jeq	Lspldone		| no, all done
	subql	#4,sp			| make room for RTE frame
	movl	sp@(4),sp@(2)		| position return address
	clrw	sp@(6)			| set frame type 0
	movw	#PSL_LOWIPL,sp@		| and new SR
	jra	Lgotsir			| go handle it
Lspldone:
	rts

ENTRY(_insque)
	movw	sr,d0
	movw	#PSL_HIGHIPL,sr		| atomic
	movl	sp@(8),a0		| where to insert (after)
	movl	sp@(4),a1		| element to insert (e)
	movl	a0@,a1@			| e->next = after->next
	movl	a0,a1@(4)		| e->prev = after
	movl	a1,a0@			| after->next = e
	movl	a1@,a0
	movl	a1,a0@(4)		| e->next->prev = e
	movw	d0,sr
	rts

ENTRY(_remque)
	movw	sr,d0
	movw	#PSL_HIGHIPL,sr		| atomic
	movl	sp@(4),a0		| element to remove (e)
	movl	a0@,a1
	movl	a0@(4),a0
	movl	a0,a1@(4)		| e->next->prev = e->prev
	movl	a1,a0@			| e->prev->next = e->next
	movw	d0,sr
	rts

/*
 * bzero(addr, count)
 */
ALTENTRY(blkclr, _bzero)
ENTRY(bzero)
	movl	sp@(4),a0	| address
	movl	sp@(8),d0	| count
	jeq	Lbzdone		| if zero, nothing to do
	movl	a0,d1
	btst	#0,d1		| address odd?
	jeq	Lbzeven		| no, can copy words
	clrb	a0@+		| yes, zero byte to get to even boundary
	subql	#1,d0		| decrement count
	jeq	Lbzdone		| none left, all done
Lbzeven:
	movl	d0,d1
	andl	#31,d0
	lsrl	#5,d1		| convert count to 8*longword count
	jeq	Lbzbyte		| no such blocks, zero byte at a time
Lbzloop:
	clrl	a0@+; clrl	a0@+; clrl	a0@+; clrl	a0@+;
	clrl	a0@+; clrl	a0@+; clrl	a0@+; clrl	a0@+;
	subql	#1,d1		| one more block zeroed
	jne	Lbzloop		| more to go, do it
	tstl	d0		| partial block left?
	jeq	Lbzdone		| no, all done
Lbzbyte:
	clrb	a0@+
	subql	#1,d0		| one more byte cleared
	jne	Lbzbyte		| more to go, do it
Lbzdone:
	rts

/*
 * strlen(str)
 */
ENTRY(strlen)
	moveq	#-1,d0
	movl	sp@(4),a0	| string
Lslloop:
	addql	#1,d0		| increment count
	tstb	a0@+		| null?
	jne	Lslloop		| no, keep going
	rts

/*
 * bcmp(s1, s2, len)
 *
 * WARNING!  This guy only works with counts up to 64K
 */
ENTRY(bcmp)
	movl	sp@(4),a0		| string 1
	movl	sp@(8),a1		| string 2
	moveq	#0,d0
	movw	sp@(14),d0		| length
	jeq	Lcmpdone		| if zero, nothing to do
	subqw	#1,d0			| set up for DBcc loop
Lcmploop:
	cmpmb	a0@+,a1@+		| equal?
	dbne	d0,Lcmploop		| yes, keep going
	addqw	#1,d0			| +1 gives zero on match
Lcmpdone:
	rts
	
/*
 * {ov}bcopy(from, to, len)
 *
 * Works for counts up to 128K.
 */
ALTENTRY(ovbcopy, _bcopy)
ENTRY(bcopy)
	movl	sp@(12),d0		| get count
	jeq	Lcpyexit		| if zero, return
	movl	sp@(4),a0		| src address
	movl	sp@(8),a1		| dest address
	cmpl	a1,a0			| src before dest?
	jlt	Lcpyback		| yes, copy backwards (avoids overlap)
	movl	a0,d1
	btst	#0,d1			| src address odd?
	jeq	Lcfeven			| no, go check dest
	movb	a0@+,a1@+		| yes, copy a byte
	subql	#1,d0			| update count
	jeq	Lcpyexit		| exit if done
Lcfeven:
	movl	a1,d1
	btst	#0,d1			| dest address odd?
	jne	Lcfbyte			| yes, must copy by bytes
	movl	d0,d1			| no, get count
	lsrl	#2,d1			| convert to longwords
	jeq	Lcfbyte			| no longwords, copy bytes
	subql	#1,d1			| set up for dbf
Lcflloop:
	movl	a0@+,a1@+		| copy longwords
	dbf	d1,Lcflloop		| til done
	andl	#3,d0			| get remaining count
	jeq	Lcpyexit		| done if none
Lcfbyte:
	subql	#1,d0			| set up for dbf
Lcfbloop:
	movb	a0@+,a1@+		| copy bytes
	dbf	d0,Lcfbloop		| til done
Lcpyexit:
	rts
Lcpyback:
	addl	d0,a0			| add count to src
	addl	d0,a1			| add count to dest
	movl	a0,d1
	btst	#0,d1			| src address odd?
	jeq	Lcbeven			| no, go check dest
	movb	a0@-,a1@-		| yes, copy a byte
	subql	#1,d0			| update count
	jeq	Lcpyexit		| exit if done
Lcbeven:
	movl	a1,d1
	btst	#0,d1			| dest address odd?
	jne	Lcbbyte			| yes, must copy by bytes
	movl	d0,d1			| no, get count
	lsrl	#2,d1			| convert to longwords
	jeq	Lcbbyte			| no longwords, copy bytes
	subql	#1,d1			| set up for dbf
Lcblloop:
	movl	a0@-,a1@-		| copy longwords
	dbf	d1,Lcblloop		| til done
	andl	#3,d0			| get remaining count
	jeq	Lcpyexit		| done if none
Lcbbyte:
	subql	#1,d0			| set up for dbf
Lcbbloop:
	movb	a0@-,a1@-		| copy bytes
	dbf	d0,Lcbbloop		| til done
	rts

/*
 * Emulate fancy VAX string operations:
 *	scanc(count, startc, table, mask)
 *	skpc(mask, count, startc)
 *	locc(mask, count, startc)
 */
ENTRY(scanc)
	movl	sp@(4),d0	| get length
	jeq	Lscdone		| nothing to do, return
	movl	sp@(8),a0	| start of scan
	movl	sp@(12),a1	| table to compare with
	movb	sp@(19),d1	| and mask to use
	movw	d2,sp@-		| need a scratch register
	clrw	d2		| clear it out
	subqw	#1,d0		| adjust for dbra
Lscloop:
	movb	a0@+,d2		| get character
	movb	a1@(0,d2:w),d2	| get table entry
	andb	d1,d2		| mask it
	dbne	d0,Lscloop	| keep going til no more or non-zero
	addqw	#1,d0		| overshot by one
	movw	sp@+,d2		| restore scratch
Lscdone:
	rts

ENTRY(skpc)
	movl	sp@(8),d0	| get length
	jeq	Lskdone		| nothing to do, return
	movb	sp@(7),d1	| mask to use
	movl	sp@(12),a0	| where to start
	subqw	#1,d0		| adjust for dbcc
Lskloop:
	cmpb	a0@+,d1		| compate with mask
	dbne	d0,Lskloop	| keep going til no more or zero
	addqw	#1,d0		| overshot by one
Lskdone:
	rts

ENTRY(locc)
	movl	sp@(8),d0	| get length
	jeq	Llcdone		| nothing to do, return
	movb	sp@(7),d1	| mask to use
	movl	sp@(12),a0	| where to start
	subqw	#1,d0		| adjust for dbcc
Llcloop:
	cmpb	a0@+,d1		| compate with mask
	dbeq	d0,Llcloop	| keep going til no more or non-zero
	addqw	#1,d0		| overshot by one
Llcdone:
	rts

/*
 * Emulate VAX FFS (find first set) instruction.
 */
ENTRY(ffs)
	moveq	#-1,d0
	movl	sp@(4),d1
	jeq	Lffsdone
Lffsloop:
	addql	#1,d0
	btst	d0,d1
	jeq	Lffsloop
Lffsdone:
	addql	#1,d0
	rts

#ifdef FPCOPROC
/*
 * Save and restore 68881 state.
 * Pretty awful looking since our assembler does not
 * recognize FP mnemonics.
 */
ENTRY(m68881_save)
	movl	sp@(4),a0		| save area pointer
	fsave	a0@			| save state
	tstb	a0@			| null state frame?
	jeq	Lm68881sdone		| yes, all done
	fmovem fp0-fp7,a0@(216)		| save FP general registers
	fmovem fpcr/fpsr/fpi,a0@(312)	| save FP control registers
Lm68881sdone:
	rts

ENTRY(m68881_restore)
	movl	sp@(4),a0		| save area pointer
	tstb	a0@			| null state frame?
	jeq	Lm68881rdone		| yes, easy
	fmovem	a0@(312),fpcr/fpsr/fpi	| restore FP control registers
	fmovem	a0@(216),fp0-fp7	| restore FP general registers
Lm68881rdone:
	frestore a0@			| restore state
	rts

/* LUNA */

	.globl	_fpp_svarea

/* Fpp is MC68882 ? */
ENTRY(is_68882)
	frestore _fppnull	| initialize fpp
	movl	#2,d0
	fmovecr	#0,fp1
	fsinx	fp1,fp2
	lea	_fpp_svarea,a0	| save area
	movw	sr,d1		| save status reg.
	movw	#0x2700,sr	| mask intrrupt
	fsave	a0@		| save fpp context
	movw	d1,sr		| restore status reg.
	movl	a0@,d1
	andl	#0x00ff0000,d1  | check status field
	cmpl	#0x00180000,d1  | 68881(idle)?
	beq	_is81		
	cmpl	#0x00b40000,d1	| 68881(busy)?
	beq	_is81
	cmpl	#0x00380000,d1	| 68882(idle)?	
	beq	_is82
	cmpl	#0x00d40000,d1	| 68882(busy)?
	beq	_is82
	bra	_is82out	| default 68881
_is81:
	clrl	d0
	bra	_is82out
_is82:
	movl	#1,d0
_is82out:
	frestore a0@
	rts

#ifdef	OLD_LUNA
/* We have fpp ? */
ENTRY(havefpp)
	movl	a2,sp@-
	clrl	d0
	movl	vb,a2
	movl	a2@(FLINE_VEC),a0	| save vectors
	movl	a2@(COPRO_VEC),a1
	movl	sp,d1
	movl	#_fpvec,a2@(FLINE_VEC)	| change vectors
	movl	#_fpvec,a2@(COPRO_VEC)
	fnop				| cause exception ?
	movl	#1,d0
_fpvec:	movl	a0,a2@(FLINE_VEC)	| restore vectors
	movl	a1,a2@(COPRO_VEC)
	movl	d1,sp
	movl	sp@+,a2
	rts
#endif
#endif

/*
 * Handle the nitty-gritty of rebooting the machine.
 * Basically we just turn off the MMU and jump to the appropriate ROM routine.
 * Note that we must be running in an address range that is mapped one-to-one
 * logical to physical so that the PC is still valid immediately after the MMU
 * is turned off.  We have conveniently mapped the last page of physical
 * memory this way.
 */
	.globl	_doboot
_doboot:
	movl	#0x41000004,a0
	movl	a0@,a1			| get PROM restart entry address
#if defined(LUNA2)
	cmpl	#-2,_mmutype		| 68040?
	jne	LmotommuF		| no, skip

	movw	#PSL_HIGHIPL,sr		| no interrupts

	movl	#0x41000000,a0
	movl	a0@,d0
	movc	d0,isp			| set ISP

	.word	0xf4f8			| cpusha bc
	movl	#0,d0
	movc	d0,cacr			| caches off
	movql	#0,d0
	.long	0x4e7b0004		| movc d0,itt0
	.long	0x4e7b0005		| movc d0,itt1
	.long	0x4e7b0006		| movc d0,dtt0
	.long	0x4e7b0007		| movc d0,dtt1

	.long	0x4e7b0003		| movc d0,tc

	jmp	a1@			| goto REBOOT
LmotommuF:
#endif
	movl	#CACHE_OFF,d0
	movc	d0,cacr			| disable on-chip cache(s)
	movl	#_tcroff,a0		| value for pmove to TC (turn off MMU)
	pmove	a0@,tc			| disable MMU
	jmp	a1@			| goto REBOOT

	.data
	.globl	_machineid,_mmutype
_machineid:
	.long	1		| default to LUNA-I
_mmutype:
	.long	-1		| default to 68030 PMMU
	.globl	_protorp,_protott0,_protott1
_protorp:
	.long	0,0		| prototype root pointer
_protott0:
	.long	0x403f8543	| tt0 (for LUNA1 kernel 0x40000000-0x7fffffff)
_protott1:
	.long	0x807F8543	| tt1 (for LUNA1 kernel 0x80000000-0xffffffff)
_mapping_tc:
	.long	0
	.globl	_cold
_cold:
	.long	1		| cold start flag
	.globl	_want_resched
_want_resched:
	.long	0
	.globl	_proc0paddr
_proc0paddr:
	.long	0		| KVA of proc0 u-area

	.globl	_tcroff
_tcroff:
	.long	0		| TC reg. reset flag

#ifdef FPCOPROC
	.globl	_fppnull
_fppnull:
	.long	0
#endif
	.globl	_clock_on
_clock_on:
	.long	0		| clock is enable ?
	.globl	_dipswitch
_dipswitch:
	.word	0		| dipsw(front panel) value
	.globl	_KernInter
_KernInter:			| Kernel InterFace Field
	.space	KIFF_SIZE
#ifdef DEBUG
	.globl	fulltflush, fullcflush
fulltflush:
	.long	0
fullcflush:
	.long	0
#endif
#ifdef HPFPLIB
/*
 * Undefined symbols from hpux_float.o:
 *
 * kdb_printf:	A kernel debugger print routine, we just use printf instead.
 * processor:	HP-UX equiv. of machineid, set to 3 if it is a 68040.
 * u:		Ye ole u-area.  The code wants to grab the first longword
 *		indirect off of that and clear the 0x40000 bit there.
 *		Oddly enough this was incorrect even in HP-UX!
 * runrun:	Old name for want_resched.
 */
	.globl	_kdb_printf,_processor,_u,_runrun
_kdb_printf:
	.long	_printf
_processor:
	.long	0
_u:
	.long	.+4
	.long	0
	.set	_runrun,_want_resched
#endif
/* interrupt counters */
	.globl	_intrcnt,_eintrcnt,_intrnames,_eintrnames
_intrnames:
	.asciz	"spur"
	.asciz	"lev1"
	.asciz	"lev2"
	.asciz	"lev3"
	.asciz	"lev4"
	.asciz	"clock"
	.asciz	"lev7"
	.asciz	"nmi"
_eintrnames:
	.even
_intrcnt:
	.long	0,0,0,0,0,0,0,0,0
_eintrcnt:
