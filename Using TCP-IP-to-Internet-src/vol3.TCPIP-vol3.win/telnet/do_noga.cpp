/* do_noga.cpp - do_noga */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_noga - don't do telnet Go-Ahead's
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_noga(SOCKET sfd, FILE *tfp, int c)
{
	static	noga;

	if (noga) {
		if (option_cmd == TCWILL)
			return 0;
	} else if (option_cmd == TCWONT)
		return 0;
	noga = !noga;
	(void) sputc(TCIAC, sfd);
	if (noga)
		(void) sputc(TCDO, sfd);
	else
		(void) sputc(TCDONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
