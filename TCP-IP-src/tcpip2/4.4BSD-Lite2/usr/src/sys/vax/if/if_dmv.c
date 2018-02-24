/*
 * Copyright (c) 1988 Regents of the University of California.
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
 *	@(#)if_dmv.c	7.12 (Berkeley) 12/16/90
 */

/*
 * DMV-11 Driver
 *
 * Qbus Sync DDCMP interface - DMV operated in full duplex, point to point mode
 *
 * Written by Bob Kridle of Mt Xinu
 * starting from if_dmc.c version 6.12 dated 4/23/86
 */

#include "dmv.h"
#if NDMV > 0

#include "sys/param.h"
#include "sys/systm.h"
#include "sys/mbuf.h"
#include "sys/buf.h"
#include "sys/ioctl.h"		/* must precede tty.h */
#include "sys/tty.h"
#include "sys/protosw.h"
#include "sys/socket.h"
#include "sys/syslog.h"
#include "sys/vmmac.h"
#include "sys/errno.h"
#include "sys/time.h"
#include "sys/kernel.h"

#include "net/if.h"
#include "net/netisr.h"
#include "net/route.h"

#ifdef	INET
#include "netinet/in.h"
#include "netinet/in_systm.h"
#include "netinet/in_var.h"
#include "netinet/ip.h"
#endif

#include "../include/cpu.h"
#include "../include/mtpr.h"
#include "../include/pte.h"
#include "../uba/ubareg.h"
#include "../uba/ubavar.h"
#include "if_uba.h"
#include "if_dmv.h"

int	dmv_timeout = 8;		/* timeout value */

/*
 * Driver information for auto-configuration stuff.
 */
int	dmvprobe(), dmvattach(), dmvinit(), dmvioctl();
int	dmvoutput(), dmvreset(), dmvtimeout();
struct	uba_device *dmvinfo[NDMV];
u_short	dmvstd[] = { 0 };
struct	uba_driver dmvdriver =
	{ dmvprobe, 0, dmvattach, 0, dmvstd, "dmv", dmvinfo };

/*
 * Don't really know how many buffers/commands can be queued to a DMV-11.
 * Manual doesn't say... Perhaps we can look at a DEC driver some day.
 * These numbers ame from DMC/DMR driver.
 */
#define NRCV 5
#define NXMT 3 
#define NCMDS	(NRCV+NXMT+4)	/* size of command queue */

#ifdef DEBUG
#define printd(f)   if (sc->sc_if.if_flags & IFF_DEBUG) \
	printf("DMVDEBUG: dmv%d: ", unit), printf(f)
#else
#define	printd(f)	/* nil */
#endif

/* error reporting intervals */

#define	DMV_RPRTE	 1
#define	DMV_RPTTE        1
#define	DMV_RPSTE	 1
#define DMV_RPNXM        1
#define DMV_RPMODD       1
#define DMV_RPQOVF	 1
#define DMV_RPCXRL	 1

/* number of errors to accept before trying a reset */
#define DMV_RPUNKNOWN	 10

struct  dmv_command {
	u_char	qp_mask;	/* Which registers to set up */
#define	QP_TRIB		0x01
#define	QP_SEL4		0x02
#define	QP_SEL6		0x04
#define	QP_SEL10	0x08
	u_char	qp_cmd;
	u_char	qp_tributary;
	u_short	qp_sel4;
	u_short	qp_sel6;
	u_short	qp_sel10;
	struct	dmv_command *qp_next;	/* next command on queue */
};

#define	qp_lowbufaddr	qp_

struct dmvbufs {
	int	ubinfo;		/* from uballoc */
	short	cc;		/* buffer size */
	short	flags;		/* access control */
};

#define	DBUF_OURS	0	/* buffer is available */
#define	DBUF_DMVS	1	/* buffer claimed by somebody */
#define	DBUF_XMIT	4	/* transmit buffer */
#define	DBUF_RCV	8	/* receive buffer */


/*
 * DMV software status per interface.
 *
 * Each interface is referenced by a network interface structure,
 * sc_if, which the routing code uses to locate the interface.
 * This structure contains the output queue for the interface, its address, ...
 * We also have, for each interface, a  set of 7 UBA interface structures
 * for each, which
 * contain information about the UNIBUS resources held by the interface:
 * map registers, buffered data paths, etc.  Information is cached in this
 * structure for use by the if_uba.c routines in running the interface
 * efficiently.
 */
