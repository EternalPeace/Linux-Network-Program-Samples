/* ttputc.c - ttputc */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

/*------------------------------------------------------------------------
 * ttputc - print a single character on a Network Virtual Terminal
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
ttputc(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	static	last_char;
	int	tc;

	if (rcvbinary) { 
		(void) xputc(c, tfp);	/* print uninterpretted	*/
		return;
	}
	if (synching)			/* no data, if in SYNCH	*/
		return;

	if ((last_char == VPCR && c == VPLF) ||
	    (last_char == VPLF && c == VPCR)) {
		(void) xputc(VPLF, tfp);
		last_char = 0;
		return;
	}
	if (last_char == VPCR)
		(void) tcout("cr", tfp);
	else if (last_char == VPLF)
		(void) tcout("do", tfp);
	if (c >= ' ' && c < TCIAC)	/* printable ASCII	*/
		(void) xputc(c, tfp);
	else {				/* NVT special		*/
		switch (c) {
		case VPLF: 		/* see if CR follows	*/
		case VPCR:	tc = 1;	/* see if LF follows	*/
				break;
		case VPBEL:	tc = tcout("bl", tfp);
				break;
		case VPBS:	tc = tcout("bc", tfp);
				break;
		case VPHT:	tc = tcout("ta", tfp);
				break;
		case VPVT:	tc = tcout("do", tfp);
				break;
		case VPFF:	tc = tcout("cl", tfp);
				break;
		default:
			tc = 1;
			break;	/* no action */
		}
		if (!tc)		/* if no termcap, assume ASCII */
			(void) xputc(c, tfp);
	}
	last_char = c;
}
