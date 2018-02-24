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
 *	@(#)kbd.c	8.2 (Berkeley) 12/6/93
 */

/*
 * kbd.c -- keyboard device driver
 *	remade by A.Fujita, DEC-21-1992
 */

#define NKBD	2

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
#include <luna68k/dev/kbio.h>

extern	struct sio_portc *sio_port_assign();
extern	struct sio_portc *sio_port_get();

struct	sio_softc kbd_softc[NKBD];
struct	sio_portc kbd_sport;
struct	sio_portc *kbd_pc;

int     kbdopen();
void    kbdstart();
int     kbdparam();
int     kbdintr();

struct	tty kbd_tty[NKBD];

int	kbddefaultrate = B9600;				/* speed of console line is fixed */
int	kbdmajor = 14;
int	kbd_state = 0;

#define	kbdunit(x)		minor(x)

/*
 *  entry routines
 */

/* ARGSUSED */
#ifdef __STDC__
kbdopen(dev_t dev, int flag, int mode, struct proc *p)
#else
kbdopen(dev, flag, mode, p)
	dev_t dev;
	int flag, mode;
	struct proc *p;
#endif
{
	register struct tty *tp;
	register int unit, s;
	register struct sio_portc *pc;
	int error = 0;

	unit = kbdunit(dev);

	if (unit != 0)
		return (ENXIO);

	if (kbd_state == 0) {
		s = splhigh();
		pc = sio_port_get(1);
		kbd_sport = *pc;
		kbd_pc = sio_port_assign(1, kbdmajor, unit, kbdintr);
		splx(s);
	}
	kbd_softc[unit].sc_pc = kbd_pc;
	kbd_state |= 1 << unit;

	tp = &kbd_tty[unit];
	tp->t_oproc = kbdstart;
	tp->t_param = kbdparam;
	tp->t_dev = dev;
	if ((tp->t_state & TS_ISOPEN) == 0) {
		tp->t_state |= TS_WOPEN;
		ttychars(tp);
		if (tp->t_ispeed == 0) {
/*
			tp->t_iflag = TTYDEF_IFLAG;
			tp->t_oflag = TTYDEF_OFLAG;
			tp->t_cflag = TTYDEF_CFLAG;
			tp->t_lflag = TTYDEF_LFLAG;
 */
			tp->t_iflag = 0;
			tp->t_oflag = 0;
			tp->t_cflag = (CREAD | CS8 | HUPCL);
			tp->t_lflag = 0;

			tp->t_ispeed = tp->t_ospeed = kbddefaultrate;
		}
		ttsetwater(tp);
	} else if (tp->t_state&TS_XCLUDE && p->p_ucred->cr_uid != 0)
		return (EBUSY);

	tp->t_state |= TS_CARR_ON;

	if (error == 0)
		error = (*linesw[tp->t_line].l_open)(dev, tp);

	return (error);
}

/*ARGSUSED*/
kbdclose(dev, flag, mode, p)
	dev_t dev;
	int flag, mode;
	struct proc *p;
{
	register struct siodevice *sio = kbd_pc->pc_addr;
	register struct	sio_portc *pc;
	register struct tty *tp;
	register int unit, s;
	int  code, rr;

	unit = kbdunit(dev);

	tp = &kbd_tty[unit];
	(*linesw[tp->t_line].l_close)(tp, flag);
	ttyclose(tp);

	kbd_state &= ~(1 << unit);

	if (kbd_state == 0) {
		s = splhigh();

		while((rr = siogetreg(sio)) & RR_RXRDY) {
			code = sio->sio_data;
			DELAY(100);
		}

		pc = &kbd_sport;
		(void) sio_port_assign(1, pc->pc_major, pc->pc_unit, pc->pc_intr);
		splx(s);
	}

	return (0);
}
 
kbdread(dev, uio, flag)
	dev_t dev;
	struct uio *uio;
{
	register struct tty *tp = &kbd_tty[kbdunit(dev)];
 
	return ((*linesw[tp->t_line].l_read)(tp, uio, flag));
}

int
kbdparam(tp, t)
	register struct tty *tp;
	register struct termios *t;
{
	int unit = kbdunit(tp->t_dev);
	register struct sio_softc *sc = &kbd_softc[unit];
	register int cflag = t->c_cflag;
 
        /* and copy to tty */
        tp->t_ispeed = t->c_ispeed;
        tp->t_ospeed = t->c_ospeed;
        tp->t_cflag = cflag;

	/*
	 * change line speed
	 */

	/*
	 * parity
	 */

	/*
	 * stop bit
	 */

	return (0);
}

kbdioctl(dev, cmd, data, flag, p)
	dev_t dev;
	int cmd;
	caddr_t data;
	int flag;
	struct proc *p;
{
	register struct siodevice *sio = kbd_pc->pc_addr;
	register struct tty *tp;
	register int unit = kbdunit(dev);
	register int error;
	int code, rr, s;

	tp = &kbd_tty[unit];
	error = (*linesw[tp->t_line].l_ioctl)(tp, cmd, data, flag, p);
	if (error >= 0)
		return (error);
	error = ttioctl(tp, cmd, data, flag);
	if (error >= 0)
		return (error);

	switch (cmd) {

	case KIOCMOUSE:
		if (*((int *) data)) {
			sio->sio_data = 0x60;	/* enable  mouse tracking */
		} else {
			s = splhigh();
			sio->sio_data = 0x20;	/* disable mouse tracking */
			while((rr = siogetreg(sio)) & RR_RXRDY) {
				code = sio->sio_data;
				DELAY(100);
			}
			splx(s);
		}
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
kbdstart(tp)
	register struct tty *tp;
{
	register int unit;
	register struct siodevice *sio = kbd_pc->pc_addr;
	register int rr;
	int s, c;
 
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

	if (tp->t_outq.c_cc != 0)
		c = getc(&tp->t_outq);

out:
	splx(s);
}

/*
 *  interrupt handling 
 */

kbdintr(unit)
	register int unit;
{
	register struct siodevice *sio = kbd_pc->pc_addr;
	register struct tty *tp;
	register u_char code;
	int s, rr;

	tp = &kbd_tty[0];		/* Keyboard */
	rr = siogetreg(sio);

	if (rr & RR_RXRDY) {
		code = sio->sio_data;
		if ((tp->t_state & TS_ISOPEN) != 0)
			(*linesw[tp->t_line].l_rint)(code, tp);

		while ((rr = siogetreg(sio)) & RR_RXRDY) {
			code = sio->sio_data;
			if ((tp->t_state & TS_ISOPEN) != 0)
				(*linesw[tp->t_line].l_rint)(code, tp);
		}
	}

	if (rr & RR_TXRDY) {
		sio->sio_cmd = WR0_RSTPEND;
	}
}
