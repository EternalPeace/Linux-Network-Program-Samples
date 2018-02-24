/*
 * Copyright (c) 1988 Regents of the University of California.
 * All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Computer Consoles Inc.
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
 *	@(#)mp.c	7.17 (Berkeley) 5/16/91
 */

#include "mp.h"
#if NMP > 0
/*
 * Multi Protocol Communications Controller (MPCC).
 * Asynchronous Terminal Protocol Support.
 */
#include "sys/param.h"
#include "sys/ioctl.h"
#include "sys/tty.h"
#include "sys/user.h"
#include "sys/map.h"
#include "sys/buf.h"
#include "sys/conf.h"
#include "sys/file.h"
#include "sys/errno.h"
#include "sys/syslog.h"
#include "sys/vmmac.h"
#include "sys/kernel.h"
#include "sys/clist.h"

#include "../include/pte.h"
#include "../include/mtpr.h"

#include "../vba/vbavar.h"
#include "../vba/mpreg.h"

#define	MPCHUNK	16
#define	MPPORT(n)	((n) & 0xf)
#define	MPUNIT(n)	((n) >> 4)

/*
 * Driver information for auto-configuration stuff.
 */
int     mpprobe(), mpattach(), mpintr();
struct  vba_device *mpinfo[NMP];
long    mpstd[] = { 0 };
struct  vba_driver mpdriver =
    { mpprobe, 0, mpattach, 0, mpstd, "mp", mpinfo };

int	mpstart();
int	mpparam();
struct	mpevent *mpparam2();
struct	mpevent *mp_getevent();

/*
 * The following structure is needed to deal with mpcc's convoluted
 * method for locating it's mblok structures (hold your stomach).
 * When an mpcc is reset at boot time it searches host memory
 * looking for a string that says ``ThIs Is MpCc''.  The mpcc
 * then reads the structure to locate the pointer to it's mblok
 * structure (you can wretch now).
 */
struct mpbogus {
	char	s[12];			/* `ThIs Is MpCc'' */
	u_char	status;
	u_char	unused;
	u_short	magic;
	struct	mblok *mb;
	struct	mblok *mbloks[NMP];	/* can support at most 16 mpcc's */
} mpbogus = { 'T','h','I','s',' ','I','s',' ','M','p','C','c' };

/*
 * Software state per unit.
 */
struct	mpsoftc {
	u_int	ms_ivec;		/* interrupt vector */
	u_int	ms_softCAR;		/* software carrier for async */
	struct	mblok *ms_mb;		/* mpcc status area */
	struct	vb_buf ms_buf;		/* vba resources for ms_mb */
	struct	hxmtl ms_hxl[MPMAXPORT];/* host transmit list */
	struct	asyncparam ms_async[MPMAXPORT][MPINSET];/* async structs */
	char	ms_cbuf[MPMAXPORT][MPOUTSET][CBSIZE];/* input character buffers */
} mp_softc[NMP];

struct	speedtab	  
mpspeedtab[] = {
	9600,	M9600,	  /* baud rate = 9600 */
	4800,	M4800,	  /* baud rate = 4800 */
	2400,	M2400,	  /* baud rate = 2400 */
	1800,	M1800,	  /* baud rate = 1800 */
	1200,	M1200,	  /* baud rate = 1200 */
	600,	M600,	  /* baud rate = 600 */
	300,	M300,	  /* baud rate = 300 */
	200,	M200,	  /* baud rate = 200 */
	150,	M150,	  /* baud rate = 150 */
	134,	M134_5,	  /* baud rate = 134.5 */
	110,	M110,	  /* baud rate = 110 */
	75,	M75,	  /* baud rate = 75 */
	50,	M50,	  /* baud rate = 50 */
	0,	M0,	  /* baud rate = 0 */
	2000,	M2000,	  /* baud rate = 2000 */
	3600,	M3600,	  /* baud rate = 3600 */
	7200,	M7200,	  /* baud rate = 7200 */
	19200,	M19200,	  /* baud rate = 19,200 */
	24000,	M24000,	  /* baud rate = 24,000 */
	28400,	M28400,	  /* baud rate = 28,400 */
	37800,	M37800,	  /* baud rate = 37,800 */
	40300,	M40300,	  /* baud rate = 40,300 */
	48000,	M48000,	  /* baud rate = 48,000 */
	52000,	M52000,	  /* baud rate = 52,000 */
	56800,	M56800,	  /* baud rate = 56,800 */
	EXTA,	MEXTA,	  /* baud rate = Ext A */
	EXTB,	MEXTB,	  /* baud rate = Ext B */
	-1,	-1,
};

struct	tty mp_tty[NMP*MPCHUNK];
#ifndef lint
int	nmp = NMP*MPCHUNK;
#endif

int	ttrstrt();

mpprobe(reg, vi)
	caddr_t reg;
	struct vba_device *vi;
{
	register int br, cvec;
	register struct mpsoftc *ms;

#ifdef lint
	br = 0; cvec = br; br = cvec;
	mpintr(0);
	mpdlintr(0);
#endif
	if (badaddr(reg, 2))
		return (0);
	ms = &mp_softc[vi->ui_unit];
	/*
	 * Allocate page tables and mblok
	 * structure (mblok in non-cached memory).
	 */
	if (vbainit(&ms->ms_buf, sizeof (struct mblok), VB_32BIT) == 0) {
		printf("mp%d: vbainit failed\n", vi->ui_unit);
		return (0);
	}
	ms->ms_mb = (struct mblok *)ms->ms_buf.vb_rawbuf;
	ms->ms_ivec = MPINTRBASE + 2*vi->ui_unit;	/* XXX */
	br = 0x14, cvec = ms->ms_ivec;			/* XXX */
	return (sizeof (*reg));
}

mpattach(vi)
	register struct vba_device *vi;
{
	register struct mpsoftc *ms = &mp_softc[vi->ui_unit];

	ms->ms_softCAR = vi->ui_flags;
	/*
	 * Setup pointer to mblok, initialize bogus
	 * status block used by mpcc to locate the pointer
	 * and then poke the mpcc to get it to search host
	 * memory to find mblok pointer.
	 */
	mpbogus.mbloks[vi->ui_unit] = (struct mblok *)ms->ms_buf.vb_physbuf;
	*(short *)vi->ui_addr = 0x100;		/* magic */
}

/*
 * Open an mpcc port.
 */
