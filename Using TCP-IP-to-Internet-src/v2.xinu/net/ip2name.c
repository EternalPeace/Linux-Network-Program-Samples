/* ip2name.c - ip2name */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <mem.h>

/*------------------------------------------------------------------------
 *  ip2name  -  return DNS name for a host given its IP address
 *------------------------------------------------------------------------
 */
char	*
ip2name(IPaddr ip, char *nam)
{
	char	tmpstr[20];		/* temporary string buffer	*/
	char	*buf;			/* buffer to hold domain query	*/
	int	dg, i;
	register char	*p;
	register struct	dn_mesg *dnptr;

	dnptr = (struct dn_mesg *) (buf = (char *) getmem(DN_MLEN));
	*nam = NULLCH;
	dnptr->dn_id = 0;
	dnptr->dn_opparm = hs2net(DN_RD);
	dnptr->dn_qcount = hs2net(1);
	dnptr->dn_acount = dnptr->dn_ncount = dnptr->dn_dcount = 0;
	p = dnptr->dn_qaaa;

	/* Fill in question with  ip[3].ip[2].ip[1].ip[0].in-addr.arpa  */

	for (i=3 ; i >= 0 ; i--) {
		sprintf(tmpstr, "%u", ((char *)&ip)[i] & LOWBYTE);
		dn_cat(p, tmpstr);
	}

	dn_cat(p, "in-addr");
	dn_cat(p, "arpa");
	*p++ = NULLCH;	/* terminate name */

	/* Add query type and query class fields to name */

	( (struct dn_qsuf *)p )->dn_type = hs2net(DN_QTPR);
	( (struct dn_qsuf *)p )->dn_clas = hs2net(DN_QCIN);
	p += sizeof(struct dn_qsuf);

	/* Send query */

	dg = open(UDP, NSERVER, ANYLPORT);
	control(dg, DG_SETMODE, DG_DMODE | DG_TMODE);
	if (write (dg, buf, p - buf) == SYSERR)
		panic("ip2name write(%d) failed\n", dg);
	i = read(dg, buf, DN_MLEN);
	if (i == SYSERR)
		panic("ip2name read(%d) failed\n", dg);
	if (i == TIMEOUT) {
		close(dg);
		return ip2dot(nam, ip);
	}
	close(dg);
	if (net2hs(dnptr->dn_opparm) & DN_RESP ||
	    net2hs(dnptr->dn_acount) <= 0) {
		freemem(buf, DN_MLEN);
		return ip2dot(nam, ip);
	}

	/* In answer, skip name and remainder of resource record header	*/

	while (*p != NULLCH)
		if (*p & DN_CMPRS) 	/* compressed section of name	*/
			*++p = NULLCH;
		else
			p += *p + 1;
	p += DN_RLEN + 1;
	/* Copy name to user */
	*nam = NULLCH;
	while (*p != NULLCH) {
		if (*p & DN_CMPRS)
			p = buf + (net2hs(*(int *)p) & DN_CPTR);
		else {
			strncat(nam, p+1, *p);
			strcat(nam, ".");
			p += *p + 1;
		}
	}
	if (strlen(nam))	/* remove trailing dot */
		nam[strlen(nam) - 1] = NULLCH;
	else
		ip2dot(nam, ip);
	freemem(buf, DN_MLEN);
	return nam;
}
