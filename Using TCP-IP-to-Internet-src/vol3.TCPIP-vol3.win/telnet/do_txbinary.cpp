/* do_txbinary.cpp - do_txbinary */

#include <stdio.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

unsigned char	rcvbinary;	/* non-zero if remote TRANSMIT-BINARY	*/
extern u_char	option_cmd;

/*------------------------------------------------------------------------
 * do_txbinary - handle telnet "will/won't" TRANSMIT-BINARY option
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
do_txbinary(SOCKET sfd, FILE *tfp, int c)
{
	if (rcvbinary) {
		if (option_cmd == TCWILL)
			return 0;
	} else if (option_cmd == TCWONT)
		return 0;
	rcvbinary = !rcvbinary;
	(void) sputc(TCIAC, sfd);
	if (rcvbinary)
		(void) sputc(TCDO, sfd);
	else
		(void) sputc(TCDONT, sfd);
	(void) sputc((char)c, sfd);
	return 0;
}
