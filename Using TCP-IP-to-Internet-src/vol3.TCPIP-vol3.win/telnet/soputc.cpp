/* soputc.cpp - soputc */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"
#include "local.h"

/*------------------------------------------------------------------------
 * soputc - move a character from the keyboard to the socket
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
soputc(SOCKET sfd, FILE *tfp, int c)
{
	if (sndbinary) {
		if (c == TCIAC)
			(void) sputc(TCIAC, sfd); /* byte-stuff IAC	*/
		(void) sputc(c, sfd);
		return 0;
	}
	c &= 0x7f;	/* 7-bit ASCII only */
	if (c == t_intrc || c == t_quitc) {	/* Interrupt		*/
		(void) sputc(TCIAC, sfd);
		(void) sputc(TCIP, sfd);
	} else if (c == sg_erase) {		/* Erase Char		*/
		(void) sputc(TCIAC, sfd);
		(void) sputc(TCEC, sfd);
	} else if (c == sg_kill) {		/* Erase Line		*/
		(void) sputc(TCIAC, sfd);
		(void) sputc(TCEL, sfd);
	} else if (c == t_flushc) {		/* Abort Output		*/
		(void) sputc(TCIAC, sfd);
		(void) sputc(TCAO, sfd);
	} else
		(void) sputc(c, sfd);
	return 0;
}
