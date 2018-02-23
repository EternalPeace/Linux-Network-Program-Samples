/* a1rwoid.c - a1readoid, a1writeoid */

#include <conf.h>
#include <kernel.h>
#include <network.h>

#ifdef	SNMP

#include <snmp.h>
#include <asn1.h>

char MIB_PREFIX[] = { 0x2b, 0x6, 0x1, 0x2, 0x1 };   /* 1.3.6.1.2.1 */

/*------------------------------------------------------------------------
 * a1readoid - convert an ASN.1 encoded object id into internal form
 *------------------------------------------------------------------------
 */
int
a1readoid(unsigned char *pack, int objidlen, struct oid *objid)
{
	int 	val;
	u_char 	*pp;

	objid->len = 0;
	pp = pack;
	
	/* verify the required 1.3.6.1.2.1 prefix */
	if (memcmp(MIB_PREFIX, pp, MIB_PREF_SZ)) {
		return SYSERR;
	}
	pp += MIB_PREF_SZ;
	
	for (; pp < pack + objidlen; objid->len++) {
		if (! (*pp & CHAR_HIBIT)) {
			objid->id[objid->len] = *pp++;
			continue;
		}
		/*
		 * using long form, where bits 6 - 0 of each
		 * octet are used; (bit 7 == 0) ==> last octet
		 */
		val = 0;
		do
			val = (val << 7) | (int) (*pp & ~CHAR_HIBIT);
		while (*pp++ & CHAR_HIBIT);   /* high bit set */
		objid->id[objid->len] = val;
	}
	return OK;
}

/*------------------------------------------------------------------------
 * a1writeoid - convert an object id into ASN.1 encoded form
 *------------------------------------------------------------------------
 */
int
a1writeoid(unsigned char *packp, struct oid *oidp)
{
	register u_char	*pp;
	int		i;
	u_char 		*objidp, *lenp;

	pp = packp;
	lenp = pp++;	/* save location of objid len */
	objidp = pp;
	/* prepend the standard MIB prefix. */
	memcpy(pp, MIB_PREFIX, MIB_PREF_SZ); 
	pp += MIB_PREF_SZ;

	for (i=0; i < oidp->len; i++)
		if (oidp->id[i] < CHAR_HIBIT) 	/* short form */
			*pp++ = oidp->id[i];
		else {				/* long form */
			if (oidp->id[i] >= (u_short) (BYTE2_HIBIT >> 1))
				*pp++ = (u_char) (oidp->id[i] >> 14) |
				    CHAR_HIBIT;
			*pp++ = (u_char) (oidp->id[i] >> 7) | CHAR_HIBIT;
			*pp++ = (u_char) (oidp->id[i] & ~CHAR_HIBIT);
		}
	*lenp = pp - objidp;	/* assign the length of the objid */
	return pp - packp;
}
#endif	/* SNMP */
