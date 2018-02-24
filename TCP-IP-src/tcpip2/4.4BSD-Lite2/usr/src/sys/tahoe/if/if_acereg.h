/*-
 * Copyright (c) 1991 The Regents of the University of California.
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
 *	@(#)if_acereg.h	7.2 (Berkeley) 5/8/91
 */

/*
 * VERSAbus ACC ethernet controller definitions
 */

/*
 * Register definitions
 */
struct acedevice {
	short	station[6];		/* station address */
	short	bcastena[2];		/* broadcast enable */
	short	hash[8];		/* multicast hash codes */
	short	csr;			/* control and status register */
	short	tseg;			/* current transmit segment # */
	short	rseg;			/* current receive  segment # */
	short	segb;			/* segment boundary register */
	short	lrf;			/* lost receive frame counter */
	short	ivct;			/* interrupt vector register */
	short	resv;			/* reserved for future use */
	short	fcoll;			/* force collision register */
};

/*
 * Transmit segment in dual ported ram.
 */
struct tx_segment {
	short	tx_csr;		/* packet status */
	char	tx_data[2014];
	short	tx_backoff[16];	/* random backoff counters */
};

/*
 * Receive segment in dual ported ram.
 */
struct rx_segment {
	short	rx_csr;		/* packet status */
	char	rx_data[2046];
};

/*
 * ACC statistics block.
 */ 
struct ace_stats {
	int	rx_datagrams;		/* valid packets received */
	int	rx_crc_errors;		/* CRC errors */
	int	rx_overruns;		/* packets too large */
	int	rx_underruns;		/* packets too small */
	int	rx_align_errors;	/* packets w/ odd byte count */
	int	rx_reserved;
	int	rx_busy;		/* recv segment filled */
	int	rx_mbuf;		/* out of mbufs */
	int	rx_oddoff;		/* odd offset in mbuf */
	int	rx_rintcnt;		/* recvr interrupt */

	int	tx_datagrams;		/* packets xmit'd */
	int	tx_retries;		/* collision retries */
	int	tx_discarded;		/* packets w/ max retries */
	int	tx_busy;		/* xmit segment filled in acestart */
	int	tx_cbusy;		/* xmit segment filled in acecint */
	int	tx_mbuf;		/* total mbufs */
	int	tx_oddoff;		/* odd offset in mbuf */
	int	tx_outcnt;		/* calls to aceoutput */
	int	tx_startcnt;		/* calls to acestart */
	int	tx_cintcnt;		/* xmit's completed */
};

/*
 * Control status definitions.
 */
#define CSR_OBCENA	0x0200	/* enable xmit of odd byte count */
#define CSR_ACTIVE	0x0080	/* board active */
#define CSR_RESET	0x0040	/* reset board */
#define CSR_PROMISC	0x0020	/* enable promiscous mode */
#define CSR_CRCDIS	0x0010	/* disable CRC generation */
#define CSR_LOOP3	0x0008	/* enable loopback mode 3 */
#define CSR_LOOP2	0x0004	/* enable loopback mode 2 */
#define CSR_IENA	0x0002	/* interrupt enable */
#define CSR_GO		0x0001	/* enable micro-engine */

#define	ACE_CSRBITS \
    "\20\12OBCENA\10ACTIVE\7RESET\6PROMISC\5CRCDIS\4LOOP3\3LOOP2\2IENA\1GO"
/*
 * Transmit packet status definitions.
 */
#define TCS_TBFULL	(short)0x8000	/* buffer filled, send it */
#define TCS_TBC		(short)0x07FF	/* byte count */
#define TCS_TBMT	(short)0x8000	/* buffer empty */
#define TCS_RTFAIL	(short)0x4000	/* retries failed */
#define TCS_RTC		(short)0x000F	/* collision retry mask */

/*
 * Receive packet status definitions.
 */
#define RCS_RBMT	0x8000		/* buffer ready for recv */
#define RCS_RBFULL	0x8000		/* buffer full, take data */
#define RCS_ROVRN	0x4000		/* overrun error */
#define RCS_RCRC	0x2000		/* CRC error */
#define RCS_RODD	0x1000		/* odd byte count error */
#define RCS_RBC		0x07FF		/* byte count mask */

#define	ACE_RCSBITS	"\20\20RBFULL\17ROVRN\16RCSR\15RODD"

#define CRC_SIZE	4         /* number of bytes in a rx seg's CRC */
#define RCW_SIZE	2         /* number of bytes in a rx seg's csr */
#define SEG_MAX		15        /* largest valid segment number */
#define ET_MINLEN       64        /* min frame size */
#define ET_MAXLEN       1514      /* max frame size w/o CRC & RCW */
