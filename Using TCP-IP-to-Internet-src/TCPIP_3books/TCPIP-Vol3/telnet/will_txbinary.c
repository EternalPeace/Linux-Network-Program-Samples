/* will_txbinary.c - will_txbinary */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

char		sndbinary;	/* non-zero if TRANSMIT-BINARY		*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * will_txbinary - handle TELNET DO/DON'T TRANSMIT-BINARY option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
will_txbinary(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	if (sndbinary) {
		if (option_cmd == TCDO)
			return 0;
	} else if (option_cmd == TCDONT)
		return 0;
	sndbinary = !sndbinary;
	(void) putc(TCIAC, rfp);
	if (sndbinary)
		(void) putc(TCWILL, rfp);
	else
		(void) putc(TCWONT, rfp);
	(void) putc((char)c, rfp);
	return 0;
}