struct dmv_softc {
	struct	ifnet sc_if;		/* network-visible interface */
	short	sc_oused;		/* output buffers currently in use */
	short	sc_iused;		/* input buffers given to DMV */
	short	sc_flag;		/* flags */
	short	sc_ipl;			/* interrupt priority */
	int	sc_ubinfo;		/* UBA mapping info for base table */
	int	sc_errors[8];		/* error counters */
#define	sc_rte	sc_errors[0]		/* receive threshhold error */
#define	sc_xte	sc_errors[1]		/* xmit threshhold error */
#define	sc_ste	sc_errors[2]		/* select threshhold error */
#define	sc_nxm	sc_errors[3]		/* non-existant memory */
#define	sc_modd	sc_errors[4]		/* modem disconnect */
#define	sc_qovf	sc_errors[5]		/* command/response queue overflow */
#define	sc_cxrl	sc_errors[6]		/* carrier loss */
#define sc_unknown sc_errors[7]		/* other errors - look in DMV manual */
	struct	dmvbufs sc_rbufs[NRCV];	/* receive buffer info */
	struct	dmvbufs sc_xbufs[NXMT];	/* transmit buffer info */
	struct	ifubinfo sc_ifuba;	/* UNIBUS resources */
	struct	ifrw sc_ifr[NRCV];	/* UNIBUS receive buffer maps */
	struct	ifxmt sc_ifw[NXMT];	/* UNIBUS receive buffer maps */
	/* command queue stuff */
	struct	dmv_command sc_cmdbuf[NCMDS];
	struct	dmv_command *sc_qhead;	/* head of command queue */
	struct	dmv_command *sc_qtail;	/* tail of command queue */
	struct	dmv_command *sc_qactive;	/* command in progress */
	struct	dmv_command *sc_qfreeh;	/* head of list of free cmd buffers */
	struct	dmv_command *sc_qfreet;	/* tail of list of free cmd buffers */
	/* end command queue stuff */
} dmv_softc[NDMV];

/* flags */
#define DMV_RESTART	0x01		/* software restart in progress */
#define DMV_ONLINE	0x02		/* device managed to transmit */
#define DMV_RUNNING	0x04		/* device initialized */


/* queue manipulation macros */
#define	QUEUE_AT_HEAD(qp, head, tail) \
	(qp)->qp_next = (head); \
	(head) = (qp); \
	if ((tail) == (struct dmv_command *) 0) \
		(tail) = (head) 

#define QUEUE_AT_TAIL(qp, head, tail) \
	if ((tail)) \
		(tail)->qp_next = (qp); \
	else \
		(head) = (qp); \
	(qp)->qp_next = (struct dmv_command *) 0; \
	(tail) = (qp)

#define DEQUEUE(head, tail) \
	(head) = (head)->qp_next;\
	if ((head) == (struct dmv_command *) 0)\
		(tail) = (head)

dmvprobe(reg, ui)
	caddr_t reg;
	struct uba_device *ui;
{
	register int br, cvec;
	register struct dmvdevice *addr = (struct dmvdevice *)reg;
	register int i;

#ifdef lint
	br = 0; cvec = br; br = cvec;
	dmvrint(0); dmvxint(0);
#endif
	addr->bsel1 = DMV_MCLR;
	for (i = 100000; i && (addr->bsel1 & DMV_RUN) == 0; i--)
		;
	if ((addr->bsel1 & DMV_RUN) == 0) {
		printf("dmvprobe: can't start device\n" );
		return (0);
	}
	if ((addr->bsel4 != 033) || (addr->bsel6 != 0305))
	{
		printf("dmvprobe: device init failed, bsel4=%o, bsel6=%o\n",
			addr->bsel4, addr->bsel6);
		return (0);
	}
	(void) spl6();
	addr->bsel0 = DMV_RQI|DMV_IEI|DMV_IEO;
	DELAY(1000000);
	dmv_softc[ui->ui_unit].sc_ipl = br = qbgetpri();
	addr->bsel1 = DMV_MCLR;
	for (i = 100000; i && (addr->bsel1 & DMV_RUN) == 0; i--)
		;
	return (sizeof(struct dmvdevice));
}

/*
 * Interface exists: make available by filling in network interface
 * record.  System will initialize the interface when it is ready
 * to accept packets.
 */
dmvattach(ui)
	register struct uba_device *ui;
{
	register struct dmv_softc *sc = &dmv_softc[ui->ui_unit];

	sc->sc_if.if_unit = ui->ui_unit;
	sc->sc_if.if_name = "dmv";
	sc->sc_if.if_mtu = DMVMTU;
	sc->sc_if.if_init = dmvinit;
	sc->sc_if.if_output = dmvoutput;
	sc->sc_if.if_ioctl = dmvioctl;
	sc->sc_if.if_reset = dmvreset;
	sc->sc_if.if_watchdog = dmvtimeout;
	sc->sc_if.if_flags = IFF_POINTOPOINT;
	sc->sc_ifuba.iff_flags = UBA_CANTWAIT;

	if_attach(&sc->sc_if);
}

