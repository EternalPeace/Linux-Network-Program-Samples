/*
 * Copyright (c) 1992 OMRON Corporation.
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * OMRON Corporation.
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
 *	@(#)sio.c	8.1 (Berkeley) 6/10/93
 */

/*
 * sio.c -- NEC uPD7201A UART Device Driver
 *    remaked by A.Fujita, NOV-5-1992
 */

#include "sio.h"
#if NSIO > 0

#include "bmc.h"

#include <sys/param.h>
#include <sys/systm.h>
#include <sys/ioctl.h>
#include <sys/proc.h>
#include <sys/tty.h>
#include <sys/conf.h>
#include <sys/file.h>
#include <sys/uio.h>
#include <sys/kernel.h>
#include <sys/syslog.h>

#include <luna68k/dev/device.h>
#include <luna68k/dev/sioreg.h>
#include <luna68k/dev/siovar.h>

struct sio_portc *sio_port_assign();
struct sio_portc *sio_port_get();

int	sioprobe();
int	sioopen();
void	siostart();
int	sioparam();
int	siointr();

struct	driver siodriver = {
	sioprobe, "sio",
};

struct	sio_portc sio_portc[NPORT] = {
	{ -1, -1, 0, (struct siodevice *) 0x51000000, (int (*)()) 0 },
	{ -1, -1, 1, (struct siodevice *) 0x51000004, (int (*)()) 0 }
};

struct	sio_softc sio_softc[NSIO];

int	sio_init_done = 0;

int	siosoftCAR;
int	sio_active;
int	sioconsole = -1;
int	siodefaultrate = TTYDEF_SPEED;
int	siomajor = 12;

struct	tty sio_tty[NSIO];

struct speedtab siospeedtab[] = {
	2400,	WR4_BAUD24,
	4800,	WR4_BAUD48,
	9600,	WR4_BAUD96,
};

#define	siounit(x)		minor(x)

extern	struct tty *constty;

#ifdef KGDB
/*
 * Kernel GDB support
 */
#include <machine/remote-sl.h>

extern dev_t kgdb_dev;
extern int kgdb_rate;
extern int kgdb_debug_init;
#endif

/*
 *  probe routines
 */

sioprobe(hd)
	register struct hp_device *hd;
{
	int unit = hd->hp_unit;
	register struct sio_softc *sc = &sio_softc[unit];
	register struct sio_portc *pc;

	if (sc->sc_pc != 0) {
		pc = sc->sc_pc;
		printf("sio%d: port %d, address 0x%x, intr 0x%x (console)\n",
		       pc->pc_unit, pc->pc_port, pc->pc_addr, pc->pc_intr);
		return(1);
	}

	sc->sc_pc = pc = sio_port_assign(unit, siomajor, unit, siointr);

	printf("sio%d: port %d, address 0x%x, intr 0x%x\n",
	       pc->pc_unit, pc->pc_port, pc->pc_addr, pc->pc_intr);

	sio_active |= 1 << unit;

#ifdef KGDB
	if (major(kgdb_dev) == siomajor) {
#ifdef	notdef
		if (sioconsole == siounit(kgdb_dev)) {
			kgdb_dev = NODEV; /* can't debug over console port */
		} else {
#endif
		/*
		 * The following could potentially be replaced
		 * by the corresponding code in dcmcnprobe.
		 */
			if (kgdb_debug_init) {
				printf("sio%d: ", siounit(kgdb_dev));
				kgdb_connect(1);
			} else
				printf("sio%d: kgdb enabled\n", siounit(kgdb_dev));
#ifdef	notdef
		}
#endif
		/* end could be replaced */
	}
#endif

	siosoftCAR |= 1 << unit;
	return(1);
}

struct sio_portc *
sio_port_assign(port, major, unit, intr)
	int	port, major, unit;
	int	(*intr)();
{
	register struct sio_portc *pc;

	pc = &sio_portc[port];

	pc->pc_major = major;
	pc->pc_intr  = intr;
	pc->pc_unit  = unit;

	return(pc);
}

