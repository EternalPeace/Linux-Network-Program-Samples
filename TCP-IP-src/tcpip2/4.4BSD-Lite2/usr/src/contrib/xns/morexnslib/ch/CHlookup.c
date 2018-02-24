/* $Header: CHlookup.c,v 2.4 87/03/14 06:41:56 jqj Exp $ */

/* contains:
 * CH_LookupAddr
 * CH_GetFirstCH
 * CH_GetOtherCH
 */

/* $Log:	CHlookup.c,v $
 * Revision 2.4  87/03/14  06:41:56  jqj
 * major changes to CH location algorithm.
 * changed LookupAddressDN to use new simpler semantics (can call GetOtherCH
 * many times)
 * 
 * Revision 2.3  87/01/05  11:58:47  ed
 * Webster changes
 * 
 * Revision 2.3  87/01/05  11:58:47  ed
 * Eliminate hard file name for BFS and use BFS definition instead
 * 
 * Revision 2.2  86/06/30  12:23:48  jqj
 * 1/ convert BDT read to dynamically allocate a buffer, and grow it if
 * necessary using realloc().  This should fix problems with support at
 * Xerox, where they have so many CHes that we were running out of space.
 * 2/ convert CH_GetFirstCH() to use /usr/new/xnsbfs if CH.default fails
 * to find a CH.  xnsbfs does an expanding ring, or at least a local,
 * broadcast for servers.
 * 
 * Revision 2.1  86/06/05  09:12:48  jqj
 * Split out CHdefault.c from this file.  The path to the addresses file
 * is now found in that file.
 * 
 * Revision 2.0  85/11/21  07:22:32  jqj
 * 4.3BSD standard release
 * 
 * Revision 1.3  85/11/21  07:14:19  jqj
 * first try at 4.3BSD standard release
 * 
 * Revision 1.2  85/10/21  12:41:55  jqj
 * Gould version:  work around a Gould compiler bug.  Default to /usr/new
 * for consistency.
 * 
 * Revision 1.1  85/10/18  09:14:53  jqj
 * Initial revision
 * 
 * Revision 1.1  85/03/26  06:27:00  jqj
 * Initial revision
 * 
 */
#include <stdio.h>
#include <sys/types.h>
#include <netns/ns.h>
#include <xnscourier/Clearinghouse2.h>
#include <xnscourier/CHEntries.h>
#include <xnscourier/except.h>
#include <sys/file.h>

#ifndef BFS
#define BFS "/usr/new/xnsbfs"
#endif

/* data structures for very simple (null) authentication */
static Cardinal nullpasswd = 0;
static Clearinghouse2_Authenticator nullagent = {{0,{0,0}},{1,&nullpasswd}};

/*
 * This is an entry in the in-core cache of known clearinghouses.
 * chl_name	Each entry has a name, which may be null for entries 
 *   obtained by expanding ring broadcast or initial table lookup.  A 
 *   particular address may appear in the list multiple times with 
 *   different or null names, but mostly the entries are unique.
 * chl_addr	The address is one of the addresses given for this 
 *   host.  For multihomed CHs, no attempt is made to make sure that 
 *   this address is optimal.
 * chl_status	The status of the entry, one of:
 *	chunknown	address invalid.
 *	chdown		did not answer when probed.
 *	chup		address valid, and responds to RetrieveAddresses.
 *	chused		has been returned to caller of GetCH routines
 *			as a valid CH.  Hence GetOtherCH will not return it 
 *			again.  Note that GetFirstCH resets chused->chup.
 * chl_next	Link to next clearinghouse in database.
 * chl_domains	[NOT YET USED] List of domains served, for efficiency
 */
struct chlist {
	Clearinghouse2_ObjectName *chl_name;
	struct ns_addr chl_addr;
	enum {chunknown, chup, chdown, chused} chl_status;
	struct Clearinghouse2_TwoPartName *chl_domains;
	struct chlist *chl_next;
};
struct chlist *namelist = NULL;

/*
 * add a clearinghouse name to the ch list if it isn't already there.
 * Initial state is chunknown, since we don't know its address and can't
 * probe it.
 */