/*
 * Reset of interface after UNIBUS reset.
 * If interface is on specified UBA, reset its state.
 */
dmvreset(unit, uban)
	int unit, uban;
{
	register struct uba_device *ui;
	register struct dmv_softc *sc = &dmv_softc[unit];

	if (unit >= NDMV || (ui = dmvinfo[unit]) == 0 || ui->ui_alive == 0 ||
	    ui->ui_ubanum != uban)
		return;
	printf(" dmv%d", unit);
	sc->sc_flag = 0;
	sc->sc_if.if_flags &= ~IFF_RUNNING;
	dmvinit(unit);
}

/*
 * Initialization of interface; reinitialize UNIBUS usage.
 */
dmvinit(unit)
	int unit;
{
	register struct dmv_softc *sc = &dmv_softc[unit];
	register struct uba_device *ui = dmvinfo[unit];
	register struct dmvdevice *addr;
	register struct ifnet *ifp = &sc->sc_if;
	register struct ifrw *ifrw;
	register struct ifxmt *ifxp;
	register struct dmvbufs *rp;
	register struct dmv_command *qp;
	struct ifaddr *ifa;
	int base;
	int s;

	addr = (struct dmvdevice *)ui->ui_addr;

	/*
	 * Check to see that an address has been set
	 * (both local and destination for an address family).
	 */
	for (ifa = ifp->if_addrlist; ifa; ifa = ifa->ifa_next)
		if (ifa->ifa_addr->sa_family &&
		    ifa->ifa_addr->sa_family != AF_LINK &&
		    ifa->ifa_dstaddr && ifa->ifa_dstaddr->sa_family)
			break;
	if (ifa == (struct ifaddr *) 0)
		return;

	if ((addr->bsel1&DMV_RUN) == 0) {
		log(LOG_CRIT, "dmvinit: dmv%d not running\n", unit);
		ifp->if_flags &= ~IFF_UP;
		return;
	}
	printd(("dmvinit\n"));
	/* initialize UNIBUS resources */
	sc->sc_iused = sc->sc_oused = 0;
	if ((ifp->if_flags & IFF_RUNNING) == 0) {
		if (if_ubaminit(
			&sc->sc_ifuba,
			ui->ui_ubanum,
		    	sizeof(struct dmv_header),
			(int)btoc(DMVMTU),
			sc->sc_ifr,
			NRCV,
			sc->sc_ifw,
			NXMT
	      	) == 0) {
			log(LOG_CRIT, "dmvinit: dmv%d can't allocate uba resources\n", unit);
			ifp->if_flags &= ~IFF_UP;
			return;
		}
		ifp->if_flags |= IFF_RUNNING;
	}
	/*
	 * Limit packets enqueued until we see if we're on the air.
	 */
	ifp->if_snd.ifq_maxlen = 3;


	/* initialize buffer pool */
	/* receives */
	ifrw = &sc->sc_ifr[0];
	for (rp = &sc->sc_rbufs[0]; rp < &sc->sc_rbufs[NRCV]; rp++) {
		rp->ubinfo = UBAI_ADDR(ifrw->ifrw_info);
		rp->cc = DMVMTU + sizeof (struct dmv_header);
		rp->flags = DBUF_OURS|DBUF_RCV;
		ifrw++; 
	}
	/* transmits */
	ifxp = &sc->sc_ifw[0];
	for (rp = &sc->sc_xbufs[0]; rp < &sc->sc_xbufs[NXMT]; rp++) {
		rp->ubinfo = UBAI_ADDR(ifxp->ifw_info);
		rp->cc = 0;
		rp->flags = DBUF_OURS|DBUF_XMIT;
		ifxp++; 
	}

	/* set up command queues */
	sc->sc_qfreeh = sc->sc_qfreet
		 = sc->sc_qhead = sc->sc_qtail = sc->sc_qactive =
		(struct dmv_command *)0;
	/* set up free command buffer list */
	for (qp = &sc->sc_cmdbuf[0]; qp < &sc->sc_cmdbuf[NCMDS]; qp++) {
		QUEUE_AT_HEAD(qp, sc->sc_qfreeh, sc->sc_qfreet);
	}
	if(sc->sc_flag & DMV_RUNNING)
		dmvload( sc, DMV_CNTRLI, (QP_TRIB|QP_SEL6), 1, 0, DMV_REQHS,0);
	else
		dmvload( sc, DMV_CNTRLI, (QP_TRIB|QP_SEL6), 1, 0, DMV_ESTTRIB,0);
	dmvload( sc, DMV_CNTRLI, (QP_TRIB|QP_SEL6), 1, 0, DMV_REQSUS,0);
	sc->sc_flag |= (DMV_RESTART|DMV_RUNNING);
	sc->sc_flag &= ~DMV_ONLINE;
	addr->bsel0 |= DMV_IEO;
}