/* ARGSUSED */
mpopen(dev, mode)
	dev_t dev;
{
	register struct tty *tp;
	register struct mpsoftc *ms;
	int error, s, port, unit, mpu;
	struct vba_device *vi;
	struct mpport *mp;
	struct mpevent *ev;

	unit = minor(dev);
	mpu = MPUNIT(unit);
	if (mpu >= NMP || (vi = mpinfo[mpu]) == 0 || vi->ui_alive == 0)
		return (ENXIO);
	tp = &mp_tty[unit];
	if (tp->t_state & TS_XCLUDE && u.u_uid != 0)
		return (EBUSY);
	ms = &mp_softc[mpu];
	port = MPPORT(unit);
	if (ms->ms_mb->mb_proto[port] != MPPROTO_ASYNC ||
	    ms->ms_mb->mb_status != MP_OPOPEN)
		return (ENXIO);
	mp = &ms->ms_mb->mb_port[port];		/* host mpcc struct */
	s = spl8();
	/*
	 * serialize open and close events
	 */
	while ((mp->mp_flags & MP_PROGRESS) || ((tp->t_state & TS_WOPEN) && 
	    !(mode&O_NONBLOCK) && !(tp->t_cflag&CLOCAL)))
		if (error = tsleep((caddr_t)&tp->t_canq, TTIPRI | PCATCH,
		    ttopen, 0)) {
			splx(s);
			return (error);
		}
restart:
	tp->t_state |= TS_WOPEN;
	tp->t_addr = (caddr_t)ms;
	tp->t_oproc = mpstart;
	tp->t_param = mpparam;
	tp->t_dev = dev;
	if ((tp->t_state & TS_ISOPEN) == 0) {
		ttychars(tp);
		if (tp->t_ispeed == 0) {
			tp->t_ispeed = TTYDEF_SPEED;
			tp->t_ospeed = TTYDEF_SPEED;
			tp->t_iflag = TTYDEF_IFLAG;
			tp->t_oflag = TTYDEF_OFLAG;
			tp->t_lflag = TTYDEF_LFLAG;
			tp->t_cflag = TTYDEF_CFLAG;
		}
		/*
		 * Initialize port state: init MPCC interface
		 * structures for port and setup modem control.
		 */
		error = mpportinit(ms, mp, port);
		if (error)
			goto bad;
		ev = mpparam2(tp, &tp->t_termios);
		if (ev == 0) {
			error = ENOBUFS;
			goto bad;
		}
		mp->mp_flags |= MP_PROGRESS;
		mpcmd(ev, EVCMD_OPEN, 0, ms->ms_mb, port);
		/*
		 * wait for port to start
		 */
		while (mp->mp_proto != MPPROTO_ASYNC)
			if (error = tsleep((caddr_t)&tp->t_canq,
			    TTIPRI | PCATCH, ttopen, 0))
				goto bad;
		ttsetwater(tp);
		mp->mp_flags &= ~MP_PROGRESS;
	}
	while ((mode&O_NONBLOCK) == 0 && (tp->t_cflag&CLOCAL) == 0 &&  
	    (tp->t_state & TS_CARR_ON) == 0) {
		if (error = ttysleep(tp, (caddr_t)&tp->t_rawq, TTIPRI | PCATCH,
		    ttopen, 0))
			goto bad;
		/*
		 * a mpclose() might have disabled port. if so restart
		 */
		if (mp->mp_proto != MPPROTO_ASYNC)
			goto restart;
		tp->t_state |= TS_WOPEN;
	}
	error = (*linesw[tp->t_line].l_open)(dev,tp);
done:
	splx(s);
	/*
	 * wakeup those processes waiting for the open to complete
	 */
	wakeup((caddr_t)&tp->t_canq);
	return (error);
bad:
	tp->t_state &= ~TS_WOPEN;
	goto done;
}

/*
 * Close an mpcc port.
 */
/* ARGSUSED */
mpclose(dev, flag)
	dev_t dev;
{
	register struct tty *tp;
	register struct mpport *mp;
	register struct mpevent *ev;
	int s, port, unit, error = 0;
	struct mblok *mb;

	unit = minor(dev);
	tp = &mp_tty[unit];
	port = MPPORT(unit);
	mb = mp_softc[MPUNIT(unit)].ms_mb;
	mp = &mb->mb_port[port];
	s = spl8();
	if (mp->mp_flags & MP_PROGRESS) {
		if (mp->mp_flags & MP_REMBSY) {
			mp->mp_flags &= ~MP_REMBSY;
			splx(s);
			return (0);
		}
		while (mp->mp_flags & MP_PROGRESS)
			if (error = tsleep((caddr_t)&tp->t_canq,
			    TTIPRI | PCATCH, ttclos, 0)) {
				splx(s);
				return (error);
			}
	}
	mp->mp_flags |= MP_PROGRESS;
	(*linesw[tp->t_line].l_close)(tp, flag);
	ev = mp_getevent(mp, unit, 1);
	if (ev == 0) {
		error = ENOBUFS;
		mp->mp_flags &= ~MP_PROGRESS;
		goto out;
	}
	if (tp->t_state & TS_HUPCLS || (tp->t_state & TS_ISOPEN) == 0)
		mpmodem(unit, MMOD_OFF);
	else
		mpmodem(unit, MMOD_ON);
	mpcmd(ev, EVCMD_CLOSE, 0, mb, port);
	error = ttyclose(tp);
out:
	if (mp->mp_flags & MP_REMBSY)
		mpclean(mb, port);
	else
		while (mp->mp_flags & MP_PROGRESS && error == 0)
			error = tsleep((caddr_t)&tp->t_canq, TTIPRI | PCATCH,
			    ttclos, 0);
	splx(s);
	return (error);
}

/*
 * Read from an mpcc port.
 */
mpread(dev, uio, flag)
	dev_t dev;
	struct uio *uio;
{
	struct tty *tp;

	tp = &mp_tty[minor(dev)];
	return ((*linesw[tp->t_line].l_read)(tp, uio, flag));
}

/*
 * Write to an mpcc port.
 */
mpwrite(dev, uio, flag)
	dev_t dev;
	struct uio *uio;
{
	struct tty *tp;

	tp = &mp_tty[minor(dev)];
	return ((*linesw[tp->t_line].l_write)(tp, uio, flag));
}

/*
 * Ioctl for a mpcc port
 */
