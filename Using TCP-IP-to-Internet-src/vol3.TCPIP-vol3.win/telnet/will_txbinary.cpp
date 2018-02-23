/* will_txbinary.cpp - will_txbinary */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

unsigned char	sndbinary;	/* non-zero if TRANSMIT-BINARY		*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * will_txbinary - handle telnet "do/don't" TRANSMIT-BINARY option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
will_txbinary(SOCKET sfd, FILE *tfp, int c)
{
	if (sndbinary) {
		if (option_cmd == TCDO)
			return 0;
	} else if (option_cmd == TCDONT)
		return 0;
	sndbinary = !sndbinary;
	(void) sputc(TCIAC, sfd);
	if (sndbinary)
		(void) sputc(TCWILL, sfd);
	else
		(void) sputc(TCWONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