/*
 * Start output on interface.  Get another datagram
 * to send from the interface queue and map it to
 * the interface before starting output.
 *
 * Must be called at spl 5
 */
dmvstart(dev)
	dev_t dev;
{
	int unit = minor(dev);
	register struct dmv_softc *sc = &dmv_softc[unit];
	struct mbuf *m;
	register struct dmvbufs *rp;
	register int n;

	/*
	 * Dequeue up to NXMT requests and map them to the UNIBUS.
	 * If no more requests, or no dmv buffers available, just return.
	 */
	printd(("dmvstart\n"));
	n = 0;
	for (rp = &sc->sc_xbufs[0]; rp < &sc->sc_xbufs[NXMT]; rp++ ) {
		/* find an available buffer */
		if ((rp->flags & DBUF_DMVS) == 0) {
			IF_DEQUEUE(&sc->sc_if.if_snd, m);
			if (m == 0)
				return;
			/* mark it dmvs */
			rp->flags |= (DBUF_DMVS);
			/*
			 * Have request mapped to UNIBUS for transmission
			 * and start the output.
			 */
			rp->cc = if_ubaput(&sc->sc_ifuba, &sc->sc_ifw[n], m);
			if (++sc->sc_oused == 1)
				sc->sc_if.if_timer = dmv_timeout;
			dmvload(
				sc,
				DMV_BACCX,
				QP_TRIB|QP_SEL4|QP_SEL6|QP_SEL10,
				1,
				rp->ubinfo,
				(rp->ubinfo>>16)&0x3f,
				rp->cc
			);
		}
		n++;
	}
}

/*
 * Utility routine to load the DMV device registers.
 */
dmvload(sc, cmd, mask, tributary, sel4, sel6, sel10)
	register struct dmv_softc *sc;
	u_char cmd, tributary, mask;
	u_short sel4, sel6, sel10;
{
	register struct dmvdevice *addr;
	register int unit, sps;
	register struct dmv_command *qp;

	unit = sc - dmv_softc;
	printd(("dmvload: cmd=%x mask=%x trib=%x sel4=%x sel6=%x sel10=%x\n",
		(unsigned) cmd,
		(unsigned) mask,
		(unsigned) tributary,
		(unsigned) sel4,
		(unsigned) sel6,
		(unsigned) sel10
	));
	addr = (struct dmvdevice *)dmvinfo[unit]->ui_addr;
	sps = spl5();

	/* grab a command buffer from the free list */
	if ((qp = sc->sc_qfreeh) == (struct dmv_command *)0)
		panic("dmv command queue overflow");
	DEQUEUE(sc->sc_qfreeh, sc->sc_qfreet);

	/* fill in requested info */
	qp->qp_cmd = cmd;
	qp->qp_mask = mask;
	qp->qp_tributary = tributary;
	qp->qp_sel4 = sel4;
	qp->qp_sel6 = sel6;
	qp->qp_sel10 = sel10;
	
	if (sc->sc_qactive) {	/* command in progress */
		if (cmd == DMV_BACCR) {  /* supply read buffers first */
			QUEUE_AT_HEAD(qp, sc->sc_qhead, sc->sc_qtail);
		} else {
			QUEUE_AT_TAIL(qp, sc->sc_qhead, sc->sc_qtail);
		}
	} else {	/* command port free */
		sc->sc_qactive = qp;
		addr->bsel0 = (DMV_RQI|DMV_IEI|DMV_IEO);
	}
	splx(sps);
}
/*
 * DMV interface input interrupt.
 * Ready to accept another command,
 * pull one off the command queue.
 */