mpioctl(dev, cmd, data, flag)
	dev_t dev;
	caddr_t data;
{
	register struct tty *tp;
	register struct mpsoftc *ms;
	register struct mpport *mp;
	register struct mpevent *ev;
	int s, port, error, unit;
	struct mblok *mb;

	unit = minor(dev);
	tp = &mp_tty[unit];
	ms = &mp_softc[MPUNIT(unit)];
	mb = ms->ms_mb;
	port = MPPORT(unit);
	mp = &mb->mb_port[port];
	if (mp->mp_proto != MPPROTO_ASYNC)
		return(ENXIO);
	error = (*linesw[tp->t_line].l_ioctl)(tp, cmd, data, flag);
	if (error >= 0)
		return (error);
	error = ttioctl(tp, cmd, data, flag);
	if (error >= 0)
		return (error);
	switch (cmd) {
	case TIOCSBRK:			/* send break */
	case TIOCCBRK:			/* clear break */
		s = spl8();
		while (mp->mp_flags & MP_IOCTL) {
			if (error = tsleep((caddr_t)&tp->t_canq,
			    TTIPRI | PCATCH, ttyout, 0)) {
				splx(s);
				return (error);
			}
			if (mp->mp_proto != MPPROTO_ASYNC) {
				splx(s);
				return (ENXIO);
			}
		}
		ev = mp_getevent(mp, unit, 0);
		if (ev) {
			mp->mp_flags |= MP_IOCTL;
			mpcmd(ev, EVCMD_IOCTL,
			    (cmd == TIOCSBRK ? A_BRKON : A_BRKOFF), mb, port);
		} else
			error = ENOBUFS;
		splx(s);
		break;
	case TIOCSDTR:			/* set dtr control line */
		break;
	case TIOCCDTR:			/* clear dtr control line */
		break;
	default:
		error = ENOTTY;
		break;
	}
	return (error);
}

mpparam(tp, t)
	struct tty *tp;
	struct termios *t;
{
	register struct mpevent *ev;
	int unit = minor(tp->t_dev);
	struct mpsoftc *ms = &mp_softc[MPUNIT(unit)];
	struct mblok *mb = ms->ms_mb;

	ev = mpparam2(tp, t);
	if (ev == 0)
		return (ENOBUFS);
	mpcmd(ev, EVCMD_IOCTL, A_CHGALL, mb, MPPORT(unit));
	return (0);
}	

struct mpevent *
mpparam2(tp, t)
	register struct tty *tp;
	struct termios *t;
{
	register struct mpevent *ev;
	register struct mpport *mp;
	int unit = minor(tp->t_dev);
	struct mblok *mb;
	struct mpsoftc *ms;
	register struct asyncparam *asp;
	int port, speedcode;

	ms = &mp_softc[MPUNIT(unit)];
	mb = ms->ms_mb;
	port = MPPORT(unit);
	mp = &mb->mb_port[port];
	ev = mp_getevent(mp, unit, 0);	/* XXX */
	speedcode = ttspeedtab(t->c_ospeed, mpspeedtab);
	if (ev == 0 || speedcode < 0) {
printf("mp mpunit %d port %d param2 failed ev: %x speed %d, wanted %d\n",
			MPUNIT(unit), port, ev, speedcode, t->c_ospeed);
		return (0);	/* XXX */
	}
	/* YUCK */
	asp = &ms->ms_async[port][mp->mp_on?mp->mp_on-1:MPINSET-1];
	asp->ap_xon = t->c_cc[VSTART];
	asp->ap_xoff = t->c_cc[VSTOP];
	if (!(t->c_iflag&IXON) || (asp->ap_xon == _POSIX_VDISABLE) || 
	    (asp->ap_xoff == _POSIX_VDISABLE))
		asp->ap_xena = MPA_DIS;
	else
		asp->ap_xena = MPA_ENA;
	asp->ap_xany = ((t->c_iflag & IXANY) ? MPA_ENA : MPA_DIS);
#ifdef notnow
	if (t->t_cflag&CSIZE) == CS8) {
#endif
		asp->ap_data = MPCHAR_8;
		asp->ap_parity = MPPAR_NONE;
#ifdef notnow
	} else {
		asp->ap_data = MPCHAR_7;
		if ((t->c_flags & (EVENP|ODDP)) == ODDP) /* XXX */
			asp->ap_parity = MPPAR_ODD;
		else
			asp->ap_parity = MPPAR_EVEN;
	}
#endif
	asp->ap_loop = MPA_DIS;		/* disable loopback */
	asp->ap_rtimer = A_RCVTIM;	/* default receive timer */
	if (t->c_ospeed == B110)
		asp->ap_stop = MPSTOP_2;
	else
		asp->ap_stop = MPSTOP_1;
	if (t->c_ospeed == 0) {
		tp->t_state |= TS_HUPCLS;
		setm(&asp->ap_modem, 0, DROP);
		seti(&asp->ap_intena, A_DCD);
		return (ev);
	} 
	if (t->c_ospeed == EXTA || t->c_ospeed == EXTB)
		asp->ap_baud = M19200;
	else
		asp->ap_baud = speedcode;
	if (1 || ms->ms_softCAR & (1<<port)) /* XXX HARDWIRE FOR NOW */
		setm(&asp->ap_modem, A_DTR, ASSERT);
	else
		setm(&asp->ap_modem, A_DTR, AUTO);
	seti(&asp->ap_intena, A_DCD);
	return(ev);
}

mpstart(tp)
	register struct tty *tp;
{
	register struct mpevent *ev;
	register struct mpport *mp;
	struct mblok *mb;
	struct mpsoftc *ms;
	int port, unit, xcnt, n, s, i;
	struct	hxmtl *hxp;
	struct clist outq;

	s = spl8();
	unit = minor(tp->t_dev);
	ms = &mp_softc[MPUNIT(unit)];
	mb = ms->ms_mb;
	port = MPPORT(unit);
	mp = &mb->mb_port[port];
	hxp = &ms->ms_hxl[port];
	xcnt = 0;
	outq = tp->t_outq;
	for (i = 0; i < MPXMIT; i++) {
		if (tp->t_state & (TS_TIMEOUT|TS_BUSY|TS_TTSTOP))
			break;
		if (outq.c_cc <= tp->t_lowat) {
			if (tp->t_state & TS_ASLEEP) {
				tp->t_state &= ~TS_ASLEEP;
				wakeup((caddr_t)&tp->t_outq);
			}
			if (tp->t_wsel) {
				selwakeup(tp->t_wsel, tp->t_state & TS_WCOLL);
				tp->t_wsel = 0;
				tp->t_state &= ~TS_WCOLL;
			}
		}
		if (outq.c_cc == 0)
			break;
		/*
		 * If we're not currently busy outputting,
		 * and there is data to be output, set up
		 * port transmit structure to send to mpcc.
		 */
		if (1) /* || tp->t_flags & (RAW|LITOUT))  XXX FIX */
			n = ndqb(&outq, 0);
		else {
			n = ndqb(&outq, 0200);
			if (n == 0) {
				if (xcnt > 0)
					break;
				n = getc(&outq);
				timeout(ttrstrt, (caddr_t)tp, (n&0177)+6);
				tp->t_state |= TS_TIMEOUT;
				break;
			}
		}
		hxp->dblock[i] = (caddr_t)kvtophys(outq.c_cf);
		hxp->size[i] = n;
		xcnt++;		/* count of xmts to send */
		ndadvance(&outq, n);
	}
	/*
	 * If data to send, poke mpcc.
	 */
	if (xcnt) {
		ev = mp_getevent(mp, unit, 0);
		if (ev == 0) {
			tp->t_state &= ~(TS_BUSY|TS_TIMEOUT);
		} else {
			tp->t_state |= TS_BUSY;
			ev->ev_count = xcnt;
			mpcmd(ev, EVCMD_WRITE, 0, mb, MPPORT(unit));
		}
	}
	splx(s);
}