static struct chlist *
addtochlist(ch_name)
	Clearinghouse2_ObjectName *ch_name;
{
	struct chlist *chptr;
	extern char *malloc();

	if (ch_name != NULL) /* don't eliminate duplicate anonymous entries */
	    for (chptr = namelist; chptr != NULL; chptr = chptr->chl_next) {
		if ( chptr->chl_name &&
		    (strcmp(chptr->chl_name->object,ch_name->object)==0) &&
		    (strcmp(chptr->chl_name->domain,ch_name->domain)==0) &&
		    (strcmp(chptr->chl_name->organization,
			    ch_name->organization)==0)) {
			clear_Clearinghouse2_ObjectName(ch_name); /* dealloc */
			return NULL;	/* already in list */
		}
	    }
	chptr = (struct chlist *) malloc(sizeof(struct chlist));
	chptr->chl_name = ch_name;
	chptr->chl_status = chunknown;
	chptr->chl_next = namelist;
	namelist = chptr;
	return chptr;
}

static
GetData(conn)
	CourierConnection *conn;
{
	int count, i;
	int bufused, bufsize;
	Unspecified *buffer, *bp;
	Clearinghouse2_StreamOfObjectName obnames;
	
	bufsize = MAXWORDS*4;    /* end of available space */
	buffer = Allocate(bufsize);
	bufused = 0;		/* number of words used */
	while (count = BDTread(conn, (char*)(buffer+bufused), 
				MAXWORDS*sizeof(Unspecified))
		) {
		bufused += count/sizeof(Unspecified);
		/* leave room for one last packet */
		if (bufused+MAXWORDS > bufsize) {
			bufsize += bufsize;	/* double our space */
			buffer = (Unspecified *) realloc((char *) buffer,
						bufsize*sizeof(Unspecified));
		}
	}
	bp = buffer;
	while (bp-buffer < bufused) {
		bp += internalize_Clearinghouse2_StreamOfObjectName(&obnames,bp);
		if (0 == (int) obnames.designator) {
		   for (i = 0; i < obnames.nextSegment_case.segment.length; i++)
			addtochlist(
				&obnames.nextSegment_case.segment.sequence[i]);
		} else {
		   for (i = 0; i < obnames.lastSegment_case.length; i++)
			addtochlist(
				&obnames.lastSegment_case.sequence[i]);
		   Deallocate(buffer);
		   return;
		}
	}
	Deallocate(buffer);
	return;
}

static struct ns_addr*
itemtonsaddr(itemptr)
	Clearinghouse2_Item *itemptr;	/* i.e. a sequence of Unspecified */
{
	static union {
		struct ns_addr addr;
		u_short shrt[6];
	} result;
	register int i;
	register Unspecified *seq;

	if (itemptr->length < 7)
		return(0);

	seq = itemptr->sequence +1;
	/* itemptr->sequence[0] == number of addresses */
	for (i = 0; i < 6; i++, seq++)
		result.shrt[i] = ntohs(*seq);
	return(&result.addr);
}

/*
 * Open an SPP connection to the address given as chaddr, then
 * check whether the CHS pointed to by conn is up.  If not, close
 * conn and return 0.  If so, return the connection.
 */
static CourierConnection*
ClearinghouseOpen(chaddr)
	struct ns_addr chaddr;
{
	CourierConnection *conn;
	Clearinghouse2_RetrieveAddressesResults raresult;

	conn.x_port = 0;
	if ((conn = CourierOpen(&chaddr)) == NULL)
		return(conn);
	DURING
	    raresult = Clearinghouse2_RetrieveAddresses(conn,NULL);
	HANDLER {
	    CourierClose(conn);
	    conn = NULL;
	} END_HANDLER;
	clear_Clearinghouse2_RetrieveAddressesResults(&raresult);
	return(conn);
}

/*
 * path to look for the addresses file on
 * (I wish I'd picked a shorter name, so we could rendezvous in /etc.
 *  But long file names in /etc are very unpopular!).
 * This path is defined n CHdefault.c, and used by CH_NameDefault()
 */