dmvrint(unit)
	int unit;
{
	register struct dmv_softc *sc;
	register struct dmvdevice *addr;
	register struct dmv_command *qp;
	register int n;

	addr = (struct dmvdevice *)dmvinfo[unit]->ui_addr;
	sc = &dmv_softc[unit];
	splx(sc->sc_ipl);
	printd(("dmvrint\n"));
	if ((qp = sc->sc_qactive) == (struct dmv_command *) 0) {
		log(LOG_WARNING, "dmvrint: dmv%d no command\n", unit);
		return;
	}
	while (addr->bsel2&DMV_RDI) {
		if(qp->qp_mask&QP_SEL4)
			addr->wsel4 = qp->qp_sel4;
		if(qp->qp_mask&QP_SEL6)
			addr->wsel6 = qp->qp_sel6;
		if(qp->qp_mask&QP_SEL10) {
			addr->wsel10 = qp->qp_sel10;
			qp->qp_cmd |= DMV_22BIT;
		}
		if(qp->qp_mask&QP_TRIB)
			addr->wsel2 = qp->qp_cmd|(qp->qp_tributary << 8);
		else
			addr->bsel2 = qp->qp_cmd;
		QUEUE_AT_HEAD(qp, sc->sc_qfreeh, sc->sc_qfreet);
		if ((sc->sc_qactive = sc->sc_qhead) == (struct dmv_command *)0)
			break;
		qp = sc->sc_qactive;
		DEQUEUE(sc->sc_qhead, sc->sc_qtail);
		if (addr->bsel2&DMV_RDO)
				break;
	}
	if (!sc->sc_qactive) {
		if(addr->bsel2&DMV_RDI) {
			/* clear RQI prior to last command per DMV manual */
			addr->bsel0 &= ~DMV_RQI;
			addr->wsel6 = DMV_NOP;
			addr->bsel2 = DMV_CNTRLI;
		}
		addr->bsel0 = DMV_IEO;
	}
	else /* RDO set or DMV still holding CSR */
		addr->bsel0 = (DMV_RQI|DMV_IEI|DMV_IEO);

}

/*
 * DMV interface output interrupt.
 * A transfer may have completed, check for errors.
 * If it was a read, notify appropriate protocol.
 * If it was a write, pull the next one off the queue.
 */
