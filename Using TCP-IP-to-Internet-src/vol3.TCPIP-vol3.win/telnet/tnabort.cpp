/* tnabort.cpp - tnabort */

#include <stdio.h>
#include <winsock.h>

void	errexit(const char *, ...);

/*------------------------------------------------------------------------
 * tnabort - abort telnet due to invalid state
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
tnabort(SOCKET sfd, FILE *tfp, int c)
{
	errexit("invalid state reached (aborting)\n");
	return 0;	/* to keep picky compilers happy */
}
