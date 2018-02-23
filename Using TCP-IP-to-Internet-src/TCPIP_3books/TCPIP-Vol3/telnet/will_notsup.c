/* will_notsup.c - will_notsup */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

/*------------------------------------------------------------------------
 * will_notsup - handle an unsupported TELNET DO/DON'T option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
will_notsup(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	(void) putc(TCIAC, rfp);
	(void) putc(TCWONT, rfp);
	(void) putc((char)c, rfp);
	return 0;
}