dmvxint(unit)
	int unit;
{
	register struct dmv_softc *sc;
	register struct ifnet *ifp;
	struct uba_device *ui = dmvinfo[unit];
	struct dmvdevice *addr;
	struct mbuf *m;
	struct ifqueue *inq;
	int sel2, sel3, sel4, sel6, sel10, pkaddr, len, s;
	register struct ifrw *ifrw;
	register struct dmvbufs *rp;
	register struct ifxmt *ifxp;
	struct dmv_header *dh;
	int off, resid;

	addr = (struct dmvdevice *)ui->ui_addr;
	sc = &dmv_softc[unit];
	splx(sc->sc_ipl);
	ifp = &sc->sc_if;

	while (addr->bsel2 & DMV_RDO) {

		sel2 = addr->bsel2;
		sel3 = addr->bsel3;
		sel4 = addr->wsel4;		/* release port */
		sel6 = addr->wsel6;
		if(sel2 & DMV_22BIT)
			sel10 = addr->wsel10;
		addr->bsel2 &= ~DMV_RDO;
		pkaddr =  sel4 | ((sel6 & 0x3f) << 16);
		printd(("dmvxint: sel2=%x sel4=%x sel6=%x sel10=%x pkaddr=%x\n",
			(unsigned) sel2,
			(unsigned) sel4,
			(unsigned) sel6,
			(unsigned) sel10,
			(unsigned) pkaddr
		));
		if((sc->sc_flag & DMV_RUNNING)==0) {
				log(LOG_WARNING, "dmvxint: dmv%d xint while down\n", unit);
				return;
		}
		switch (sel2 & 07) {
		case DMV_BDRUS:
			/*
			 * A read has completed.  
			 * Pass packet to type specific
			 * higher-level input routine.
			 */
			ifp->if_ipackets++;
			/* find location in dmvuba struct */
			ifrw= &sc->sc_ifr[0];
			for (rp = &sc->sc_rbufs[0]; rp < &sc->sc_rbufs[NRCV]; rp++) {
				if(rp->ubinfo == pkaddr)
					break;
				ifrw++;
			}
			if (rp >= &sc->sc_rbufs[NRCV])
				panic("dmv rcv");
			if ((rp->flags & DBUF_DMVS) == 0)
				log(LOG_WARNING, "dmvxint: dmv%d done unalloc rbuf\n", unit);

			len = (sel10&0x3fff) - sizeof (struct dmv_header);
			if (len < 0 || len > DMVMTU) {
				ifp->if_ierrors++;
				log(LOG_ERR, "dmvxint: dmv%d bad rcv pkt addr 0x%x len 0x%x\n",
				    unit, pkaddr, len);
				goto setup;
			}
			/*
			 * Deal with trailer protocol: if type is trailer
			 * get true type from first 16-bit word past data.
			 * Remember that type was trailer by setting off.
			 */
			dh = (struct dmv_header *)ifrw->ifrw_addr;
			dh->dmv_type = ntohs((u_short)dh->dmv_type);
#define dmvdataaddr(dh, off, type)	((type)(((caddr_t)((dh)+1)+(off))))
			if (dh->dmv_type >= DMV_TRAILER &&
			    dh->dmv_type < DMV_TRAILER+DMV_NTRAILER) {
				off = (dh->dmv_type - DMV_TRAILER) * 512;
				if (off >= DMVMTU)
					goto setup;		/* sanity */
				dh->dmv_type = ntohs(*dmvdataaddr(dh, off, u_short *));
				resid = ntohs(*(dmvdataaddr(dh, off+2, u_short *)));
				if (off + resid > len)
					goto setup;		/* sanity */
				len = off + resid;
			} else
				off = 0;
			if (len == 0)
				goto setup;

			/*
			 * Pull packet off interface.  Off is nonzero if
			 * packet has trailing header; dmv_get will then
			 * force this header information to be at the front,
			 * but we still have to drop the type and length
			 * which are at the front of any trailer data.
			 */
			m = if_ubaget(&sc->sc_ifuba, ifrw, len, off, ifp);
			if (m == 0)
				goto setup;
			switch (dh->dmv_type) {
#ifdef INET
			case DMV_IPTYPE:
				schednetisr(NETISR_IP);
				inq = &ipintrq;
				break;
#endif
			default:
				m_freem(m);
				goto setup;
			}

			s = splimp();
			if (IF_QFULL(inq)) {
				IF_DROP(inq);
				m_freem(m);
			} else
				IF_ENQUEUE(inq, m);
			splx(s);
	setup:
			/* is this needed? */
			rp->ubinfo = UBAI_ADDR(ifrw->ifrw_info);
			dmvload(
				sc,
				DMV_BACCR,
				QP_SEL4|QP_SEL6|QP_SEL10,
				0,
				(u_short) rp->ubinfo,
				(rp->ubinfo>>16)&0x3f,
				rp->cc
			);
			break;
		case DMV_BDXSA:
			/*
			 * A write has completed, start another
			 * transfer if there is more data to send.
			 */
			ifp->if_opackets++;
			/* find associated dmvbuf structure */
			ifxp = &sc->sc_ifw[0];
			for (rp = &sc->sc_xbufs[0]; rp < &sc->sc_xbufs[NXMT]; rp++) {
				if(rp->ubinfo == pkaddr)
					break;
				ifxp++;
			}
			if (rp >= &sc->sc_xbufs[NXMT]) {
				log(LOG_ERR, "dmv%d: bad packet address 0x%x\n",
				    unit, pkaddr);
				break;
			}
			if ((rp->flags & DBUF_DMVS) == 0)
				log(LOG_ERR, "dmvxint: dmv%d unallocated packet 0x%x\n",
				    unit, pkaddr);
			/* mark buffer free */
			if (ifxp->ifw_xtofree) {
				(void)m_freem(ifxp->ifw_xtofree);
				ifxp->ifw_xtofree = 0;
			}
			rp->flags &= ~DBUF_DMVS;
			if (--sc->sc_oused == 0)
				sc->sc_if.if_timer = 0;
			else
				sc->sc_if.if_timer = dmv_timeout;
			if ((sc->sc_flag & DMV_ONLINE) == 0) {
				extern int ifqmaxlen;

				/*
				 * We're on the air.
				 * Open the queue to the usual value.
				 */
				sc->sc_flag |= DMV_ONLINE;
				ifp->if_snd.ifq_maxlen = ifqmaxlen;
			}
			break;

		case DMV_CNTRLO:
			/* ACCUMULATE STATISTICS */
			switch(sel6&DMV_EEC) {
			case DMV_ORUN:
				if(sc->sc_flag & DMV_RESTART) {
					load_rec_bufs(sc);
					sc->sc_flag &= ~DMV_RESTART;
					log(LOG_INFO,
					    "dmv%d: far end on-line\n", unit);
				} else {
					log(LOG_WARNING,
					    "dmv%d: far end restart\n", unit);
					goto restart;
				}
				break;
			case DMV_RTE:
				ifp->if_ierrors++;
				if ((sc->sc_rte++ % DMV_RPRTE) == 0)
					log(LOG_WARNING,
				    "dmv%d: receive threshold error\n",
					    unit);
				break;
			case DMV_TTE:
				ifp->if_oerrors++;
				if ((sc->sc_xte++ % DMV_RPTTE) == 0)
					log(LOG_WARNING,
				    "dmv%d: transmit threshold error\n",
					    unit);
				break;
			case DMV_STE:
				if ((sc->sc_ste++ % DMV_RPSTE) == 0)
					log(LOG_WARNING,
				    "dmv%d: select threshold error\n",
					    unit);
				break;
			case DMV_NXM:
				if ((sc->sc_nxm++ % DMV_RPNXM) == 0)
					log(LOG_WARNING,
				    "dmv%d: nonexistent memory error\n",
					    unit);
				break;
			case DMV_MODD:
				if ((sc->sc_modd++ % DMV_RPMODD) == 0) {
					log(LOG_WARNING,
				    "dmv%d: modem disconnected error\n",
					    unit);
					goto restart;
				}
				break;
			case DMV_CXRL:
				if ((sc->sc_cxrl++ % DMV_RPCXRL) == 0)
					log(LOG_WARNING,
				    "dmv%d: carrier loss error\n",
					    unit);
				break;
			case DMV_QOVF:
				log(LOG_WARNING,
				    "dmv%d: response queue overflow\n",
				    unit);
				sc->sc_qovf++;
				goto restart;

			default:
				log(LOG_WARNING,
				    "dmv%d: unknown error %o\n",
				    unit, sel6&DMV_EEC);
				if ((sc->sc_unknown++ % DMV_RPUNKNOWN) == 0)
					goto restart;
				break;
			}
			break;

		case DMV_BDRUNUS:
		case DMV_BDXSN:
		case DMV_BDXNS:
			log(LOG_INFO,
			   "dmv%d: buffer disp for halted trib %o\n",
			   unit, sel2&0x7
		        );
			break;

		case DMV_MDEFO:
			if((sel6&0x1f) == 020) {
				log(LOG_INFO,
			   		"dmv%d: buffer return complete sel3=%x\n",
			   		unit, sel3);
			} else {
				log(LOG_INFO,
			   	"dmv%d: info resp sel3=%x sel4=%x sel6=%x\n",
			   	unit, sel3, sel4, sel6
		        	);
			}
			break;
			
		default:
			log(LOG_WARNING, "dmv%d: bad control %o\n",
			   unit, sel2&0x7
		        );
			break;
		}
	}
	dmvstart(unit);
	return;
restart:
	dmvrestart(unit);
}

