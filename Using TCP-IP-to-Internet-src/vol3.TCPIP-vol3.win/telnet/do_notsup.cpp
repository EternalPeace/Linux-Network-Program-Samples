/* do_notsup.cpp - do_notsup */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_notsup - handle an unsupported telnet "will/won't" option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_notsup(SOCKET sfd, FILE *tfp, int c)
{
	(void) sputc(TCIAC, sfd);
	(void) sputc(TCDONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
