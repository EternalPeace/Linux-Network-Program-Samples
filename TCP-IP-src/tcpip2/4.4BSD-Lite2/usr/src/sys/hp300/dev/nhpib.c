/*
 * Copyright (c) 1982, 1990, 1993
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
 *	@(#)nhpib.c	8.2 (Berkeley) 1/12/94
 */

/*
 * Internal/98624 HPIB driver
 */
#include "hpib.h"
#if NHPIB > 0

#include <sys/param.h>
#include <sys/systm.h>
#include <sys/buf.h>

#include <hp/dev/device.h>
#include <hp300/dev/nhpibreg.h>
#include <hp300/dev/hpibvar.h>
#include <hp300/dev/dmavar.h>

nhpibtype(hc)
	register struct hp_ctlr *hc;
{
	register struct hpib_softc *hs = &hpib_softc[hc->hp_unit];
	register struct nhpibdevice *hd = (struct nhpibdevice *)hc->hp_addr;

	if (hc->hp_addr == internalhpib) {
		hs->sc_type = HPIBA;
		hs->sc_ba = HPIBA_BA;
		hc->hp_ipl = HPIBA_IPL;
	}
	else if (hd->hpib_cid == HPIBB) {
		hs->sc_type = HPIBB;
		hs->sc_ba = hd->hpib_csa & CSA_BA;
		hc->hp_ipl = HPIB_IPL(hd->hpib_ids);
	}
	else
		return(0);
	return(1);
}

nhpibreset(unit)
	int unit;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;

	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	hd->hpib_acr = AUX_SSWRST;
	hd->hpib_ar = hs->sc_ba;
	hd->hpib_lim = LIS_ERR;
	hd->hpib_mim = 0;
	hd->hpib_acr = AUX_CDAI;
	hd->hpib_acr = AUX_CSHDW;
	hd->hpib_acr = AUX_SSTD1;
	hd->hpib_acr = AUX_SVSTD1;
	hd->hpib_acr = AUX_CPP;
	hd->hpib_acr = AUX_CHDFA;
	hd->hpib_acr = AUX_CHDFE;
	hd->hpib_acr = AUX_RHDF;
	hd->hpib_acr = AUX_CSWRST;
	nhpibifc(hd);
	hd->hpib_ie = IDS_IE;
	hd->hpib_data = C_DCL;
	DELAY(100000);
}

nhpibifc(hd)
	register struct nhpibdevice *hd;
{
	hd->hpib_acr = AUX_TCA;
	hd->hpib_acr = AUX_CSRE;
	hd->hpib_acr = AUX_SSIC;
	DELAY(100);
	hd->hpib_acr = AUX_CSIC;
	hd->hpib_acr = AUX_SSRE;
}

nhpibsend(unit, slave, sec, addr, origcnt)
	int unit, slave, sec, origcnt;
	register char *addr;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;
	register int cnt = origcnt;

	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	hd->hpib_acr = AUX_TCA;
	hd->hpib_data = C_UNL;
	if (nhpibwait(hd, MIS_BO))
		goto senderror;
	hd->hpib_data = C_TAG + hs->sc_ba;
	hd->hpib_acr = AUX_STON;
	if (nhpibwait(hd, MIS_BO))
		goto senderror;
	hd->hpib_data = C_LAG + slave;
	if (nhpibwait(hd, MIS_BO))
		goto senderror;
	if (sec != -1) {
		hd->hpib_data = C_SCG + sec;
		if (nhpibwait(hd, MIS_BO))
			goto senderror;
	}
	hd->hpib_acr = AUX_GTS;
	if (cnt) {
		while (--cnt > 0) {
			hd->hpib_data = *addr++;
			if (nhpibwait(hd, MIS_BO))
				goto senderror;
		}
		hd->hpib_acr = AUX_EOI;
		hd->hpib_data = *addr;
		if (nhpibwait(hd, MIS_BO))
			goto senderror;
		hd->hpib_acr = AUX_TCA;
#if 0
		/*
		 * May be causing 345 disks to hang due to interference
		 * with PPOLL mechanism.
		 */
		hd->hpib_data = C_UNL;
		(void) nhpibwait(hd, MIS_BO);
#endif
	}
	return(origcnt);
senderror:
	nhpibifc(hd);
	return(origcnt - cnt - 1);
}

nhpibrecv(unit, slave, sec, addr, origcnt)
	int unit, slave, sec, origcnt;
	register char *addr;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;
	register int cnt = origcnt;

	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	hd->hpib_acr = AUX_TCA;
	hd->hpib_data = C_UNL;
	if (nhpibwait(hd, MIS_BO))
		goto recverror;
	hd->hpib_data = C_LAG + hs->sc_ba;
	hd->hpib_acr = AUX_SLON;
	if (nhpibwait(hd, MIS_BO))
		goto recverror;
	hd->hpib_data = C_TAG + slave;
	if (nhpibwait(hd, MIS_BO))
		goto recverror;
	if (sec != -1) {
		hd->hpib_data = C_SCG + sec;
		if (nhpibwait(hd, MIS_BO))
			goto recverror;
	}
	hd->hpib_acr = AUX_RHDF;
	hd->hpib_acr = AUX_GTS;
	if (cnt) {
		while (--cnt >= 0) {
			if (nhpibwait(hd, MIS_BI))
				goto recvbyteserror;
			*addr++ = hd->hpib_data;
		}
		hd->hpib_acr = AUX_TCA;
		hd->hpib_data = (slave == 31) ? C_UNA : C_UNT;
		(void) nhpibwait(hd, MIS_BO);
	}
	return(origcnt);
