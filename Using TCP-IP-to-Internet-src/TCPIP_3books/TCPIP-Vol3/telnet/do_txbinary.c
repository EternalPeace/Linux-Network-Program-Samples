/* do_txbinary.c - do_txbinary */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

char		rcvbinary;	/* non-zero if remote TRANSMIT-BINARY	*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_txbinary - handle TELNET WILL/WON'T TRANSMIT-BINARY option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_txbinary(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	if (rcvbinary) {
		if (option_cmd == TCWILL)
			return 0;
	} else if (option_cmd == TCWONT)
		return 0;
	rcvbinary = !rcvbinary;
	(void) putc(TCIAC, rfp);
	if (rcvbinary)
		(void) putc(TCDO, rfp);
	else
		(void) putc(TCDONT, rfp);
	(void) putc((char)c, rfp);
	return 0;
}
