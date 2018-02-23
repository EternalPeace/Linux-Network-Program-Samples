/* a1rwval.c - a1readval, a1writeval */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <mem.h>

#ifdef	SNMP

#include <snmp.h>
#include <asn1.h>

/*------------------------------------------------------------------------
 * a1readval - convert object in ASN.1 encoded form into internal form
 *------------------------------------------------------------------------
 */
int
a1readval(struct snval *val, int type, int vallen, unsigned char *pack)
{
	val->sv_type = type;
	
	switch (type) {
	case ASN1_INT:
	case ASN1_COUNTER:
	case ASN1_GAUGE:
	case ASN1_TIMETICKS:
		val->sv_val.sv_int = a1readint(pack, vallen);
		return OK;
	case ASN1_OCTSTR:
		val->sv_val.sv_str.sv_len = vallen;
		val->sv_val.sv_str.sv_str = (char *) pack;
		return OK;
	case ASN1_NULL:
		return OK;
	case ASN1_OBJID:
		return a1readoid(pack, vallen, &(val->sv_val.sv_oid));
	case ASN1_IPADDR:
		memcpy(&val->sv_val.sv_ipaddr, pack, vallen);
		return OK;
	default:
		return SYSERR;
	}
}

/*------------------------------------------------------------------------
 * a1writeval - convert the value of a variable into ASN.1 equivalent.
 *------------------------------------------------------------------------
 */
int
a1writeval(struct snbentry *bl, u_char *bp)
{
	u_char	*origbp;

	origbp = bp;
	*bp++ = SVTYPE(bl);
	
	switch(SVTYPE(bl)) {
	case ASN1_INT:
	case ASN1_COUNTER:
	case ASN1_GAUGE:
	case ASN1_TIMETICKS:
		bp += a1writeint(SVINT(bl), bp, SVTYPE(bl));
		break;
	case ASN1_NULL:
		*bp++ = (u_char) 0;
		break;
	case ASN1_OCTSTR:
		bp += a1writelen(bp, SVSTRLEN(bl));
		memcpy(bp, SVSTR(bl), SVSTRLEN(bl));
		bp += SVSTRLEN(bl);
		freemem(SVSTR(bl), SVSTRLEN(bl));
		break;
	case ASN1_IPADDR:
		*bp++ = IP_ALEN;
		memcpy(bp, &SVIPADDR(bl), IP_ALEN);
		bp += IP_ALEN;
		break;
	case ASN1_OBJID:
		bp += a1writeoid(bp, &bl->sb_val.sv_val.sv_oid);
		break;
	default:
		break;
	}
	
	return bp - origbp;
}
#endif	/* SNMP */