/*
 * Advance cc bytes from q  but don't free memory.
 */
ndadvance(q, cc)
	register struct clist *q;
	register cc;
{
	register struct cblock *bp;
	char *end;
	int rem, s;

	s = spltty();
	if (q->c_cc <= 0)
		goto out;
	while (cc>0 && q->c_cc) {
		bp = (struct cblock *)((int)q->c_cf & ~CROUND);
		if ((int)bp == (((int)q->c_cl-1) & ~CROUND)) {
			end = q->c_cl;
		} else {
			end = (char *)((int)bp + sizeof (struct cblock));
		}
		rem = end - q->c_cf;
		if (cc >= rem) {
			cc -= rem;
			q->c_cc -= rem;
			q->c_cf = bp->c_next->c_info;
		} else {
			q->c_cc -= cc;
			q->c_cf += cc;
			break;
		}
	}
	if (q->c_cc <= 0) {
		q->c_cf = q->c_cl = NULL;
		q->c_cc = 0;
	}
out:
	splx(s);
}

/*
 * Stop output on a line, e.g. for ^S/^Q or output flush.
 */
/* ARGSUSED */
mpstop(tp, rw)
	register struct tty *tp;
	int rw;
{
	register struct mpport *mp;
	register struct mpevent *ev;
	int unit = minor(tp->t_dev);
	int port;
	struct mblok *mb;
	int s;

	s = spl8();
	if (tp->t_state & TS_BUSY) {
		if ((tp->t_state & TS_TTSTOP) == 0) {
			tp->t_state |= TS_FLUSH;
			port = MPPORT(unit);
			mb = mp_softc[MPUNIT(unit)].ms_mb;
			mp = &mb->mb_port[port];
			ev = mp_getevent(mp, unit, 0);
			if (ev == 0) {
				splx(s);
				return;
			}
			mpcmd(ev, EVCMD_WRITE, A_FLUSH, mb, port);
		}
	}
	splx(s);
}

/*
 * Initialize an async port's MPCC state.
 */
mpportinit(ms, mp, port)
	register struct mpsoftc *ms;
	register struct mpport *mp;
	int port;
{
	register struct mpevent *ev;
	register int i;
	caddr_t ptr;

	mp->mp_on = mp->mp_off = 0;
	mp->mp_nextrcv = 0;
	mp->mp_flags = 0;
	ev = &mp->mp_recvq[0];
	for (i = 0; ev < &mp->mp_recvq[MPINSET]; ev++, i++) {
		ev->ev_status = EVSTATUS_FREE;
		ev->ev_cmd = 0;
		ev->ev_opts = 0;
		ev->ev_error = 0;
		ev->ev_flags = 0;
		ev->ev_count = 0;
		ev->ev_un.hxl = (struct hxmtl *) kvtophys(&ms->ms_hxl[port]);
		ev->ev_params = (caddr_t) kvtophys(&ms->ms_async[port][i]);
	}
	ev = &mp->mp_sendq[0];
	for (i = 0; ev < &mp->mp_sendq[MPOUTSET]; ev++, i++) {
		/* init so that L2 can't send any events */
		/* to host until open has completed      */
		ev->ev_status = EVSTATUS_FREE;
		ev->ev_cmd = 0;
		ev->ev_opts = 0;
		ev->ev_error = 0;
		ev->ev_flags = 0;
		ev->ev_count = 0;
		ptr = (caddr_t) &ms->ms_cbuf[port][i][0];
		ev->ev_un.rcvblk = (u_char *)kvtophys(ptr);
		ev->ev_params = (caddr_t) kvtophys(ptr);
	}
	return (0);
}

/*
 * Send an event to an mpcc.
 */
mpcmd(ev, cmd, flags, mb, port)
	register struct mpevent *ev;
	struct mblok *mb;
{       
	int s;

	s = spl8();
	/* move host values to inbound entry */
	ev->ev_cmd = cmd;
	ev->ev_opts = flags;
	/* show event ready for mpcc */
	ev->ev_status = EVSTATUS_GO;
	mpintmpcc(mb, port);
	splx(s);
}

/*
 * Return the next available event entry for the indicated port.
 */
struct mpevent *
mp_getevent(mp, unit, cls_req)
	register struct mpport *mp;
	int unit;
	int cls_req;
{
	register struct mpevent *ev;
	int i, s;

	s = spl8();
	ev = &mp->mp_recvq[mp->mp_on];
	if (ev->ev_status != EVSTATUS_FREE)
		goto bad;
	/*
	 * If not a close request, verify one extra
	 * event is available for closing the port.
	 */
	if (!cls_req) {
		if ((i = mp->mp_on + 1) >= MPINSET)
			i = 0;
		if (mp->mp_recvq[i].ev_status != EVSTATUS_FREE)
			goto bad;
	}
	/* init inbound fields marking this entry as busy */
	ev->ev_cmd = 0;
	ev->ev_opts = 0;
	ev->ev_error = 0;
	ev->ev_flags = 0;
	ev->ev_count = 0;
	ev->ev_status = EVSTATUS_BUSY;
	/* adjust pointer to next available inbound entry */
	adjptr(mp->mp_on, MPINSET);
	splx(s);
	return (ev);
bad:
	splx(s);
	log(LOG_ERR, "mp%d: port%d, out of events\n",
	    MPUNIT(unit), MPPORT(unit));
	return ((struct mpevent *)0);
}

