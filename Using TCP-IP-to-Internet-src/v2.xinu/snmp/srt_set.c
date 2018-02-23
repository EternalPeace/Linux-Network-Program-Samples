/* srt_set.c - srt_set */

#include <conf.h>
#include <kernel.h>
#include <network.h>

#ifdef	SNMP

#include <snmp.h>
#include <mib.h>
#include <asn1.h>

/*------------------------------------------------------------------------
 * srt_set - perform a set operation on a variable in the Routing Table
 *------------------------------------------------------------------------
 */
int
srt_set(struct snbentry *bindl, struct mib_info *mip, int numifaces)
{
	struct 	route	*rtp;
	int		rtl, field;

	if (srt_match(bindl, &rtp, &rtl, &field) == SYSERR)
		return SERR_NO_SUCH;
	switch (field) {
	case 1:		/* ipRouteDest */
		if (SVTYPE(bindl) != ASN1_IPADDR)
		    return SERR_BAD_VALUE;
		rtp->rt_net=SVIPADDR(bindl);
		return SNMP_OK;
	case 2:		/* ipRouteIfIndex */
		if (SVTYPE(bindl) != ASN1_INT ||
		    SVINT(bindl) <= 0 || SVINT(bindl) > numifaces)
			return SERR_BAD_VALUE;
		rtp->rt_ifnum = SVINT(bindl);
		break;
	case 3:		/* ipRouteMetric1 */
		if (SVTYPE(bindl) != ASN1_INT || SVINT(bindl) < 0)
			return SERR_BAD_VALUE;
		rtp->rt_metric = SVINT(bindl);
		break;
	case 4:		/* ipRouteMetric2 */
	case 5:		/* ipRouteMetric3 */
	case 6:		/* ipRouteMetric4 */
		break;
	case 7:		/* ipRouteNextHop */
		if (SVTYPE(bindl) != ASN1_IPADDR)
			return SERR_BAD_VALUE;
		rtp->rt_gw=SVIPADDR(bindl);
		break;
	case 8:		/* ipRouteType */
		/* route type is invalid (2) ==> should remove route
		   from routing table */
		if (SVTYPE(bindl) != ASN1_INT ||
		    SVINT(bindl) < 1 || SVINT(bindl) > 4)
			return SERR_BAD_VALUE;
		if (SVINT(bindl) == 2)	/* route invalid */
			(void) rtdel(rtp->rt_net, rtp->rt_mask);
		break;
	case 9:		/* ipRouteProto */
		break;
	case 10:		/* ipRouteAge */
		if (SVTYPE(bindl) != ASN1_INT ||
		    SVINT(bindl) < 0)
			return SERR_BAD_VALUE;
		rtp->rt_ttl = SVINT(bindl);
		break;
	default:
		return SERR_NO_SUCH;
	}
	return SNMP_OK;
}
#endif	/* SNMP */
