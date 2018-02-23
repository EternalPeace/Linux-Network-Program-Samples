/* do_echo.cpp - do_echo */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

unsigned char	doecho;		/* nonzero, if remote ECHO	*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_echo - handle TELNET WILL/WON'T ECHO option
 *------------------------------------------------------------------------
 */
int
do_echo(SOCKET sfd, FILE *tfp, int c)
{
	if (doecho) {
		if (option_cmd == TCWILL)
			return 0;	/* already doing ECHO		*/
	} else if (option_cmd == TCWONT)
		return 0;		/* already NOT doing ECHO	*/
	if (option_cmd == TCWILL)
		ttyflags &= ~ECHO;
	else
		ttyflags |= ECHO;
	doecho = !doecho;

        (void) sputc(TCIAC, sfd);
        if (doecho)
                (void) sputc(TCDO, sfd);
        else
                (void) sputc(TCDONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
