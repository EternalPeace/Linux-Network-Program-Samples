/* igmp.h - IG_VER, IG_TYP */

#define	HG_TSIZE	15		/* host group table size	*/

#define	IG_VERSION	 1		/* RFC 1112 version number	*/

#define	IG_HLEN		 8		/* IGMP header length		*/
#define	IGT_HQUERY	 1		/* host membership query	*/
#define	IGT_HREPORT	 2		/* host membership report	*/

struct igmp {
	unsigned char	ig_vertyp;	/* version and type field	*/
	char		ig_unused;	/* not used by IGMP		*/
	unsigned short	ig_cksum;	/* compl. of 1's compl. sum	*/
	IPaddr		ig_gaddr;	/* host group IP address	*/
};

#define	IG_VER(pig)	(((pig)->ig_vertyp>>4) & 0xf)
#define	IG_TYP(pig)	((pig)->ig_vertyp & 0xf)

#define	IG_NSEND	2		/* # IGMP join messages to send	*/
#define	IG_DELAY	5		/* delay for resends (1/10 secs)*/

/* Host Group Membership States */

#define	HGS_FREE	0	/* unallocated host group table entry	*/
#define	HGS_DELAYING	1	/* delay timer running for this group	*/
#define	HGS_IDLE	2	/* in the group but no report pending	*/
#define	HGS_STATIC	3	/* for 224.0.0.1; no state changes	*/

struct hg {
	unsigned char	 hg_state;	/* HGS_* above			*/
	unsigned char	 hg_ifnum;	/* interface index for group	*/
	IPaddr		 hg_ipa;	/* IP multicast address		*/
	unsigned long	 hg_refs;	/* reference count		*/
	Bool		 hg_ttl;	/* max IP ttl for this group	*/
};

/* Host Group Update Process Info. */

extern	PROCESS		igmp_update();
#define	IGUSTK		512		/* stack size for update proc.	*/
#define	IGUPRI		 50		/* update process priority	*/
#define	IGUNAM		"igmp_update"	/* name of update  process	*/
#define	IGUARGC		0		/* count of args to hgupdate	*/

struct hginfo {
	Bool	hi_valid;	/* TRUE if hginit() has been called	*/
	int	hi_mutex;	/* table mutual exclusion		*/
	int	hi_uport;	/* listen port for delay timer expires	*/
};

extern struct hginfo	HostGroup;

extern IPaddr ig_allhosts;	/* "all hosts" group address (224.0.0.1)*/
extern IPaddr ig_allDmask;	/* net mask to match all class D addrs.	*/
extern struct hg hgtable[];

int hgjoin(unsigned, IPaddr, Bool);
int hgadd(unsigned, IPaddr, Bool);
int hgleave(unsigned, IPaddr);
int hgarpdel(unsigned, IPaddr);
struct hg *hglookup(unsigned, IPaddr);
int igmp(int, unsigned, IPaddr);
int igmp_settimers(unsigned);
int hgrand(void);
