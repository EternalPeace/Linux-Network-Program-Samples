/* teputc.c - teputc */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"
#include "local.h"

/*------------------------------------------------------------------------
 * teputc - move a character from the keyboard to the TLI descriptor
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
teputc(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	if (sndbinary) {
		if (c == TCIAC)
			(void) putc(TCIAC, rfp); /* byte-stuff IAC	*/
		(void) putc(c, rfp);
		return 0;
	}
	c &= 0x7f;	/* 7-bit ASCII only */
	if (c == t_intrc || c == t_quitc) {	/* Interrupt		*/
		(void) putc(TCIAC, rfp);
		(void) putc(TCIP, rfp);
	} else if (c == sg_erase) {		/* Erase Char		*/
		(void) putc(TCIAC, rfp);
		(void) putc(TCEC, rfp);
	} else if (c == sg_kill) {		/* Erase Line		*/
		(void) putc(TCIAC, rfp);
		(void) putc(TCEL, rfp);
	} else if (c == t_flushc) {		/* Abort Output		*/
		(void) putc(TCIAC, rfp);
		(void) putc(TCAO, rfp);
	} else if (c >= ' ' && c < TCIAC)	/* printable ASCII only	*/
		(void) putc(c, rfp);
	else
		switch (c) {
		case VPLF:
		case VPCR:
		case VPBEL:
		case VPBS:
		case VPHT:
		case VPFF:
			(void) putc(c, rfp);
		default:
			break;	/* invalid character */
		}
	return 0;
}
