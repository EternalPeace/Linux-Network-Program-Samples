/* ue.h - UEPAGE */

#define	UE_NRX		2	/* number of 1536 byte receive buffers	*/
#define	UE_NTX		2	/* number of 1536 byte send buffers	*/

#define UE_BUFSIZE	256	/* interface buffer sizes		*/


#define	CR		0x00
#define	EER		0x01
#define	HWR		0x04
#define	BPR		0x05
#define	ICR		0x06
#define	REV		0x07


/* HWR_SWH = 0 */
#define	EADDR		0x08
#define	BOARDID		0x0e
#define	CKSUM		0x0f

/* HWR_SWH = 1 */
#define	IAR		0x0a
#define	RAR		0x0b
#define	BIO		0x0c
#define	GCR		0x0d

#define	CMD		0x10

/* register bit definitions */
#define HWR_SWH		0x80
#define	ICR_EIL		0x01
#define	CR_MENB		0x40
#define	CMD_TXP		0x04
#define	CMD_STA		0x02		/* start the interface	*/
#define	CMD_STP		0x01		/* stop the interface	*/
#define	GCR_LIT		0x01
#define	RCON_BROAD	0x04
#define	RCON_GROUP	0x08
#define	RCON_PROM	0x10
#define	RCON_MON	0x20
#define	RCON_RCA	0x40
#define	DCON_BUS16	0x01
#define	INTMASK_PTX	0x02	/* interrupt on packet transmitted	*/
#define	INTMASK_PRX	0x01	/* interrupt on packet received		*/
#define	INTSTAT_PRX	0x01
#define	INTSTAT_PTX	0x02
#define	INTSTAT_RXE	0x04
#define	INTSTAT_TXE	0x08
#define	EER_RC		0x40	/* recall LAN regs from EEROM		*/


#define UEPAGE(csr, pn) {			\
	extern int	currpage;		\
	unsigned char cmd = inb((csr) + CMD);	\
	currpage = pn;				\
	cmd = (cmd & 0x3f) | ((pn) << 6);	\
	outb((csr) + CMD, cmd);			\
	}

/* page 0 registers */

#define	W_RSTART	0x011
#define	W_RSTOP		0x012
#define	BOUND		0x013
#define	W_RCON		0x01c
#define	W_DCON		0x01e
#define	W_INTMASK	0x01f
#define	W_TSTARTH	0x014
#define	TSTAT		0x014
#define	W_TCNTL		0x015
#define	W_TCNTH		0x016
#define	INTSTAT		0x017
#define	RSTAT		0x01c

/* page 1 registers */

#define	STA0		0x111
#define	STA1		0x112
#define	STA2		0x113
#define	STA3		0x114
#define	STA4		0x115
#define	STA5		0x116
#define	CURR		0x117

/* page 2 registers */

#define	R_INTMASK	0x21f
#define	R_RCON		0x21c
#define	R_INTMASK	0x21f
#define	R_RSTART	0x211
#define	R_RSTOP		0x212
#define	R_TCNTL		0x213
#define	R_TSTARTH	0x214
#define	NEXT		0x215
#define	R_TCNTH		0x216
#define	RADDL		0x218
#define	RADDH		0x219

/* structure for first buffer of a received packet */
struct urb {
	unsigned int	urb_rstat:8;
	unsigned int	urb_next:8;
	unsigned int	urb_len:16;
	unsigned char	urb_data[1];
};
