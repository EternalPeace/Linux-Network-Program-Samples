/* ttputc.cpp - ttputc */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"

int	xputc(char, FILE *);

/*------------------------------------------------------------------------
 * ttputc - print a single character on a Network Virtual Terminal
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
ttputc(SOCKET sfd, FILE *tfp, int c)
{
	static	last_char;
	int	tc = 0;

	if (rcvbinary) { 
		(void) xputc(c, tfp);	/* print uninterpretted	*/
		return 0;
	}
	if (synching)			/* no data, if in SYNCH	*/
		return 0;

	if ((last_char == VPCR && c == VPLF) ||
	    (last_char == VPLF && c == VPCR)) {
		(void) xputc(VPLF, tfp);
		last_char = 0;
		return 0;
	}
	if (last_char == VPCR)
		(void) xputc(VPCR, tfp);
	else if (last_char == VPLF)
		(void) xputc(VPLF, tfp);
	if (c >= ' ' && c < TCIAC)	/* printable ASCII	*/
		(void) xputc(c, tfp);
	else {				/* NVT special		*/
		switch (c) {
		case VPLF: 		/* see if CR follows	*/
		case VPCR:	tc = 1;	/* see if LF follows	*/
				break;
		default:
			break;	/* no action */
		}
		if (!tc)		/* if no termcap, assume ASCII */
			(void) xputc(c, tfp);
	}
	last_char = c;
	return 0;
}
