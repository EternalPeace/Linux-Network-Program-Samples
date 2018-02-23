/* snprint.c - snmpprint snmpprint_val snmpprint_objid
   snmpprint_objname */

#include <conf.h>
#include <kernel.h>
#include <network.h>
#include <string.h>
#include <io.h>

#ifdef	SNMP

#include <ctype.h>
#include <snmp.h>
#include <mib.h>
#include <asn1.h>

/* --------------------------------------------------------------------
 * snmpprint - print out each binding in the bindings list.
 * --------------------------------------------------------------------
 */
void
snmpprint(int stdout, struct snbentry *bindl)
{
	/* for each element in bindl, print objid string and value. */
	for (; bindl != (struct snbentry *) NULL; bindl = bindl->sb_next) {
		snmpprint_objname(stdout, &bindl->sb_oid);
		write(stdout, " = ", 3);
		snmpprint_val(stdout, &bindl->sb_val);
		write(stdout, "\n", 1);
	}
}

/* --------------------------------------------------------------------
 * snmpprint_val - print out the value in the snval structure.
 * --------------------------------------------------------------------
 */
void
snmpprint_val(int stdout, struct snval *val)
{
	char 	buff[1024];
	int 	i;

	switch(val->sv_type) {
	    case ASN1_INT :
		strcpy(buff, " (Integer) ");
		break;
	    case ASN1_COUNTER :
		strcpy(buff, " (Counter) ");
		break;
	    case ASN1_GAUGE :
		strcpy(buff, " (Gauge) ");
		break;
	    case ASN1_TIMETICKS :
		strcpy(buff, " (Timeticks) ");
		break;
	    case ASN1_OCTSTR :
		strcpy(buff, " (Octet Str) ");
		break;
	    case ASN1_NULL :
		break;
	    case ASN1_OBJID :
		strcpy(buff, " (Object ID) ");
		break;
	    case ASN1_IPADDR :
		strcpy(buff, " (IP Address) ");
		break;
	}
	if (val->sv_type != ASN1_NULL)
	    write(stdout, buff, strlen(buff));
		
	switch(val->sv_type) {
	    case ASN1_INT :
	    case ASN1_COUNTER :
	    case ASN1_GAUGE :
	    case ASN1_TIMETICKS :
		sprintf(buff, "%d", val->sv_val.sv_int);
		write(stdout, buff, strlen(buff));
		break;
	    case ASN1_OCTSTR :
		for (i = 0; i < val->sv_val.sv_str.sv_len; i++)
		    if (! isprint(val->sv_val.sv_str.sv_str[i]))
			break;
		/* if something wasn't printable */
		if (i < val->sv_val.sv_str.sv_len) 
		    for (i = 0; i < val->sv_val.sv_str.sv_len; i++) {
			    sprintf(buff, "0x%02x ",
				    (u_char) val->sv_val.sv_str.sv_str[i]);
			    write(stdout, buff, strlen(buff));
		    }
		else
		    write(stdout, val->sv_val.sv_str.sv_str,
			  val->sv_val.sv_str.sv_len);
		break;
	    case ASN1_NULL :
		write(stdout, "Null", 4);
		break;
	    case ASN1_OBJID :
		snmpprint_objid(stdout, &(val->sv_val.sv_oid));
		break;
	    case ASN1_IPADDR :
		for (i = 0; i < IP_ALEN - 1; i++) {
			sprintf(buff, "%d.",
				(int)BYTE(&val->sv_val.sv_ipaddr,i));
			write(stdout, buff, strlen(buff));
		}
		sprintf(buff, "%d", (int)BYTE(&val->sv_val.sv_ipaddr,i));
		write(stdout, buff, strlen(buff));
		break;
	    default :
		break;
	}
}	
	
/* --------------------------------------------------------------------
 * snmpprint_objid - print out an object identifier.
 * --------------------------------------------------------------------
 */
void
snmpprint_objid(int stdout, struct oid *objidp)
{
	int 	i;
	char 	buff[80];

	for (i = 0; i < objidp->len - 1; i++) {
		sprintf(buff, "%d.", objidp->id[i]);
		write(stdout, buff, strlen(buff));
	}
	sprintf(buff, "%d", objidp->id[i]);
	write(stdout, buff, strlen(buff));
}

/* --------------------------------------------------------------------
 * snmpprint_objname - print out the name corresponding to an objid.
 * --------------------------------------------------------------------
 */
void
snmpprint_objname(int stdout, struct oid *oip)
{
	char	buff[80];
	struct	mib_info *np;
	struct 	oid	tmpobj;
	u_short	*tp;
	int	i;
	
	if ((char *) (np = getmib(oip)) == NULL)
	    snmpprint_objid(stdout, oip);
	else {
		strcpy(buff, np->mi_prefix);
		strcat(buff, np->mi_name);
		write(stdout, buff, strlen(buff));
		if (np->mi_varleaf == NLEAF) {
			write(stdout, ".", 1);
			tmpobj.len = oip->len - np->mi_objid.len;
			tp = tmpobj.id;
			for (i = np->mi_objid.len; i < oip->len; i++)
			    *tp++ = oip->id[i];
			snmpprint_objid(stdout, &tmpobj);
		}
	}
}
#endif	/* SNMP */
