/*
 * Copyright (c) 1982, 1986 Regents of the University of California.
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
 *	@(#)if_pclreg.h	7.3 (Berkeley) 6/28/90
 */

/*
 * DEC CSS PCL-11B Parallel Communications Interface
 */

struct pcldevice  {
	u_short	pcl_tcr;	/* Transmitter Command Register */
	u_short	pcl_tsr;	/* Transmitter Status Register */
	u_short	pcl_tsdb;	/* Transmitter Source Data Buffer */
	short	pcl_tsbc;	/* Transmitter Source Byte Count */
	u_short	pcl_tsba;	/* Transmitter Source Bus Address */
	u_short	pcl_tmmr;	/* Transmitter Master/Maint Regs */
	u_short	pcl_tscrc;	/* Transmitter Source CRC */
	u_short	pcl_spare;
	u_short	pcl_rcr;	/* Receiver Command Register */
	u_short	pcl_rsr;	/* Receiver Status Register */
	u_short	pcl_rddb;	/* Receiver Destination Data Buffer */
	short	pcl_rdbc;	/* Receiver Destination Byte Count */
	u_short	pcl_rdba;	/* Receiver Destination Bus Address */
	u_short	pcl_rdcrc;	/* Receiver Destination CRC */
};

/* Transmitter Command and Status Bits */
#define PCL_STTXM	(1<<0)		/* Start transmission */
#define PCL_TXINIT	(1<<1)		/* Transmitter Initialize */
#define PCL_IE		(1<<6)		/* Interrupt Enable */
#define PCL_SNDWD	(1<<13)		/* Send word */
#define PCL_TXNPR	(1<<14)		/* Transmitter NPR */
#define PCL_RIB		(1<<15)		/* Retry if busy */

#define PCL_RESPA	(3<<0)		/* Response A bits (tsr & rsr) */
#define PCL_RESPB	(3<<2)		/* Response B bits (tsr & rsr) */
#define PCL_MSTDWN	(1<<11)		/* Master down */
#define PCL_ERR		(1<<15)		/* Error summary */

#define PCL_MASTER	(1<<8)		/* Set MASTER status */
#define PCL_AUTOADDR	(1<<12)		/* Auto time slicing */

/* Receiver Command and Status Bits */
#define PCL_RCVDAT	(1<<0)		/* Receive data */
#define PCL_RCINIT	(1<<1)		/* Receiver Initialize */
#define PCL_RCVWD	(1<<13)		/* Receive word */
#define PCL_RCNPR	(1<<14)		/* Receive NRP */
#define PCL_REJ		(1<<15)		/* Reject transmission */

#define PCL_BCOFL	(1<<9)		/* Byte Counter Overflow */

#define PCL_TERRBITS	"\20\20ERR\17NXL\16MEM_OFL\15TXM_ERR\14MST_DWN\13TIM_OUT\12OVERRUN\11DTI_RDY\10SUC_TXF\07BUSY\06SOREJ\05TBS_BUSY"
#define PCL_TCSRBITS	"\20\20RIB\17TX_NPR\16SND_WD\10RD_SILO\07IE\04DTO_RDY\03INH_ADI\02TX_INIT\01START_TXM"

#define PCL_RERRBITS	"\20\20ERR\17NXL\16MEM_OFL\15TXM_ERR\14PARITY\13TIM_OUT\12BC_OFL\11DTO_RDY\10SUC_TXF\07BUSY\06REJ_COMP\05CHN_OPN"
#define PCL_RCSRBITS	"\20\20REJ\17RC_NPR\16RCV_WD\10LD_SILO\07IE\04DTI_RDY\03INH_ADI\02RC_INIT\01RCV_DAT"