struct sio_portc *
sio_port_get(port)
	int port;
{
	register struct sio_portc *pc;

	pc = &sio_portc[port];

	return(pc);
}

int 
sio_port_info()
{
	printf("sio_port_info[sio.c]:\t{%d}       major = %d, unit = %d, intr = 0x%x\n",
		0, sio_portc[0].pc_major, sio_portc[0].pc_unit, sio_portc[0].pc_intr);
	printf("sio_port_info[sio.c]:\t{%d}       major = %d, unit = %d, intr = 0x%x\n",
		1, sio_portc[1].pc_major, sio_portc[1].pc_unit, sio_portc[1].pc_intr);
}


/*
 *  entry routines
 */

/* ARGSUSED */
#ifdef __STDC__
sioopen(dev_t dev, int flag, int mode, struct proc *p)
#else
sioopen(dev, flag, mode, p)
	dev_t dev;
	int flag, mode;
	struct proc *p;
#endif
{
	register struct tty *tp;
	register int unit;
	int error = 0;

	unit = siounit(dev);
	if (unit >= NSIO || (sio_active & (1 << unit)) == 0)
		return (ENXIO);
	tp = &sio_tty[unit];
	tp->t_oproc = siostart;
	tp->t_param = sioparam;
	tp->t_dev = dev;
	if ((tp->t_state & TS_ISOPEN) == 0) {
		tp->t_state |= TS_WOPEN;
		ttychars(tp);
		if (tp->t_ispeed == 0) {
			tp->t_iflag = TTYDEF_IFLAG;
			tp->t_oflag = TTYDEF_OFLAG;
/*			tp->t_cflag = TTYDEF_CFLAG;		*/
			tp->t_cflag = (CREAD | CS8 | HUPCL);
			tp->t_lflag = TTYDEF_LFLAG;
			tp->t_ispeed = tp->t_ospeed = siodefaultrate;
		}
		sioparam(tp, &tp->t_termios);
		ttsetwater(tp);
	} else if (tp->t_state&TS_XCLUDE && p->p_ucred->cr_uid != 0)
		return (EBUSY);
	(void) siomctl(dev, WR5_DTR | WR5_RTS, DMSET);
	if ((siosoftCAR & (1 << unit)) || (siomctl(dev, 0, DMGET) & RR0_DCD))
		tp->t_state |= TS_CARR_ON;
	(void) spltty();
	while ((flag&O_NONBLOCK) == 0 && (tp->t_cflag&CLOCAL) == 0 &&
	       (tp->t_state & TS_CARR_ON) == 0) {
		tp->t_state |= TS_WOPEN;
		if (error = ttysleep(tp, (caddr_t)&tp->t_rawq, TTIPRI | PCATCH,
		    ttopen, 0))
			break;
	}
	(void) spl0();
	if (error == 0)
		error = (*linesw[tp->t_line].l_open)(dev, tp);
	return (error);
}

/*ARGSUSED*/
sioclose(dev, flag, mode, p)
	dev_t dev;
	int flag, mode;
	struct proc *p;
{
	register struct tty *tp;
	register int unit;

	unit = siounit(dev);
	tp = &sio_tty[unit];
	(*linesw[tp->t_line].l_close)(tp, flag);
	(void) siomctl(dev, WR5_BREAK, DMBIS);
	if (tp->t_cflag&HUPCL || tp->t_state&TS_WOPEN ||
	    (tp->t_state&TS_ISOPEN) == 0)
		(void) siomctl(dev, 0, DMSET);
	ttyclose(tp);
	return (0);
}
 
sioread(dev, uio, flag)
	dev_t dev;
	struct uio *uio;
{
	register struct tty *tp = &sio_tty[siounit(dev)];
 
	return ((*linesw[tp->t_line].l_read)(tp, uio, flag));
}
 
siowrite(dev, uio, flag)
	dev_t dev;
	struct uio *uio;
{
	register int unit = siounit(dev);
	register struct tty *tp = &sio_tty[unit];

	if ((unit == sioconsole) && constty &&
	    (constty->t_state&(TS_CARR_ON|TS_ISOPEN))==(TS_CARR_ON|TS_ISOPEN))
		tp = constty;

