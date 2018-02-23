/* snparse.c - snparse */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <mem.h>
#include <string.h>

#ifdef	SNMP

#include <snmp.h>
#include <asn1.h>

/*------------------------------------------------------------------------
 * snparse - convert the ASN.1-encoded SNMP packet into internal form
 *   N.B. the binding list rqdp->bindlf must either be NULL or a valid
 *        binding list, in which case I'll free it up.
 *------------------------------------------------------------------------
 */
int
snparse(struct req_desc *rqdp, u_char *snmppack, int len)
{
	struct snbentry *bl, *lastbl = 0;
	register u_char *packp;
	int 		totpacklen = 0, commlen = 0;
	int		pdulen, totbindlen = 0;
	u_int		lenlen;
	int		varbindlen = 0;
	u_char 		*packendp;

	packp = snmppack;
	packendp = snmppack + len;

	/* sequence operator and total packet length */
	if (*packp++ != ASN1_SEQ ||
	    (totpacklen = a1readlen(packp, &lenlen)) < 0) {
		return SYSERR;
	}
	packp += lenlen;

	/* verify total length, version, community */
	if (packendp != packp + totpacklen ||
	    *packp++ != ASN1_INT ||
	    *packp++ != SVERS_LEN ||
	    *packp++ != SVERSION ||
	    *packp++ != ASN1_OCTSTR ||
	    (commlen = a1readlen(packp, &lenlen)) < 0) {
		return SYSERR;
	}
	packp += lenlen;
	if (strncmp((char *)packp, SCOMM_STR, commlen) != 0) {
		return SYSERR;
	}
	packp += commlen;

	/* PDU type and length */
	if (*packp == PDU_TRAP)
		return SYSERR;
	rqdp->pdutype_pos = packp - snmppack;
	rqdp->reqtype = *packp++;
	if ((pdulen = a1readlen(packp, &lenlen)) < 0) {
		return SYSERR;
	}
	packp += lenlen;

	/* verify PDU length */
	if (packendp != packp + pdulen) {
		return SYSERR;
	}
	/* request id */
	if (*packp++ != ASN1_INT ||
	    (rqdp->reqidlen = a1readlen(packp, &lenlen)) < 0) {
		return SYSERR;
	}
	packp += lenlen;
	memcpy(rqdp->reqid, packp, rqdp->reqidlen);
	packp += rqdp->reqidlen;

	/* error status */
	if (*packp++ != ASN1_INT || *packp++ != 1) {
		return SYSERR;
	}
	rqdp->err_stat = *packp;
	rqdp->err_stat_pos = packp++ - snmppack;

	/* error index */
	if (*packp++ != ASN1_INT || *packp++ != 1) {
		return SYSERR;
	}
	rqdp->err_idx = *packp;
	rqdp->err_idx_pos = packp++ - snmppack;

	/* sequence of variable bindings */
	if (*packp++ != ASN1_SEQ ||
	    (totbindlen = a1readlen(packp, &lenlen)) < 0) {
		return SYSERR;
	}
	packp += lenlen;

	/* canberra bug fix - rqdp might already have old dynamic memory */
	/* attached, free before overwriting pointers */
	snfreebl(&rqdp->bindlf);

	/* verify variable bindings length */
	if (packendp != packp + totbindlen)
		return SYSERR;
	/* build doubly-linked bindings list; fill in only sb_a1str's	*/
	rqdp->bindlf = rqdp->bindle = (struct snbentry *) NULL;
	do {
		bl = (struct snbentry *) getmem(sizeof(struct snbentry));
		bl->sb_next = 0;
		bl->sb_prev = 0;
		if (rqdp->bindlf) {
			lastbl->sb_next = bl;
			bl->sb_prev = lastbl;
			lastbl = bl;
		} else
			lastbl = rqdp->bindlf = bl;
		bl->sb_a1str = packp;
		bl->sb_a1dynstr = FALSE;  /* not dynamically allocated */
		if (*packp++ != ASN1_SEQ ||
		    (varbindlen = a1readlen(packp, &lenlen)) < 0) {
			return SYSERR;
		}
		packp += lenlen;
		bl->sb_a1slen = varbindlen;
		packp += varbindlen;
	} while (packp < packendp);
	/* check that the entire packet has now been parsed */
	if (packp != packendp) {
		return SYSERR;
	}
	rqdp->bindle = lastbl;
	return OK;
}
#endif	/* SNMP */
