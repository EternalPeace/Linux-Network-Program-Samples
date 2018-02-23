/* do_notsup.c - do_notsup */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_notsup - handle an unsupported TELNET WILL/WON'T option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_notsup(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	(void) putc(TCIAC, rfp);
	(void) putc(TCDONT, rfp);
	(void) putc((char)c, rfp);
	return 0;
}