mpmodem(unit, flag)
	int unit, flag;
{
	struct mpsoftc *ms = &mp_softc[MPUNIT(unit)];
	int port = MPPORT(unit);
	register struct mpport *mp;
	register struct asyncparam *asp;

	mp = &ms->ms_mb->mb_port[port];
	asp = &ms->ms_async[port][mp->mp_on?mp->mp_on-1:MPINSET-1];
	if (flag == MMOD_ON) {
		if (1 || ms->ms_softCAR & (1 << port))/* XXX HARDWIRE FOR NOW */
			setm(&asp->ap_modem, A_DTR, ASSERT);
		else
			setm(&asp->ap_modem, A_DTR, AUTO);
		seti(&asp->ap_intena, A_DCD);
	} else {
		setm(&asp->ap_modem, 0, DROP);
		seti(&asp->ap_intena, 0);
	}
}

/*
 * Set up the modem control structure according to mask.
 * Each set bit in the mask means assert the corresponding
 * modem control line, otherwise, it will be dropped.  
 * RTS is special since it can either be asserted, dropped
 * or put in auto mode for auto modem control.
 */
static
setm(mc, mask, rts)
	register struct mdmctl *mc;
	register int mask;
{

	mc->mc_rngdsr = (mask & A_RNGDSR) ? ASSERT : DROP;
	mc->mc_rate = (mask & A_RATE) ? ASSERT : DROP;
	mc->mc_dcd = (mask & A_DCD) ? ASSERT : DROP;
	mc->mc_sectx = (mask & A_SECTX) ? ASSERT : DROP;
	mc->mc_cts = (mask & A_CTS) ? ASSERT : DROP;
	mc->mc_secrx = (mask & A_SECRX) ? ASSERT : DROP;
	mc->mc_dtr = (mask & A_DTR) ? ASSERT : DROP;
	mc->mc_rts = rts;
}

/*
 * Set up the status change enable field from mask.
 * When a signal is enabled in this structure and
 * and a change in state on a corresponding modem
 * control line occurs, a status change event will
 * be delivered to the host.
 */
static
seti(mc, mask)
	register struct mdmctl *mc;
	register int mask;
{

	mc->mc_rngdsr = (mask & A_RNGDSR) ? MDM_ON : MDM_OFF;
	mc->mc_rate = (mask & A_RATE) ? MDM_ON : MDM_OFF;
	mc->mc_dcd = (mask & A_DCD) ? MDM_ON : MDM_OFF;
	mc->mc_sectx = (mask & A_SECTX) ? MDM_ON : MDM_OFF;
	mc->mc_cts = (mask & A_CTS) ? MDM_ON : MDM_OFF;
	mc->mc_secrx = (mask & A_SECRX) ? MDM_ON : MDM_OFF;
	mc->mc_dtr = (mask & A_DTR) ? MDM_ON : MDM_OFF;
	mc->mc_rts = (mask & A_RTS) ? MDM_ON : MDM_OFF;
}

mpcleanport(mb, port)
	struct mblok *mb;
	int port;
{
	register struct mpport *mp;
	register struct tty *tp;

	mp = &mb->mb_port[port];
	if (mp->mp_proto == MPPROTO_ASYNC) {
		mp->mp_flags = MP_REMBSY;
		/* signal loss of carrier and close */
		tp = &mp_tty[mb->mb_unit*MPCHUNK+port];
		ttyflush(tp, FREAD|FWRITE);
		(void) (*linesw[tp->t_line].l_modem)(tp, 0);
	}
}

mpclean(mb, port)
	register struct mblok *mb;
	int port;
{
	register struct mpport *mp;
	register struct mpevent *ev;
	register int i;
	u_char list[2];
	int unit;

	mp = &mb->mb_port[port];
	unit = mb->mb_unit;
	for (i = mp->mp_off; i != mp->mp_on; i = (i+1 % MPINSET)) {
		ev = &mp->mp_recvq[i];
		ev->ev_error = ENXIO;
		ev->ev_status = EVSTATUS_DONE;
	}
	list[0] = port, list[1] = MPPORT_EOL;
	mpxintr(unit, list);
	mprintr(unit, list);
	/* Clear async for port */
	mp->mp_proto = MPPROTO_UNUSED;
	mp->mp_flags = 0;
	mp->mp_on = 0;
	mp->mp_off = 0;
	mp->mp_nextrcv = 0;

	mp_tty[unit*MPCHUNK + port].t_state = 0;
	for (ev = &mp->mp_sendq[0]; ev < &mp->mp_sendq[MPOUTSET]; ev++) {
		ev->ev_status = EVSTATUS_FREE;
		ev->ev_cmd = 0;
		ev->ev_error = 0;
		ev->ev_un.rcvblk = 0;
		ev->ev_params = 0;
	}
	for (ev = &mp->mp_recvq[0]; ev < &mp->mp_recvq[MPINSET]; ev++) {
		ev->ev_status = EVSTATUS_FREE;
		ev->ev_cmd = 0;
		ev->ev_error = 0;
		ev->ev_params = 0;
	}
}

/*
 * MPCC interrupt handler.
 */
mpintr(mpcc)
	int mpcc;
{
	register struct mblok *mb;
	register struct his *his;

	mb = mp_softc[mpcc].ms_mb;
	if (mb == 0) {
		printf("mp%d: stray interrupt\n", mpcc);
		return;
	}
	his = &mb->mb_hostint;
	his->semaphore &= ~MPSEMA_AVAILABLE;
	/*
	 * Check for events to be processed.
	 */
	if (his->proto[MPPROTO_ASYNC].outbdone[0] != MPPORT_EOL)
		mprintr(mpcc, his->proto[MPPROTO_ASYNC].outbdone);
	if (his->proto[MPPROTO_ASYNC].inbdone[0] != MPPORT_EOL)
		mpxintr(mpcc, his->proto[MPPROTO_ASYNC].inbdone);
	if (mb->mb_harderr || mb->mb_softerr)
		mperror(mb, mpcc);
	his->semaphore |= MPSEMA_AVAILABLE;
}

/*
 * Handler for processing completion of transmitted events.
 */