	return ((*linesw[tp->t_line].l_write)(tp, uio, flag));
}

/*
 * Stop output on a line.
 */
/*ARGSUSED*/
siostop(tp, flag)
	register struct tty *tp;
{
	register int s;

	s = spltty();
	if (tp->t_state & TS_BUSY) {
		if ((tp->t_state&TS_TTSTOP)==0)
			tp->t_state |= TS_FLUSH;
	}
	splx(s);
}

sioioctl(dev, cmd, data, flag, p)
	dev_t dev;
	int cmd;
	caddr_t data;
	int flag;
	struct proc *p;
{
	register struct tty *tp;
	register int unit = siounit(dev);
	register int error;

	tp = &sio_tty[unit];
	error = (*linesw[tp->t_line].l_ioctl)(tp, cmd, data, flag, p);
	if (error >= 0)
		return (error);
	error = ttioctl(tp, cmd, data, flag);
	if (error >= 0)
		return (error);

	switch (cmd) {

	case TIOCSBRK:
		(void) siomctl(dev, WR5_BREAK, DMBIS);
		break;

	case TIOCCBRK:
		(void) siomctl(dev, WR5_BREAK, DMBIC);
		break;

	case TIOCSDTR:
		(void) siomctl(dev, WR5_DTR | WR5_RTS, DMBIS);
		break;

	case TIOCCDTR:
		(void) siomctl(dev, WR5_DTR | WR5_RTS, DMBIC);
		break;

	case TIOCMSET:
		(void) siomctl(dev, *(int *)data, DMSET);
		break;

	case TIOCMBIS:
		(void) siomctl(dev, *(int *)data, DMBIS);
		break;

	case TIOCMBIC:
		(void) siomctl(dev, *(int *)data, DMBIC);
		break;

	case TIOCMGET:
		*(int *)data = siomctl(dev, 0, DMGET);
		break;

	default:
		return (ENOTTY);
	}
	return (0);
}


/*
 *
 */

void
siostart(tp)
	register struct tty *tp;
{
	register struct siodevice *sio;
	register int rr;
	int s, unit, c;
 
	unit = siounit(tp->t_dev);
	sio = sio_softc[unit].sc_pc->pc_addr;
	s = spltty();
	if (tp->t_state & (TS_TIMEOUT|TS_TTSTOP))
		goto out;
	if (tp->t_outq.c_cc <= tp->t_lowat) {
		if (tp->t_state&TS_ASLEEP) {
			tp->t_state &= ~TS_ASLEEP;
			wakeup((caddr_t)&tp->t_outq);
		}
		selwakeup(&tp->t_wsel);
	}
	if (tp->t_outq.c_cc == 0)
		goto out;
	rr = siogetreg(sio);
	if (rr & RR_TXRDY) {
		c = getc(&tp->t_outq);
		tp->t_state |= TS_BUSY;
		sio->sio_data = c;
	}
out:
	splx(s);
}

sioparam(tp, t)
	register struct tty *tp;
	register struct termios *t;
{
	int unit = siounit(tp->t_dev);
	register struct siodevice *sio;
	register cflag = t->c_cflag;
	register u_char wr;
	int ospeed = ttspeedtab(t->c_ospeed, siospeedtab);

	sio = sio_softc[unit].sc_pc->pc_addr;

	switch (cflag & CSIZE) {
	case CS5:
	case CS6:
	case CS7:
	case CS8:
		break;
	}

	wr = ospeed;

	if (cflag & PARENB) {
		wr |= WR4_PARENAB;
		if ((cflag&PARODD) == 0)
			wr |= WR4_EPARITY;
	}

	if (cflag & CSTOPB)
		wr |= WR4_STOP2;			/* 2 stop bit */
	else
		wr |= WR4_STOP1;			/* 1 stop bit */

	(void) sioreg(sio, WR4, wr);

	return (0);
}

siomctl()
{
	return (0);
}


/*
 *  Interrupt handling
 */

