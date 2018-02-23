/* ip.h - IP_HLEN, IP_CLASS{A,B,C,D,E} */

/* Internet Protocol (IP)  Constants and Datagram Format		*/

#define	IP_ALEN	4		/* IP address length in bytes (octets)	*/
typedef	unsigned long IPaddr;	/*  internet address			*/

#if	BYTE_ORDER == BIG_ENDIAN
#define	IP_CLASSA(x) (((x) & 0x80000000) == 0)		/* IP Class A */
#define	IP_CLASSB(x) (((x) & 0xc0000000) == 0x80000000)	/* IP Class B */
#define	IP_CLASSC(x) (((x) & 0xe0000000) == 0xc0000000)	/* IP Class C */
#define	IP_CLASSD(x) (((x) & 0xf0000000) == 0xe0000000)	/* IP Class D */
#define	IP_CLASSE(x) (((x) & 0xf8000000) == 0xf0000000)	/* IP Class E */
#else	/* BYTE_ORDER */
#define	IP_CLASSA(x)	(((x) & 0x80) == 0x00)	/* IP Class A address	*/
#define	IP_CLASSB(x)	(((x) & 0xc0) == 0x80)	/* IP Class B address	*/
#define	IP_CLASSC(x)	(((x) & 0xe0) == 0xc0)	/* IP Class C address	*/
#define	IP_CLASSD(x)	(((x) & 0xf0) == 0xe0)	/* IP Class D address	*/
#define	IP_CLASSE(x)	(((x) & 0xf8) == 0xf0)	/* IP Class E address	*/
#endif	/* BYTE_ORDER */

/* Some Assigned Protocol Numbers */

#define	IPT_ICMP	1	/* protocol type for ICMP packets	*/
#define	IPT_IGMP	2	/* protocol type for IGMP packets	*/
#define	IPT_TCP		6	/* protocol type for TCP packets	*/
#define IPT_EGP		8	/* protocol type for EGP packets	*/
#define	IPT_UDP		17	/* protocol type for UDP packets	*/
#define	IPT_OSPF	89	/* protocol type for OSPF packets	*/

struct	ip	{
	u_char	ip_verlen;	/* IP version & header length (in longs)*/
	u_char	ip_tos;		/* type of service			*/
	u_short	ip_len;		/* total packet length (in octets)	*/
	short	ip_id;		/* datagram id				*/
	short 	ip_fragoff;	/* fragment offset (in 8-octet's)	*/
	u_char	ip_ttl;		/* time to live, in gateway hops	*/
	u_char	ip_proto;	/* IP protocol (see IPT_* above)	*/
	short	ip_cksum;	/* header checksum 			*/
	IPaddr	ip_src;		/* IP address of source			*/
	IPaddr	ip_dst;		/* IP address of destination		*/
	u_char	ip_data[1];	/* variable length data			*/
};

#define	IP_VERSION	4	/* current version value		*/
#define	IP_MINHLEN	5	/* minimum IP header length (in longs)	*/
#define	IP_TTL		255	/* Initial time-to-live value		*/

#define	IP_MF		0x2000	/* more fragments bit			*/
#define	IP_DF		0x4000	/* don't fragment bit			*/
#define	IP_FRAGOFF	0x1fff	/* fragment offset mask			*/
#define	IP_PREC		0xe0	/* precedence portion of TOS		*/

/* IP Precedence values */

#define	IPP_NETCTL	0xe0	/* network control			*/
#define	IPP_INCTL	0xc0	/* internet control			*/
#define	IPP_CRIT	0xa0	/* critical				*/
#define	IPP_FLASHO	0x80	/* flash over-ride			*/
#define	IPP_FLASH	0x60	/* flash 				*/
#define	IPP_IMMED	0x40	/* immediate				*/
#define	IPP_PRIO	0x20	/* priority				*/
#define	IPP_NORMAL	0x00	/* normal				*/

/* macro to compute a datagram's header length (in bytes)		*/
#define	IP_HLEN(pip)	((pip->ip_verlen & 0xf)<<2)
#define	IPMHLEN		20	/* minimum IP header length (in bytes)	*/

/* IP options */
#define	IPO_COPY	0x80	/* copy on fragment mask		*/
#define IPO_CLASS	0x60	/* option class				*/
#define	IPO_NUM		0x17	/* option number			*/

#define	IPO_EOOP	0x00	/* end of options			*/
#define	IPO_NOP		0x01	/* no operation				*/
#define	IPO_SEC		0x82	/* DoD security/compartmentalization	*/
#define	IPO_LSRCRT	0x83	/* loose source routing			*/
#define	IPO_SSRCRT	0x89	/* strict source routing		*/
#define	IPO_RECRT	0x07	/* record route				*/
#define	IPO_STRID	0x88	/* stream ID				*/
#define	IPO_TIME	0x44	/* internet timestamp			*/

#define	IP_MAXLEN	BPMAXB-EP_HLEN	/* Maximum IP datagram length	*/

/* IP process info */

extern	PROCESS		ipproc();
#define	IPSTK		512	/* stack size for IP process		*/
#define	IPPRI		100	/* IP runs at high priority		*/
#define	IPNAM		"ip"	/* name of IP process			*/
#define	IPARGC		0	/* count of args to IP 			*/

extern IPaddr	ip_maskall;	/* = 255.255.255.255			*/
extern IPaddr	ip_anyaddr;	/* = 0.0.0.0				*/
extern IPaddr	ip_loopback;	/* = 127.0.0.1				*/

extern	int	ippid, gateway;

struct ip *iph2net(struct ip *), *ipnet2h(struct ip *);
unsigned short cksum(WORD *, unsigned);
int ipsend(IPaddr, struct ep *, unsigned, u_char, u_char, u_char);
int ipputp(unsigned, IPaddr, struct ep *);
Bool isbrc(IPaddr);
