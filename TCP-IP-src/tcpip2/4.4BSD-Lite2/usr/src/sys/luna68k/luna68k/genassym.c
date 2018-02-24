/*
 * Copyright (c) 1992 OMRON Corporation.
 * Copyright (c) 1982, 1990, 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
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
 * from: hp300/hp300/genassym.c	8.2 (Berkeley) 9/23/93
 *
 *	@(#)genassym.c	8.3 (Berkeley) 12/6/93
 */

#define KERNEL

#include <sys/param.h>
#include <sys/buf.h>
#include <sys/map.h>
#include <sys/proc.h>
#include <sys/mbuf.h>
#include <sys/msgbuf.h>
#include <sys/syscall.h>
#include <sys/user.h>

#include <machine/cpu.h>
#include <machine/trap.h>
#include <machine/psl.h>
#include <machine/reg.h>
#include <machine/stinger.h>

#include <luna68k/dev/pioreg.h>
#include <luna68k/luna68k/clockreg.h>
#include <vm/vm.h>
#include <luna68k/luna68k/pte.h>

#include <errno.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <unistd.h>

extern int errno;

void
def(what, val)
	char *what;
	int val;
{

	if (printf("#define\t%s\t%d\n", what, val) < 0) {
		(void)fprintf(stderr, "genassym: printf: %s\n",
		    strerror(errno));
		exit(1);
	}
}

void
flush()
{

	if (fflush(stdout) || fsync(fileno(stdout)) < 0) {
		(void)fprintf(stderr, "genassym: flush stdout: %s\n",
		    strerror(errno));
		exit(1);
	}
}

#define	off(what, s, m)	def(what, (int)offsetof(s, m))

main()
{
	struct pio *pio = (struct pio *)PIO0_ADDR;
	register unsigned i;

	def("UPAGES", UPAGES);
	def("NBPG", NBPG);
	def("PGSHIFT", PGSHIFT);
	def("USRSTACK", USRSTACK);
	def("KERNELSTACK", KERNELSTACK);
	
	def("KIFF_SIZE", sizeof(struct KernInter));
	off("KI_MAXADDR", struct KernInter, maxaddr);

	off("P_FORW", struct proc, p_forw);
	off("P_BACK", struct proc, p_back);
	off("P_VMSPACE", struct proc, p_vmspace);
	off("P_ADDR", struct proc, p_addr);
	off("P_PRIORITY", struct proc, p_priority);
	off("P_STAT", struct proc, p_stat);
	off("P_WCHAN", struct proc, p_wchan);
	off("P_FLAG", struct proc, p_flag);
	off("P_MDFLAG", struct proc, p_md.md_flags);
	def("SSLEEP", SSLEEP);
	def("SRUN", SRUN);

	off("VM_PMAP", struct vmspace, vm_pmap);
	off("PM_STCHG", struct pmap, pm_stchanged);

	off("V_SWTCH", struct vmmeter, v_swtch);
	off("V_INTR", struct vmmeter, v_intr);

	def("T_BUSERR", T_BUSERR);
	def("T_ADDRERR", T_ADDRERR);
	def("T_ILLINST", T_ILLINST);
	def("T_ZERODIV", T_ZERODIV);
	def("T_CHKINST", T_CHKINST);
	def("T_TRAPVINST", T_TRAPVINST);
	def("T_PRIVINST", T_PRIVINST);
	def("T_TRACE", T_TRACE);
	def("T_MMUFLT", T_MMUFLT);
	def("T_SSIR", T_SSIR);
	def("T_FMTERR", T_FMTERR);
	def("T_COPERR", T_COPERR);
	def("T_FPERR", T_FPERR);
	def("T_ASTFLT", T_ASTFLT);
	def("T_TRAP15", T_TRAP15);
	def("T_FPEMULI", T_FPEMULI);
	def("T_FPEMULD", T_FPEMULD);

	def("PSL_S", PSL_S);
	def("PSL_IPL7", PSL_IPL7);
	def("PSL_LOWIPL", PSL_LOWIPL);
	def("PSL_HIGHIPL", PSL_HIGHIPL);
	def("PSL_USER", PSL_USER);
	def("SPL1", PSL_S | PSL_IPL1);
	def("SPL2", PSL_S | PSL_IPL2);
	def("SPL3", PSL_S | PSL_IPL3);
	def("SPL4", PSL_S | PSL_IPL4);
	def("SPL5", PSL_S | PSL_IPL5);
	def("SPL6", PSL_S | PSL_IPL6);

	def("FC_USERD", FC_USERD);
	def("FC_PURGE", FC_PURGE);
	def("CACHE_ON", CACHE_ON);
	def("CACHE_OFF", CACHE_OFF);
	def("CACHE_CLR", CACHE_CLR);
	def("IC_CLEAR", IC_CLEAR);
	def("DC_CLEAR", DC_CLEAR);

	def("PG_V", PG_V);
	def("PG_NV", PG_NV);
	def("PG_RO", PG_RO);
	def("PG_RW", PG_RW);
	def("PG_CI", PG_CI);
	def("PG_PROT", PG_PROT);
	def("PG_FRAME", PG_FRAME);
	def("SG_V", SG_V);
	def("SG_NV", SG_NV);
	def("SG_RW", SG_RW);
	def("SG_FRAME", SG_FRAME);
	def("SG_ISHIFT", SG_ISHIFT);

	off("PCB_FLAGS", struct pcb, pcb_flags);
	off("PCB_PS", struct pcb, pcb_ps);
	off("PCB_USTP", struct pcb, pcb_ustp);
	off("PCB_USP", struct pcb, pcb_usp);
	off("PCB_REGS", struct pcb, pcb_regs);
	off("PCB_ONFAULT", struct pcb, pcb_onfault);
	off("PCB_FPCTX", struct pcb, pcb_fpregs);
	def("SIZEOF_PCB", sizeof(struct pcb));

	/* exception frame offset/sizes */
	off("FR_SP", struct frame, f_regs[15]);
	off("FR_HW", struct frame, f_sr);
	off("FR_ADJ", struct frame, f_stackadj);

	def("SYS_exit", SYS_exit);
	def("SYS_execve", SYS_execve);
	def("SYS_sigreturn", SYS_sigreturn);

	def("EFAULT", EFAULT);
	def("ENAMETOOLONG", ENAMETOOLONG);

	def("CLOCK_REG", CLOCK_REG);
	def("CLK_INT", CLK_INT);
	def("CLK_CLR", CLK_CLR);

	def("PIO0_A", &pio->a_port);
	def("PIO0_B", &pio->b_port);
	def("PIO0_CTL", &pio->control_port);
	def("PIO_MODED", PIO_MODED);

#ifdef	OLD_LUNA
	def("FLINE_VEC", 44); /* F-Line excep vector offset */
	def("COPRO_VEC", 52); /* Coprocessor prot. offset */
#endif
	exit(0);
}
