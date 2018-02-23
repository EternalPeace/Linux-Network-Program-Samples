/* subtermtype.cpp - subtermtype */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

extern char	*term;		/* terminal name, from initialization	*/

/*------------------------------------------------------------------------
 * subtermtype - do terminal type option subnegotation
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
subtermtype(SOCKET sfd, FILE *tfp, int c)
{
	/* have received IAC.SB.TERMTYPE.SEND */

	(void) sputc(TCIAC, sfd);
	(void) sputc(TCSB, sfd);
	(void) sputc(TOTERMTYPE, sfd);
	(void) sputc(TT_IS, sfd);
	SPUTS(term, sfd);
	(void) sputc(TCIAC, sfd);
	(void) sputc(TCSE, sfd);
	return 0;
}