load_rec_bufs(sc)
register struct dmv_softc *sc;
{
	register struct dmvbufs *rp;

	/* queue first NRCV buffers for DMV to fill */
	for (rp = &sc->sc_rbufs[0]; rp < &sc->sc_rbufs[NRCV]; rp++) {
		rp->flags |= DBUF_DMVS;
		dmvload(
			sc,
			DMV_BACCR,
			QP_TRIB|QP_SEL4|QP_SEL6|QP_SEL10,
			1,
			rp->ubinfo,
			(rp->ubinfo>>16)&0x3f,
			rp->cc
		);
		sc->sc_iused++;
	}
}

/*
 * DMV output routine.
 * Encapsulate a packet of type family for the dmv.
 * Use trailer local net encapsulation if enough data in first
 * packet leaves a multiple of 512 bytes of data in remainder.
 */
dmvoutput(ifp, m0, dst)
	register struct ifnet *ifp;
	register struct mbuf *m0;
	struct sockaddr *dst;
{
	int type, error, s;
	register struct mbuf *m = m0;
	register struct dmv_header *dh;
	register int off;

	if ((ifp->if_flags & IFF_UP) == 0) {
		error = ENETDOWN;
		goto bad;
	}

	switch (dst->sa_family) {
#ifdef	INET
	case AF_INET:
		off = m->m_pkthdr.len - m->m_len;
		if ((ifp->if_flags & IFF_NOTRAILERS) == 0)
		if (off > 0 && (off & 0x1ff) == 0 &&
		    (m->m_flags & M_EXT) == 0 &&
		    m->m_data >= m->m_pktdat + 2 * sizeof (u_short)) {
			type = DMV_TRAILER + (off>>9);
			m->m_data -= 2 * sizeof (u_short);
			m->m_len += 2 * sizeof (u_short);
			*mtod(m, u_short *) = htons((u_short)DMV_IPTYPE);
			*(mtod(m, u_short *) + 1) = htons((u_short)m->m_len);
			goto gottrailertype;
		}
		type = DMV_IPTYPE;
		off = 0;
		goto gottype;
#endif

	case AF_UNSPEC:
		dh = (struct dmv_header *)dst->sa_data;
		type = dh->dmv_type;
		goto gottype;

	default:
		log(LOG_ERR, "dmvoutput, dmv%d can't handle af%d\n",
		    ifp->if_unit, dst->sa_family);
		error = EAFNOSUPPORT;
		goto bad;
	}

gottrailertype:
	/*
	 * Packet to be sent as a trailer; move first packet
	 * (control information) to end of chain.
	 */
	while (m->m_next)
		m = m->m_next;
	m->m_next = m0;
	m = m0->m_next;
	m0->m_next = 0;
	m0 = m;

gottype:
	/*
	 * Add local network header
	 * (there is space for a uba on a vax to step on)
	 */
	M_PREPEND(m, sizeof(struct dmv_header), M_DONTWAIT);
	if (m == 0) {
		error = ENOBUFS;
		goto bad;
	}
	dh = mtod(m, struct dmv_header *);
	dh->dmv_type = htons((u_short)type);

