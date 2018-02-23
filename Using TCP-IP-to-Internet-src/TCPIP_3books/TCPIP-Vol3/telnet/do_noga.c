/* do_noga.c - do_noga */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_noga - don't do TELNET Go-Ahead's
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_noga(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	static	noga;

	if (noga) {
		if (option_cmd == TCWILL)
			return 0;
	} else if (option_cmd == TCWONT)
		return 0;
	noga = !noga;
	(void) putc(TCIAC, rfp);
	if (noga)
		(void) putc(TCDO, rfp);
	else
		(void) putc(TCDONT, rfp);
	(void) putc((char)c, rfp);
	return 0;
}