mpxintr(unit, list)
	register u_char *list;
{
	register struct mpport *mp;
	register struct mpevent *ev;
	register struct mblok *mb;
	register struct tty *tp;
	register struct asyncparam *ap;
	struct mpsoftc *ms;
	int port, i, j;
#	define nextevent(mp) &mp->mp_recvq[mp->mp_off]

	ms = &mp_softc[unit];
	mb = mp_softc[unit].ms_mb;
	for (j = 0; j < MPMAXPORT && ((port = *list++) != MPPORT_EOL); j++) {
		/*
		 * Process each completed entry in the inbound queue.
		 */
		mp = &mb->mb_port[port];
		tp = &mp_tty[unit*MPCHUNK + port];
		ev = nextevent(mp);
		for (; ev->ev_status & EVSTATUS_DONE; ev = nextevent(mp)) {
			/* YUCK */
			ap = &ms->ms_async[port][mp->mp_off];
			mppurge((caddr_t)ap, (int)sizeof (*ap));
			switch (ev->ev_cmd) {
			case EVCMD_OPEN:
				/*
				 * Open completion, start all reads and
				 * assert modem status information.
				 */
				for (i = 0; i < MPOUTSET; i++) 
					mp->mp_sendq[i].ev_status = EVSTATUS_GO;
				(*linesw[tp->t_line].l_modem)
				    (tp, ap->ap_modem.mc_dcd == ASSERT);
				mp_freein(ev);
				adjptr(mp->mp_off, MPINSET);
				mp->mp_proto = MPPROTO_ASYNC;	/* XXX */
				wakeup((caddr_t)&tp->t_canq);
				break;
			case EVCMD_CLOSE:
				/*
				 * Close completion, flush all pending
				 * transmissions, free resources, and
				 * cleanup mpcc port state.
				 */
				for (i = 0; i < MPOUTSET; i++) {
					mp->mp_sendq[i].ev_status =
					    EVSTATUS_FREE;
					mp->mp_sendq[i].ev_un.rcvblk = 0;
					mp->mp_sendq[i].ev_params = 0;
				}
				mp_freein(ev);
				adjptr(mp->mp_off, MPINSET);
				tp->t_state &= ~(TS_CARR_ON|TS_BUSY|TS_FLUSH);
				mp->mp_on = mp->mp_off = mp->mp_nextrcv = 0;
				mp->mp_flags &= ~MP_PROGRESS;
				mp->mp_proto = MPPROTO_UNUSED;
				wakeup((caddr_t)&tp->t_canq);
				break;
			case EVCMD_IOCTL:
				mp_freein(ev);
				adjptr(mp->mp_off, MPINSET);
				mp->mp_flags &= ~MP_IOCTL;
				wakeup((caddr_t)&tp->t_canq);
				break;
			case EVCMD_WRITE:
				/*
				 * Transmission completed, update tty
				 * state and restart output.
				 */
				if (ev->ev_opts != A_FLUSH) {
					tp->t_state &= ~TS_BUSY;
					if (tp->t_state & TS_FLUSH)
						tp->t_state &= ~TS_FLUSH;
					else {
						register int cc = 0, n;
						struct hxmtl *hxp;

						hxp = &ms->ms_hxl[port];
						for (n=0;n < ev->ev_count; n++)
							cc += hxp->size[n];
						ndflush(&tp->t_outq, cc);
					}
				}
				switch (ev->ev_error) {
				case A_SIZERR:  /*# error in xmt data size */
					mplog(unit, port, A_XSIZE, 0);
					break;
				case A_NXBERR:  /*# no more xmt evt buffers */
					mplog(unit, port, A_NOXBUF, 0);
					break;
				}
				mp_freein(ev);
				adjptr(mp->mp_off, MPINSET);
				mpstart(tp);
				break;
			default:
				mplog(unit, port, A_INVCMD, (int)ev->ev_cmd);  
				mp_freein(ev);
				adjptr(mp->mp_off, MPINSET);
				break;
			}
		}
	}
#undef	nextevent
}

mp_freein(ev)
	register struct mpevent *ev;
{
	/* re-init all values in this entry */
	ev->ev_cmd = 0;
	ev->ev_opts = 0;
	ev->ev_error = 0;
	ev->ev_flags = 0;
	ev->ev_count = 0;
	/* show this entry is available for use */
	ev->ev_status = EVSTATUS_FREE;
}

/*
 * Handler for processing received events.
 */
mprintr(unit, list)
	u_char *list;
{
	register struct tty *tp;
	register struct mpport *mp;
	register struct mpevent *ev;
	struct mblok *mb;
	register int cc;
	register char *cp;
	struct mpsoftc *ms;
	caddr_t ptr;
	char *rcverr;
	int port, i;

	ms = &mp_softc[unit];
	mb = mp_softc[unit].ms_mb;
	for (i = 0; i < MPMAXPORT && (port = *list++) != MPPORT_EOL; i++) {
		tp = &mp_tty[unit*MPCHUNK + port];
		mp = &mb->mb_port[port];
		ev = &mp->mp_sendq[mp->mp_nextrcv];
		while (ev->ev_status & EVSTATUS_DONE) {
			switch(ev->ev_cmd) {
			case EVCMD_STATUS:
				/*
				 * Status change, look for carrier changes.
				 */
				switch(ev->ev_opts) {
				case DCDASRT:
					(*linesw[tp->t_line].l_modem)(tp, 1);
					wakeup((caddr_t)&tp->t_canq);
					break;
				case DCDDROP:
					(*linesw[tp->t_line].l_modem)(tp, 0);
					wakeup((caddr_t)&tp->t_canq);
					break;
				case NORBUF:
				case NOEBUF:
					mplog(unit, port,
					    "out of receive events", 0);
					break;
				default:
					mplog(unit, port,
					    "unexpect status command",
					    (int)ev->ev_opts);
					break;
				}
				break;
			case EVCMD_READ:
				/*
			 	 * Process received data.
			 	 */
				if ((tp->t_state & TS_ISOPEN) == 0) {
					wakeup((caddr_t)&tp->t_rawq);
					break;
				}
				if ((cc = ev->ev_count) == 0)
					break;
				cp = ms->ms_cbuf[port][mp->mp_nextrcv];
				mppurge(cp, CBSIZE);
				while (cc-- > 0) {
					/*
				 	 * A null character is inserted,
					 * potentially when a break or framing
					 * error occurs. If we're not in raw
					 * mode, substitute the interrupt
					 * character.
				 	 */
					/*** XXX - FIXUP ***/
					if (*cp == 0 &&
				            (ev->ev_error == BRKASRT ||
				             ev->ev_error == FRAMERR))
						if ((tp->t_flags&RAW) == 0)
							;
							/* XXX was break */
					(*linesw[tp->t_line].l_rint)(*cp++, tp);
				}
				/* setup for next read */
				ptr = (caddr_t)&mp_softc[unit].ms_cbuf[port][mp->mp_nextrcv][0];
				ev->ev_un.rcvblk = (u_char *)kvtophys(ptr);
				ev->ev_params = (caddr_t) kvtophys(ptr);
				switch(ev->ev_error) {
				case RCVDTA:
					/* Normal (good) rcv data do not
					 * report the following they are
					 * "normal" errors 
					 */
				case FRAMERR:
					/* frame error */
				case BRKASRT:
					/* Break condition */
				case PARERR:
					/* parity error */
					rcverr = (char *)0;
					break;
				case OVRNERR:
					/* Overrun error */
					rcverr = "overrun error";
					break;
				case OVFERR:
					/* Overflow error */
					rcverr = "overflow error";
					break;
				default:
					rcverr = "undefined rcv error";
					break;
				}
				if (rcverr != (char *)0)
					mplog(unit, port, rcverr,
					      (int)ev->ev_error);
				break;
			default:
				mplog(unit, port, "unexpected command",
					(int)ev->ev_cmd);
				break;
			}
			ev->ev_cmd = 0;
			ev->ev_opts = 0;
			ev->ev_error = 0;
			ev->ev_flags = 0;
			ev->ev_count = 0;
			ev->ev_status = EVSTATUS_GO;	/* start next read */
			adjptr(mp->mp_nextrcv, MPOUTSET);
			ev = &mp->mp_sendq[mp->mp_nextrcv];
		}
	}
}