	/*
	 * Queue message on interface, and start output if interface
	 * not yet active.
	 */
	s = splimp();
	if (IF_QFULL(&ifp->if_snd)) {
		IF_DROP(&ifp->if_snd);
		m_freem(m);
		splx(s);
		return (ENOBUFS);
	}
	IF_ENQUEUE(&ifp->if_snd, m);
	dmvstart(ifp->if_unit);
	splx(s);
	return (0);

bad:
	m_freem(m0);
	return (error);
}


/*
 * Process an ioctl request.
 */
/* ARGSUSED */
dmvioctl(ifp, cmd, data)
	register struct ifnet *ifp;
	int cmd;
	caddr_t data;
{
	int s = splimp(), error = 0;
	struct mbuf *m;
	register struct dmv_softc *sc = &dmv_softc[ifp->if_unit];

	switch (cmd) {

	case SIOCSIFADDR:
		ifp->if_flags |= IFF_UP;
		if ((ifp->if_flags & IFF_RUNNING) == 0)
			dmvinit(ifp->if_unit); 
		break;

	case SIOCSIFDSTADDR:
		if ((ifp->if_flags & IFF_RUNNING) == 0)
			dmvinit(ifp->if_unit); 
		break;
		
	case SIOCSIFFLAGS:
		if ((ifp->if_flags & IFF_UP) == 0 &&
		    sc->sc_flag & DMV_RUNNING)
			dmvdown(ifp->if_unit);
		else if (ifp->if_flags & IFF_UP &&
		    (sc->sc_flag & DMV_RUNNING) == 0)
			dmvrestart(ifp->if_unit);
		break;

	default:
		error = EINVAL;
	}
	splx(s);
	return (error);
}

/*
 * Restart after a fatal error.
 * Clear device and reinitialize.
 */
dmvrestart(unit)
	int unit;
{
	register struct dmvdevice *addr;
	register int i;

	dmvdown(unit);

	addr = (struct dmvdevice *)(dmvinfo[unit]->ui_addr);
	/*
	 * Let the DMV finish the MCLR.
	 */
	for (i = 100000; i && (addr->bsel1 & DMV_RUN) == 0; i--)
		;
	if ((addr->bsel1 & DMV_RUN) == 0) {
		log(LOG_ERR, "dmvrestart: can't start device\n" );
		return (0);
	}
	if ((addr->bsel4 != 033) || (addr->bsel6 != 0305))
	{
		log(LOG_ERR, "dmv%d: device init failed, bsel4=%o, bsel6=%o\n",
			unit, addr->bsel4, addr->bsel6);
		return (0);
	}

	/* restart DMV */
	dmvinit(unit);
	dmv_softc[unit].sc_if.if_collisions++;	/* why not? */
}
	
/*
 * Reset a device and mark down.
 * Flush output queue and drop queue limit.
 */
dmvdown(unit)
	int unit;
{
	struct dmv_softc *sc = &dmv_softc[unit];
	register struct ifxmt *ifxp;

	((struct dmvdevice *)(dmvinfo[unit]->ui_addr))->bsel1 = DMV_MCLR;
	sc->sc_flag &= ~(DMV_RUNNING | DMV_ONLINE);

	for (ifxp = sc->sc_ifw; ifxp < &sc->sc_ifw[NXMT]; ifxp++) {
		if (ifxp->ifw_xtofree) {
			(void) m_freem(ifxp->ifw_xtofree);
			ifxp->ifw_xtofree = 0;
		}
	}
	sc->sc_oused = 0;
	if_qflush(&sc->sc_if.if_snd);

	/*
	 * Limit packets enqueued until we're back on the air.
	 */
	sc->sc_if.if_snd.ifq_maxlen = 3;
}

/*
 * Watchdog timeout to see that transmitted packets don't
 * lose interrupts.  The device has to be online.
 */
dmvtimeout(unit)
	int unit;
{
	register struct dmv_softc *sc;
	struct dmvdevice *addr;

	sc = &dmv_softc[unit];
	if (sc->sc_flag & DMV_ONLINE) {
		addr = (struct dmvdevice *)(dmvinfo[unit]->ui_addr);
		log(LOG_ERR, "dmv%d: output timeout, bsel0=%b bsel2=%b\n",
		    unit, addr->bsel0 & 0xff, DMV0BITS,
		    addr->bsel2 & 0xff, DMV2BITS);
		dmvrestart(unit);
	}
}
#endif
