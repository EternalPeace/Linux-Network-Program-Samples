/* will_termtype.cpp - will_termtype */

#include <stdio.h>
#include <stdlib.h>
#include <winsock.h>

#include "local.h"
#include "telnet.h"

char		termtype;	/* non-zero if received "DO TERMTYPE"	*/
char		*term;		/* terminal name			*/
extern u_char	option_cmd;

int	do_txbinary(SOCKET,FILE *,int), will_txbinary(SOCKET,FILE *,int);

/*------------------------------------------------------------------------
 * will_termtype - handle telnet "do/don't" TERMINAL-TYPE option
 *------------------------------------------------------------------------
 */
int
will_termtype(SOCKET sfd, FILE *tfp, int c)
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
	(void) sputc(TCIAC, sfd);
	if (termtype)
		(void) sputc(TCWILL, sfd);
	else
		(void) sputc(TCWONT, sfd);
	(void) sputc((char)c, sfd);
	if (termtype) {	/* set up binary data path; send WILL, DO */
		option_cmd = TCWILL;
		(void) do_txbinary(sfd, tfp, TOTXBINARY);
		option_cmd = TCDO;
		(void) will_txbinary(sfd, tfp, TOTXBINARY);
	}
	return 0;
}