/*
 * Log an mpcc diagnostic.
 */
mplog(unit, port, cp, flags)
	char *cp;
{

	if (flags)
		log(LOG_ERR, "mp%d: port%d, %s (%d)\n",
		    unit, port, cp, flags);
	else
		log(LOG_ERR, "mp%d: port%d, %s\n", unit, port, cp);
}

int	MPHOSTINT = 1;

mptimeint(mb)
	register struct mblok *mb;
{

        mb->mb_mpintcnt = 0;
        mb->mb_mpintclk = (caddr_t)0;
	*(u_short *)mpinfo[mb->mb_unit]->ui_addr = 2;
}

/*
 * Interupt mpcc
 */
mpintmpcc(mb, port)
	register struct mblok *mb;
{

        mb->mb_intr[port] |= MPSEMA_WORK;
        if (++mb->mb_mpintcnt == MPHOSTINT) {
                mb->mb_mpintcnt = 0;
		*(u_short *)mpinfo[mb->mb_unit]->ui_addr = 2;
                if (mb->mb_mpintclk) {
                        untimeout(mptimeint, (caddr_t)mb);
                        mb->mb_mpintclk = 0;
                }
        } else {
                if (mb->mb_mpintclk == 0) {
                        timeout(mptimeint, (caddr_t)mb, 4);
                        mb->mb_mpintclk = (caddr_t)1;
                }
        }
}

static char *mpherrmsg[] = {
	"",
	"Bus error",				/* MPBUSERR */
	"Address error",			/* ADDRERR */
	"Undefined ecc interrupt",		/* UNDECC */
	"Undefined interrupt",			/* UNDINT */
	"Power failure occurred",		/* PWRFL */
	"Stray transmit done interrupt",	/* NOXENTRY */
	"Two fast timers on one port",		/* TWOFTMRS */
	"Interrupt queue full",			/* INTQFULL */
	"Interrupt queue ack error",		/* INTQERR */
	"Uncorrectable dma parity error",	/* CBPERR */
	"32 port ACAP failed power up",		/* ACPDEAD */
};
#define	NHERRS	(sizeof (mpherrmsg) / sizeof (mpherrmsg[0]))

mperror(mb, unit)
	register struct mblok *mb;
	int unit;
{
	register char *cp;
	register int i;

	if (mb->mb_softerr) {
		switch (mb->mb_softerr) {
		case DMAPERR:   /* dma parity error */
			cp = "dma parity error";
			break;
		case ECCERR:
			cp = "local memory ecc error";
			break;
		default:
			cp = "unknown error";
			break;
		}
		log(LOG_ERR, "mp%d: soft error, %s", unit, cp);
		mb->mb_softerr = 0;
	}
	if (mb->mb_harderr) {
		if (mb->mb_harderr < NHERRS)
			cp = mpherrmsg[mb->mb_harderr];
		else
			cp = "unknown error";
		log(LOG_ERR, "mp%d: hard error, %s", unit, cp);
		if (mb->mb_status == MP_OPOPEN) {
			for (i = 0; i < MPMAXPORT; i++) {
				mpcleanport(mb, i);
				mb->mb_proto[i] = MPPROTO_UNUSED;
			}
		}
		mb->mb_harderr = 0;
		mb->mb_status = 0;
	}
}

mppurge(addr, cc)
	register caddr_t addr;
	register int cc;
{

	for (; cc >= 0; addr += NBPG, cc -= NBPG)
		mtpr(P1DC, addr);
}

/*
 * MPCC Download Pseudo-device.
 */
char	mpdlbuf[MPDLBUFSIZE];
int	mpdlbusy;		/* interlock on download buffer */
int	mpdlerr;

mpdlopen(dev)
	dev_t dev;
{
	int unit, mpu;
	struct vba_device *vi;

	unit = minor(dev);
	mpu = MPUNIT(unit);
	if (mpu >= NMP || (vi = mpinfo[mpu]) == 0 || vi->ui_alive == 0)
		return (ENODEV);
	return (0);
}

mpdlwrite(dev, uio)
	dev_t dev;
	struct uio *uio;
{
	register struct mpsoftc *ms = &mp_softc[MPUNIT(minor(dev))];
	register struct mpdl *dl;
	int error;

	if (ms->ms_mb == 0 || ms->ms_mb->mb_status != MP_DLOPEN)
		return (EFAULT);
	dl = &ms->ms_mb->mb_dl;
	dl->mpdl_count = uio->uio_iov->iov_len;
	dl->mpdl_data = (caddr_t) kvtophys(mpdlbuf);
	if (error = uiomove(mpdlbuf, (int)dl->mpdl_count, uio))
		return (error);
	uio->uio_resid -= dl->mpdl_count;    /* set up return from write */
	dl->mpdl_cmd = MPDLCMD_NORMAL;
	error = mpdlwait(dl);
	return (error);
}

mpdlclose(dev)
	dev_t dev;
{
	register struct mblok *mb = mp_softc[MPUNIT(minor(dev))].ms_mb;

	if (mb == 0 || mb->mb_status != MP_DLDONE) {
		mpbogus.status = 0;
		if (mpbogus.mb == mpbogus.mbloks[MPUNIT(minor(dev))])
			mpdlbusy--;
		return (EEXIST);
	}
	mb->mb_status = MP_OPOPEN;
	mpbogus.status = 0;
	/* set to dead, for board handshake */
	mb->mb_hostint.imok = MPIMOK_DEAD;
	return (0);
}

