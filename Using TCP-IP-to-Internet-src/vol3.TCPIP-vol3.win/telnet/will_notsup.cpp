/* will_notsup.cpp - will_notsup */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

/*------------------------------------------------------------------------
 * will_notsup - handle an unsupported telnet "do/don't" option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
will_notsup(SOCKET sfd, FILE *tfp, int c)
{
	(void) sputc(TCIAC, sfd);
	(void) sputc(TCWONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