void
_siointr()
{
	register int port;
	register struct sio_portc *pc;

	for (port = 0; port < NPORT; port++) {
		pc = &sio_portc[port];

		if (pc->pc_major != -1)
			(pc->pc_intr)(pc->pc_unit);
	}
}

siointr(unit)
	register int unit;
{
	register struct siodevice *sio = sio_softc[unit].sc_pc->pc_addr;
	register u_char code;
	register struct tty *tp;
	int s, rr;

	tp = &sio_tty[unit];

start:
	rr = siogetreg(sio);
	if (rr & RR_RXRDY) {
		if (rr & (RR_FRAMING | RR_OVERRUN | RR_PARITY)) {
			sioeint(unit, rr, sio);
			goto start;
		}

		code = sio->sio_data;
		if ((tp->t_state & TS_ISOPEN) != 0)
			(*linesw[tp->t_line].l_rint)(code, tp);
#ifdef KGDB
		else {
			if (code == FRAME_END &&
			    kgdb_dev == makedev(siomajor, unit))
				kgdb_connect(0); /* trap into kgdb */
		}
#endif
		while ((rr = siogetreg(sio)) & RR_RXRDY) {
			code = sio->sio_data;
			if ((tp->t_state & TS_ISOPEN) != 0)
				(*linesw[tp->t_line].l_rint)(code, tp);
#ifdef KGDB
			else {
				if (code == FRAME_END &&
				    kgdb_dev == makedev(siomajor, unit))
					kgdb_connect(0); /* trap into kgdb */
			}
#endif
		}
	}

	if (rr & RR_TXRDY) {
		sio->sio_cmd = WR0_RSTPEND;
		tp->t_state &= ~(TS_BUSY|TS_FLUSH);
		if (tp->t_line)
			(*linesw[tp->t_line].l_start)(tp);
		else
			siostart(tp);
	}
}

sioeint(unit, stat, sio)
	register int unit, stat;
	register struct siodevice *sio;
{
	register struct tty *tp;
	register int code;

	tp = &sio_tty[unit];

	code = sio->sio_data;

	sio->sio_cmd = WR0_ERRRST;

	if ((tp->t_state & TS_ISOPEN) == 0) {
#ifdef KGDB
		/* we don't care about parity errors */
		if (((stat & (RR_FRAMING|RR_PARITY)) == RR_PARITY) &&
		    kgdb_dev == makedev(siomajor, unit) && code == FRAME_END)
			kgdb_connect(0); /* trap into kgdb */
#endif
		return;
	}

	if (stat & RR_FRAMING)
		code |= TTY_FE;
	else if (stat & RR_PARITY)
		code |= TTY_PE;

	(*linesw[tp->t_line].l_rint)(code, tp);
}

/*
 * Following are all routines needed for SIO to act as console
 */
#include <luna68k/luna68k/cons.h>

siocnprobe(cp)
	register struct consdev *cp;
{
	register int unit = 0;

	/* locate the major number */
	for (siomajor = 0; siomajor < nchrdev; siomajor++)
		if (cdevsw[siomajor].d_open == sioopen)
			break;

	/* initialize required fields */
	cp->cn_dev = makedev(siomajor, unit);
	cp->cn_tp  = &sio_tty[unit];
	cp->cn_pri = CN_NORMAL;
}

siocninit(cp)
	struct consdev *cp;
{
	int unit = siounit(cp->cn_dev);
	register struct sio_softc *sc = &sio_softc[unit];

	sioinit((struct siodevice *) SIO_HARDADDR, siodefaultrate);

	/* port assign */
	sc->sc_pc = sio_port_assign(SIO_PORT, siomajor, unit, siointr);

	sioconsole = unit;
	sio_active |= 1 << unit;
	siosoftCAR |= 1 << unit;
}

siocngetc(dev)
	dev_t dev;
{
	struct sio_softc *sc = &sio_softc[siounit(dev)];
	struct sio_portc *pc = sc->sc_pc;

	return(sio_imgetc(pc->pc_addr));
}

