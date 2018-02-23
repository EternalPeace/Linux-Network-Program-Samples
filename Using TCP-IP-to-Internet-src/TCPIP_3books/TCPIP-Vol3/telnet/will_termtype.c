/* will_termtype.c - will_termtype */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"

char	*getenv();

char		termtype;	/* non-zero if received "DO TERMTYPE"	*/
char		*term;		/* terminal name			*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * will_termtype - handle TELNET DO/DON'T TERMINAL-TYPE option
 *------------------------------------------------------------------------
 */
int
will_termtype(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	if (termtype) {
		if (option_cmd == TCDO)
			return 0;
	} else if (option_cmd == TCDONT)
		return 0;
	termtype = !termtype;
	if (termtype)
		if (!term && !(term = getenv("TERM")))
			termtype = !termtype;	/* can't do it... */
	(void) putc(TCIAC, rfp);
	if (termtype)
		(void) putc(TCWILL, rfp);
	else
		(void) putc(TCWONT, rfp);
	(void) putc((char)c, rfp);
	if (termtype) {	/* set up binary data path; send WILL, DO */
		option_cmd = TCWILL;
		(void) do_txbinary(rfp, tfp, TOTXBINARY);
		option_cmd = TCDO;
		(void) will_txbinary(rfp, tfp, TOTXBINARY);
	}
	return 0;
}