recverror:
	nhpibifc(hd);
recvbyteserror:
	return(origcnt - cnt - 1);
}

nhpibgo(unit, slave, sec, addr, count, rw)
	register int unit, slave;
	int sec, count, rw;
	char *addr;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;

	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	hs->sc_flags |= HPIBF_IO;
	if (rw == B_READ)
		hs->sc_flags |= HPIBF_READ;
#ifdef DEBUG
	else if (hs->sc_flags & HPIBF_READ) {
		printf("nhpibgo: HPIBF_READ still set\n");
		hs->sc_flags &= ~HPIBF_READ;
	}
#endif
	hs->sc_count = count;
	hs->sc_addr = addr;
	if (hs->sc_flags & HPIBF_READ) {
		hs->sc_curcnt = count;
		dmago(hs->sc_dq.dq_ctlr, addr, count, DMAGO_BYTE|DMAGO_READ);
		nhpibrecv(unit, slave, sec, 0, 0);
		hd->hpib_mim = MIS_END;
	} else {
		hd->hpib_mim = 0;
		if (count < hpibdmathresh) {
			hs->sc_curcnt = count;
			nhpibsend(unit, slave, sec, addr, count);
			nhpibdone(unit);
			return;
		}
		hs->sc_curcnt = --count;
		dmago(hs->sc_dq.dq_ctlr, addr, count, DMAGO_BYTE);
		nhpibsend(unit, slave, sec, 0, 0);
	}
	hd->hpib_ie = IDS_IE | IDS_DMA(hs->sc_dq.dq_ctlr);
}

nhpibdone(unit)
	register int unit;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;
	register int cnt;

	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	cnt = hs->sc_curcnt;
	hs->sc_addr += cnt;
	hs->sc_count -= cnt;
	hs->sc_flags |= HPIBF_DONE;
	hd->hpib_ie = IDS_IE;
	if ((hs->sc_flags & HPIBF_READ) == 0) {
		if (hs->sc_count == 1) {
			(void) nhpibwait(hd, MIS_BO);
			hd->hpib_acr = AUX_EOI;
			hd->hpib_data = *hs->sc_addr;
			hd->hpib_mim = MIS_BO;
		}
#ifdef DEBUG
		else if (hs->sc_count)
			panic("nhpibdone");
#endif
	}
}

nhpibintr(unit)
	register int unit;
{
	register struct hpib_softc *hs = &hpib_softc[unit];
	register struct nhpibdevice *hd;
	register struct devqueue *dq;
	register int stat0;
	int stat1;

#ifdef lint
	if (stat1 = unit) return(1);
#endif
	hd = (struct nhpibdevice *)hs->sc_hc->hp_addr;
	if ((hd->hpib_ids & IDS_IR) == 0)
		return(0);
	stat0 = hd->hpib_mis;
	stat1 = hd->hpib_lis;
	dq = hs->sc_sq.dq_forw;
	if (hs->sc_flags & HPIBF_IO) {
		hd->hpib_mim = 0;
		if ((hs->sc_flags & HPIBF_DONE) == 0)
			dmastop(hs->sc_dq.dq_ctlr);
		hd->hpib_acr = AUX_TCA;
		hs->sc_flags &= ~(HPIBF_DONE|HPIBF_IO|HPIBF_READ);
		dmafree(&hs->sc_dq);
		(dq->dq_driver->d_intr)(dq->dq_unit);
	} else if (hs->sc_flags & HPIBF_PPOLL) {
		hd->hpib_mim = 0;
		stat0 = nhpibppoll(unit);
		if (stat0 & (0x80 >> dq->dq_slave)) {
			hs->sc_flags &= ~HPIBF_PPOLL;
			(dq->dq_driver->d_intr)(dq->dq_unit);
		}
#ifdef DEBUG
		else
			printf("hpib%d: PPOLL intr bad status %x\n",
			       unit, stat0);
#endif
	}
	return(1);
}

nhpibppoll(unit)
	int unit;
{
	register struct nhpibdevice *hd;
	register int ppoll;

	hd = (struct nhpibdevice *)hpib_softc[unit].sc_hc->hp_addr;
	hd->hpib_acr = AUX_SPP;
	DELAY(25);
	ppoll = hd->hpib_cpt;
	hd->hpib_acr = AUX_CPP;
	return(ppoll);
}

nhpibwait(hd, x)
	register struct nhpibdevice *hd;
	int x;
{
	register int timo = hpibtimeout;

	while ((hd->hpib_mis & x) == 0 && --timo)
		DELAY(1);
	if (timo == 0)
		return(-1);
	return(0);
}

void
nhpibppwatch(arg)
	void *arg;
{
	register struct hpib_softc *hs;
	register int unit;
	extern int cold;

	unit = (int)arg;
	hs = &hpib_softc[unit];
	if ((hs->sc_flags & HPIBF_PPOLL) == 0)
		return;
again:
	if (nhpibppoll(unit) & (0x80 >> hs->sc_sq.dq_forw->dq_slave))
       		((struct nhpibdevice *)hs->sc_hc->hp_addr)->hpib_mim = MIS_BO;
	else if (cold)
		/* timeouts not working yet */
		goto again;
	else
		timeout(nhpibppwatch, (void *)unit, 1);
}
#endif