siocnputc(dev, c)
	dev_t dev;
	int c;
{
	struct sio_softc *sc = &sio_softc[siounit(dev)];
	struct sio_portc *pc = sc->sc_pc;

	sio_imputc(pc->pc_addr, c);
}


/*
 *  sio raw-level routines
 */

sioinit(sio0, rate)
	register struct siodevice *sio0;
	register int rate;
{
	register struct siodevice *sio1;
	int s;

	rate = ttspeedtab(rate, siospeedtab);

	if (sio_init_done)
		return;

	sio1 = (struct siodevice *) ((u_long) sio0 + sizeof(struct siodevice));

	s = splhigh();

	sioreg(sio0, WR0,  WR0_CHANRST);		/* Channel-A Reset */

	sioreg(sio0, WR2, (WR2_VEC86  | WR2_INTR_1));	/* Set CPU BUS Interface Mode */
	sioreg(sio1, WR2,  0);				/* Set Interrupt Vector */

	sioreg(sio0, WR0,  WR0_RSTINT);		/* Reset E/S Interrupt */
	sioreg(sio0, WR4, (rate | WR4_STOP1 | WR4_NPARITY));	/* Tx/Rx */
	sioreg(sio0, WR3, (WR3_RX8BIT | WR3_RXENBL));		/* Rx */
	sioreg(sio0, WR5, (WR5_TX8BIT | WR5_TXENBL));		/* Tx */
	sioreg(sio0, WR0,  WR0_RSTINT);		/* Reset E/S Interrupt */
	sioreg(sio0, WR1, (WR1_RXALLS | WR1_TXENBL));

	sioreg(sio1, WR0,  WR0_CHANRST);		/* Channel-B Reset */

	sioreg(sio1, WR0,  WR0_RSTINT);		/* Reset E/S Interrupt */
	sioreg(sio1, WR4, (rate | WR4_STOP1 | WR4_NPARITY));	/* Tx/Rx */
	sioreg(sio1, WR3, (WR3_RX8BIT | WR3_RXENBL));		/* Rx */
	sioreg(sio1, WR5, (WR5_TX8BIT | WR5_TXENBL));		/* Tx */
	sioreg(sio1, WR0,  WR0_RSTINT);		/* Reset E/S Interrupt */
	sioreg(sio1, WR1, (WR1_RXALLS | WR1_TXENBL));

	splx(s);

	sio_init_done = 1;
}

sio_imgetc(sio)
	register struct siodevice *sio;
{
	register int rr0, rr1;
	int c, s;

	s = splhigh();
	while (((rr0 = sioreg(sio, RR0, 0)) & RR0_RXAVAIL) == 0)
		;
	c = sio->sio_data;
	sioreg(sio, WR0, WR0_RSTPEND);
	splx(s);
	return (c);
}

sio_imputc(sio, c)
	register struct siodevice *sio;
	int c;
{
	register u_char code;
	register int rr;
	int s;

	s = splhigh();

	sioreg(sio, WR1, WR1_RXALLS);

	do {
		DELAY(1);
		rr = siogetreg(sio);
	} while (!(rr & RR_TXRDY));

	code = (c & 0xFF);
	sio->sio_data = code;

	do {
		DELAY(1);
		rr = siogetreg(sio);
	} while (!(rr & RR_TXRDY));

	sioreg(sio, WR1, (WR1_RXALLS | WR1_TXENBL));

	splx(s);
}

/*
 *  uPD7201A register operation
 */

int
siogetreg(sio)
	register struct siodevice *sio;
{
	register int rr = 0;

	rr = sio->sio_stat;
	rr <<= 8;
	sio->sio_cmd = 1;	/* Select RR1 */
	rr |= sio->sio_stat;

	return(rr);
}

int
sioreg(sio, reg, val)
	register struct siodevice *sio;
	register int reg, val;
{
	if (isStatusReg(reg)) {
		if (reg != 0)
		    sio->sio_cmd = reg;
		val = sio->sio_stat;
	} else {
		if (reg != 0)
		    sio->sio_cmd = reg;
		sio->sio_cmd = val;
	}

	return(val);
}
#endif