extern char *chaddrpath[];

CourierConnection*
CH_GetFirstCH()
{
	struct ns_addr chaddr;
	extern struct ns_addr *getXNSaddr();
	extern struct ns_addr ns_addr();
	char buf[BUFSIZ];
	CourierConnection *result;
	FILE *chfile;
	struct chlist *chptr;
	int i;

	result = (CourierConnection *) NULL;
	/* first, look in the process cache */
	for (chptr = namelist; chptr != NULL; chptr = chptr->chl_next) {
		switch (chptr->chl_status) {
		case chunknown:
		case chdown:
			break;
		case chused:
			chptr->chl_status = chup;
		case chup:
			if (result == NULL)
				result = ClearinghouseOpen(chptr->chl_addr);
		}
	}
	if (result) return(result);

	/* Now, use hard-coded CH */
	/* eventually we'll do an expanding-ring or something */
	for (i = 0; chaddrpath[i] != NULL; i++) {
		if ((chfile = fopen(chaddrpath[i],"r")) == NULL)
			continue;
		flock(fileno(chfile),LOCK_SH);
		while (fgets(buf, BUFSIZ, chfile) != NULL)
			if ((buf[0] != '#') &&
			    (chaddr = ns_addr(buf),
			     result = ClearinghouseOpen((chaddr)))) {
				if ((chptr = addtochlist(NULL))) {
					chptr->chl_addr = chaddr;
					chptr->chl_status = chused;
				}
				flock(fileno(chfile),LOCK_UN);
				fclose(chfile);
				return(result);
			}
		flock(fileno(chfile),LOCK_UN);
		fclose(chfile);
		break;	/* don't look for other files */
	}
	/* try expanding-ring here -- this could be more efficient! */
	if ((chfile = popen(BFS,"r")) != NULL) {
		while (fgets(buf, BUFSIZ, chfile) != NULL)
			if ((buf[0] != '#') &&
			    (chaddr=ns_addr(buf),
			     result = ClearinghouseOpen(chaddr))) {
				if ((chptr = addtochlist(NULL))) {
					chptr->chl_addr = chaddr;
					chptr->chl_status = chused;
				}
				pclose(chfile);
				return(result);
			}
		pclose(chfile);
	}
	return(result);
}

CourierConnection *
CH_GetOtherCH(conn,hint)
	CourierConnection *conn;
	Clearinghouse2_ObjectName hint;
{
	struct ns_addr *ch2addr;
	CourierConnection *ch2conn, *chresult;
	Clearinghouse2_RetrieveItemResults riresult;
	Clearinghouse2_RetrieveMembersResults rmresult;
	struct chlist *chptr;

	Clearinghouse2_Property clearinghouseNames = 3;
	Clearinghouse2_Property clearinghouseAddresses = 4;

	if (hint.object != NULL && *hint.object != '\0') {
	    DURING
		    /* get list of possible other clearinghouses */
		    rmresult = Clearinghouse2_RetrieveMembers(conn, GetData, hint, 
			    clearinghouseNames, BulkData1_immediateSink,
			    nullagent);
	    HANDLER {
		    /* some race condition */
		    return(NULL);
	    } END_HANDLER;
	    /* throw away the distinguished name, which we don't need */
	    clear_Clearinghouse2_RetrieveMembersResults(&rmresult);
	}
	/* for each member of potentials list, probe it */
	ch2conn = chresult = NULL;
	for (chptr = namelist; chptr != NULL; chptr = chptr->chl_next) {
	    switch (chptr->chl_status) {
	    case chunknown:	/* a new entry, presumably */
		/* get its address */
		DURING
			riresult = Clearinghouse2_RetrieveItem(conn, NULL, 
				*(chptr->chl_name),
				clearinghouseAddresses, nullagent);
		HANDLER
			break;	/* try next in namelist */
		END_HANDLER;
		chptr->chl_addr = *itemtonsaddr(&riresult.value);
		clear_Clearinghouse2_RetrieveItemResults(&riresult);
		chptr->chl_status = chdown;
		/* fall through to: */
	    case chdown:	/* check down CH to see if it has revived */
		/* make sure the second CH is really there */
		if ((ch2conn = ClearinghouseOpen(chptr->chl_addr))) {
			chptr->chl_status = chup; /* we got it! */
			if (chresult == NULL) {
				chresult = ch2conn;
				chptr->chl_status = chused;
			}
			else CourierClose(ch2conn);
			ch2conn = NULL;
		}
		break;
	    case chup:
	    case chused:
		break;
	    } /* end of switch */
	} /* inspect next in list */
	/* 
	 * if no new one, return an old one
	 */
	for (chptr= namelist; chptr && (chresult==NULL); chptr= chptr->chl_next) {
		if (chptr->chl_status == chup) {
		    chptr->chl_status =
		    	(chresult=ClearinghouseOpen(chptr->chl_addr))
					? chused : chdown;
		}
	}
	return(chresult);
}