/* ARGSUSED */
mpdlioctl(dev, cmd, data, flag)
	dev_t dev;
	caddr_t data;
{
	register struct mblok *mb;
	register struct mpdl *dl;
	int unit, error = 0, s, i;

	mb = mp_softc[unit=MPUNIT(minor(dev))].ms_mb;
	if (mb == 0)
		 return (EEXIST);
	dl = &mb->mb_dl;
	error = 0;
	switch (cmd) {
	case MPIOPORTMAP:
		bcopy(data, (caddr_t)mb->mb_proto, sizeof (mb->mb_proto));
		break;
	case MPIOHILO:
		bcopy(data, (caddr_t)&mb->mb_hiport, 2*(sizeof(mb->mb_hiport)));
		break;
	case MPIOENDDL:
		dl->mpdl_count = 0;
		dl->mpdl_data = 0;
		dl->mpdl_cmd = MPIOENDDL&IOCPARM_MASK;
		error = mpdlwait(dl);
		mpccinit(unit);
		mb->mb_status = MP_DLDONE;
		mpdlbusy--;
		break;
	case MPIOENDCODE:
		dl->mpdl_count = 0;
		dl->mpdl_data = 0;
		dl->mpdl_cmd = MPIOENDCODE&IOCPARM_MASK;
		error = mpdlwait(dl);
		break;
	case MPIOASYNCNF:
		bcopy(data, mpdlbuf, sizeof (struct abdcf));
		dl->mpdl_data = (caddr_t) kvtophys(mpdlbuf);
		dl->mpdl_count = sizeof (struct abdcf);
		dl->mpdl_cmd = MPIOASYNCNF&IOCPARM_MASK;
		error = mpdlwait(dl);
		break;
	case MPIOSTARTDL:
		s = spl8();
		while (mpdlbusy)
			if (error = tsleep((caddr_t)&mpdlbusy,
			    (PZERO+1) | PCATCH, devioc, 0))
				break;
		splx(s);
		if (error)
			break;
		mpdlbusy++;
		/* initialize the downloading interface */
		mpbogus.magic = MPMAGIC;
		mpbogus.mb = mpbogus.mbloks[unit];
		mpbogus.status = 1;
		dl->mpdl_status = EVSTATUS_FREE;
		dl->mpdl_count = 0;
		dl->mpdl_cmd = 0;
		dl->mpdl_data = (char *) 0;
		mpdlerr = 0;
		mb->mb_magic = MPMAGIC;
        	mb->mb_ivec = mp_softc[unit].ms_ivec+1;	/* download vector */
		mb->mb_status = MP_DLPEND;
		mb->mb_diagswitch[0] = 'A';
		mb->mb_diagswitch[1] = 'P';
		s = spl8();
		*(u_short *)mpinfo[unit]->ui_addr = 2;
		error = tsleep((caddr_t)&mb->mb_status, (PZERO+1) | PCATCH,
		    devio, 30*hz);
		splx(s);
		if (error == EWOULDBLOCK)
			error = ETIMEDOUT;
		if (error)
			mpbogus.status = 0;
		bzero((caddr_t)mb->mb_port, sizeof (mb->mb_port));
		break;
	case MPIORESETBOARD:
		s = spl8();
		if (mb->mb_imokclk)
			mb->mb_imokclk = 0;
		*(u_short *)mpinfo[unit]->ui_addr = 0x100;
		if (mb->mb_status == MP_DLOPEN || mb->mb_status == MP_DLDONE) {
			mpdlerr = MP_DLERROR;
			dl->mpdl_status = EVSTATUS_FREE;
			wakeup((caddr_t)&dl->mpdl_status);
			mpbogus.status = 0;
		}
		for (i = 0; i < MPMAXPORT; i++) {
			if (mb->mb_harderr || mb->mb_softerr)
				mperror(mb, i);
			mpcleanport(mb, i);
			mb->mb_proto[i] = MPPROTO_UNUSED;
		}
		mb->mb_status = 0;
		splx(s);
		break;
	default:
		error = EINVAL;
		break;
	}
	return (error);
}

mpccinit(unit)
	int unit;
{
        register struct mblok *mb = mp_softc[unit].ms_mb;
        register struct his *his;
        register int i, j;

        mb->mb_status = MP_DLDONE;
        mb->mb_ivec = mp_softc[unit].ms_ivec;
        mb->mb_magic = MPMAGIC;
        /* Init host interface structure */
        his = &mb->mb_hostint;
        his->semaphore = MPSEMA_AVAILABLE;
        for (i = 0; i < NMPPROTO; i++)
                for (j = 0; j < MPMAXPORT; j++) {
                        his->proto[i].inbdone[j] = MPPORT_EOL;
                        his->proto[i].outbdone[j] = MPPORT_EOL;
                }
        mb->mb_unit = unit;
}

mpdlintr(mpcc)
	int mpcc;
{
	register struct mblok *mb;
	register struct mpdl *dl;

	mb = mp_softc[mpcc].ms_mb;
	if (mb == 0) {
		printf("mp%d: stray download interrupt\n", mpcc);
		return;
	}
	dl = &mb->mb_dl;
	switch (mb->mb_status) {
	case MP_DLOPEN:
		if (dl->mpdl_status != EVSTATUS_DONE)
			mpdlerr = MP_DLERROR;
		dl->mpdl_status = EVSTATUS_FREE;
		wakeup((caddr_t)&dl->mpdl_status);
		return;
	case MP_DLPEND:
		mb->mb_status = MP_DLOPEN;
		wakeup((caddr_t)&mb->mb_status);
		/* fall thru... */
	case MP_DLTIME:
		return;
	case MP_OPOPEN:
		if (mb->mb_imokclk)
			mb->mb_imokclk = 0;
		mb->mb_nointcnt = 0;		/* reset no interrupt count */
		mb->mb_hostint.imok = MPIMOK_DEAD;
		mb->mb_imokclk = (caddr_t)1;
		break;
	default:
		log(LOG_ERR, "mp%d: mpdlintr, status %x\n",
		    mpcc, mb->mb_status);
		break;
	}
}

/* 
 * Wait for a transfer to complete or a timeout to occur.
 */
mpdlwait(dl)
	register struct mpdl *dl;
{
	int s, error = 0;

	s = spl8();
	dl->mpdl_status = EVSTATUS_GO;
	while (dl->mpdl_status != EVSTATUS_FREE) {
		error = tsleep((caddr_t)&dl->mpdl_status, (PZERO+1) | PCATCH,
		    devout, 0);
		if (mpdlerr == MP_DLERROR)
			error = EIO;
		if (error)
			break;
	}
	splx(s);
	return (error);
}
#endif
