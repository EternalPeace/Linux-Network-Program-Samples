/* com.h */

#define	DATA	0
#define	IER	1
#define	IIR	2
#define	LCR	3
#define	MCR	4
#define	LSR	5
#define	MSR	6
#define	DLL	0	/* LCR_DLAB = 1 */
#define	DLM	1	/* LCR_DLAB = 1 */

#define IER_RX		0x01	/* interrupt on receive		*/
#define	IER_TX		0x02	/* interrupt on transmit done	*/
#define	IER_LS		0x04	/* line status interrupt	*/
#define	IER_MS		0x08	/* modem status interrupt	*/
#define	LCR_STB		0x04	/* # stop bits			*/
#define	LCR_PEN		0x08	/* parity enable		*/
#define	LCR_EPS		0x10	/* even parity select		*/
#define	LCR_DLAB	0x80
#define	LCR_W5		0x00	/* 5-bit word length		*/
#define	LCR_W6		0x01	/* 6-bit word length		*/
#define	LCR_W7		0x02	/* 7-bit word length		*/
#define	LCR_W8		0x03	/* 8-bit word length		*/
#define	LSR_THRE	0x20	/* xmit hold register empty	*/
#define	MCR_DTR		0x01	/* RS-232 DTR signal		*/
#define	MCR_RTS		0x02	/* RS-232 RTS signal		*/
#define	MCR_OUT2	0x08
#define	IIR_NOINT	0x01	/* set if no interrupt pending	*/
#define	IIR_IID		0x06	/* interrupt ID bits		*/
#define	IID_RSTAT	0x06	/* receiver line status intr	*/
#define	IID_RDAT	0x04	/* receiver data intr		*/
#define	IID_THRE	0x02	/* transmit completion intr	*/
#define	IID_MSTAT	0x00	/* modem status change		*/

#define	COMBUFSZ	10	/* serial device raw buffer size*/

struct comsoft {
	unsigned char	com_buf[COMBUFSZ];	/* raw output buffer	*/
	unsigned char	com_start;		/* start of buffer	*/
	unsigned char	com_count;		/* count in buffer	*/
	int		com_osema;		/* output semaphore	*/
	struct devsw	*com_pdev;		/* devsw pointer	*/
};

extern int	brtab[];	/* baud rate table		*/
extern int	lstab[];	/* divisor count table		*/

extern struct comsoft	comtab[];

int	computc(struct devsw *, unsigned char);
int	comflush(struct devsw *);
int	comsputc(struct devsw *, unsigned char);
void	comintr(void);
void	comwstrt(struct comsoft *);
void	comiin(struct comsoft *);
