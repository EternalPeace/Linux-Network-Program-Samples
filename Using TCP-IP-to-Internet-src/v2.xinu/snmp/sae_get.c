/* sae_get.c - sae_get */

#include <conf.h>
#include <kernel.h>
#include <network.h>

#ifdef	SNMP

#include <snmp.h>
#include <mib.h>
#include <asn1.h>
     
/*------------------------------------------------------------------------
 * sae_get - perform a get on a variable in the IP Address Entry Table
 *------------------------------------------------------------------------
 */
int
sae_get(struct snbentry *bindl, int numifaces)
{
	int 	iface, field;
	
	if (sae_match(bindl, &iface, &field, numifaces) == SYSERR)
		return SERR_NO_SUCH;
	switch (field) {
	case 1:		/* ipAdEntAddr */
		SVTYPE(bindl) = ASN1_IPADDR;
		SVIPADDR(bindl)=nif[iface].ni_ip;
		return SNMP_OK;
	case 2:		/* ipAdEntIfIndex */
		SVTYPE(bindl) = ASN1_INT;
		SVINT(bindl) = iface;
		return SNMP_OK;
	case 3:		/* ipAdEntNetMask */
		SVTYPE(bindl) = ASN1_IPADDR;
		SVIPADDR(bindl)=nif[iface].ni_mask;
		return SNMP_OK;
	case 4:		/* ipAdEntBcastAddr */
		SVTYPE(bindl) = ASN1_INT;
		SVINT(bindl) = IP2I(nif[iface].ni_brc) & 0x1;
		return SNMP_OK;
	case 5:		/* ipAdEntReasmMaxSize */
		SVTYPE(bindl) = ASN1_INT;
		SVINT(bindl) = nif[iface].ni_maxreasm;
		return SNMP_OK;
	default:
		break;
	}
	return SERR_NO_SUCH;
}
#endif	/* SNMP */
