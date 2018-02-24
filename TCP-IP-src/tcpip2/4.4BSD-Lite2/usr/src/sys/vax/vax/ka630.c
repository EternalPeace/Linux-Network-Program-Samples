/*-
 * Copyright (c) 1988 The Regents of the University of California.
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
 *	@(#)ka630.c	7.8 (Berkeley) 5/9/91
 */

#ifdef VAX630
#include "sys/param.h"
#include "sys/time.h"
#include "sys/kernel.h"
#include "sys/vmmac.h"

#include "../include/mtpr.h"
#include "../include/cpu.h"
#include "../include/clock.h"
#include "../include/pte.h"
#include "ka630.h"

/*
 * 630-specific routines
 */
extern struct pte Clockmap[];
extern struct pte Ka630map[];
struct ka630clock ka630clock;
struct ka630cpu ka630cpu;

ka630_init()
{

	/*
	 * Map in the clock and the CPU.
	 */
	ioaccess((caddr_t)0x200b8000, &Clockmap[0], sizeof(struct ka630clock));
	ioaccess((caddr_t)0x20080000, &Ka630map[0], sizeof(struct ka630cpu));

	/*
	 * Clear restart and boot in progress flags in the CPMBX.
	 */
	ka630clock.cpmbx = (ka630clock.cpmbx & KA630CLK_LANG) | KA630CLK_REBOOT;

	/*
	 * Enable memory parity error detection.
	 */
	ka630cpu.ka630_mser = KA630MSER_PAREN;
}

/* Start the real-time clock */
ka630_clkstartrt()
{

	mtpr(ICCS, ICCS_IE);
}

/* init system time from tod clock */
/* ARGSUSED */
ka630_clkread(base)
	time_t base;
{
	register struct ka630clock *claddr = &ka630clock;
	struct chiptime c;

	claddr->csr1 = KA630CLK_SET;
	while ((claddr->csr0 & KA630CLK_UIP) != 0)
		;
	/* If the clock is valid, use it. */
	if ((claddr->csr3 & KA630CLK_VRT) != 0 &&
	    (claddr->csr1 & KA630CLK_ENABLE) == KA630CLK_ENABLE) {
		c.sec = claddr->sec;
		c.min = claddr->min;
		c.hour = claddr->hr;
		c.day = claddr->day;
		c.mon = claddr->mon;
		c.year = claddr->yr;
#ifndef lint
		{ int t = claddr->csr2; }	/* ??? */
#endif
		claddr->csr0 = KA630CLK_RATE;
		claddr->csr1 = KA630CLK_ENABLE;

		time.tv_sec = chiptotime(&c);
		return (time.tv_sec ? CLKREAD_OK : CLKREAD_BAD);
	}
	printf("WARNING: TOY clock invalid");
	return (CLKREAD_BAD);
}

/* Set the time of day clock, called via. stime system call.. */
ka630_clkwrite()
{
	register struct ka630clock *claddr = &ka630clock;
	struct chiptime c;
	int s;

	timetochip(&c);
	s = splhigh();
	claddr->csr1 = KA630CLK_SET;
	while ((claddr->csr0 & KA630CLK_UIP) != 0)
		;
	claddr->sec = c.sec;
	claddr->min = c.min;
	claddr->hr = c.hour;
	claddr->day = c.day;
	claddr->mon = c.mon;
	claddr->yr = c.year;
#ifndef lint
	{ int t = claddr->csr2; }	/* ??? */
	{ int t = claddr->csr3; }	/* ??? */
#endif
	claddr->csr0 = KA630CLK_RATE;
	claddr->csr1 = KA630CLK_ENABLE;
	splx(s);
}

ka630_memnop()
{

	/* void */
}

#define NMC630	10
char *mc630[] = {
	0,		"immcr (fsd)",	"immcr (ssd)",	"fpu err 0",
	"fpu err 7",	"mmu st(tb)",	"mmu st(m=0)",	"pte in p0",
	"pte in p1",	"un intr id",
};

struct mc630frame {
	int	mc63_bcnt;		/* byte count == 0xc */
	int	mc63_summary;		/* summary parameter */
	int	mc63_mrvaddr;		/* most recent vad */
	int	mc63_istate;		/* internal state */
	int	mc63_pc;		/* trapped pc */
	int	mc63_psl;		/* trapped psl */
};

ka630_mchk(cmcf)
	caddr_t cmcf;
{
	register struct ka630cpu *ka630addr = &ka630cpu;
	register struct mc630frame *mcf = (struct mc630frame *)cmcf;
	register u_int type = mcf->mc63_summary;

	printf("machine check %x", type);
	if (type < NMC630 && mc630[type])
		printf(": %s", mc630[type]);
	printf("\n\tvap %x istate %x pc %x psl %x\n",
	    mcf->mc63_mrvaddr, mcf->mc63_istate,
	    mcf->mc63_pc, mcf->mc63_psl);
	if (ka630addr->ka630_mser & KA630MSER_MERR) {
		printf("\tmser=0x%x ", ka630addr->ka630_mser);
		if (ka630addr->ka630_mser & KA630MSER_CPUER)
			printf("page=%d", ka630addr->ka630_cear);
		if (ka630addr->ka630_mser & KA630MSER_DQPE)
			printf("page=%d", ka630addr->ka630_dear);
		printf("\n");
	}
	return (MCHK_PANIC);
}
#endif