/*
 * Given a Clearinghouse three part name (possibly containing wild cards)
 * and the property number on which a NetworkAddress is expected to occur,
 * returns the ns_addr structure associated with that name.
 * Note that the ns_addr structure is statically allocated!
 * Resets pattern to be the distinguished name of the object found.
 */
struct ns_addr *
CH_LookupAddr(pattern,property)
	Clearinghouse2_ObjectNamePattern pattern;
	Clearinghouse2_Property property;
{
	struct ns_addr* CH_LookupAddrDN();
	return(CH_LookupAddrDN(pattern,property,0,0));
}

/*
 * Lookup a clearinghouse address, returning the address and the
 * distinguished name of the object found.
 */
struct ns_addr *
CH_LookupAddrDN(pattern,property,distnamep,distnamelen)
	Clearinghouse2_ObjectNamePattern pattern;
	Clearinghouse2_Property property;
	char *distnamep;
	int distnamelen;
{
	struct ns_addr *chaddr, *resultaddr;
	CourierConnection *conn, *ch2conn;
	Clearinghouse2_ObjectName hint;		/* from WrongServer errors */
	Clearinghouse2_RetrieveItemResults riresult;
	int i;


	if ((long) property <= 0) 	/* default to addressList i.e. 4 */
		property = CHEntries0_addressList;
	if (pattern.object == NULL ||
	    pattern.domain == NULL ||
	    pattern.organization == NULL)
		return(NULL);			/* can't handle defaults */
	
	if ((conn = CH_GetFirstCH()) == NULL) {
		fprintf(stderr,"Can't open connection to local Clearinghouse\n");
		exit(1);
	}
	/* ask our primary clearinghouse for the address of this thing */
	for (i = 5; i > 0; i--) {
	    DURING {
		riresult = Clearinghouse2_RetrieveItem(conn, NULL,
				pattern, property, nullagent);
		i = -1;
	    } HANDLER {
		if (Exception.Code == REJECT_ERROR) {
			fprintf(stderr,"Problem with CH.addrs.  CH rejected request\n");
			hint.object = hint.domain = hint.organization = NULL;
		}
		else if (Exception.Code != Clearinghouse2_WrongServer) {
			/* some random error */
			hint.object = hint.domain = hint.organization = NULL;
		}
		else hint = CourierErrArgs(Clearinghouse2_WrongServerArgs, hint);
		ch2conn = CH_GetOtherCH(conn, hint);
		CourierClose(conn);
		if (ch2conn == NULL) return(0);
		conn = ch2conn;
	    } END_HANDLER;
	}
	if (i >= 0) {
	    return(0);
	}
	resultaddr = itemtonsaddr(&riresult.value);
	if (distnamep != NULL &&
	    distnamelen >= (2+strlen(riresult.distinguishedObject.object)+
			    strlen(riresult.distinguishedObject.domain)+
			    strlen(riresult.distinguishedObject.organization)))
		strcpy(distnamep,CH_NameToString(riresult.distinguishedObject));
	clear_Clearinghouse2_RetrieveItemResults(&riresult);
	CourierClose(conn);
	return(resultaddr);
}
