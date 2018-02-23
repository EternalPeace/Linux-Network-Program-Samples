/* sync.cpp - tcdm */

#include <stdio.h>
#include <winsock.h>

unsigned char	synching;/* non-zero, if we are doing telnet SYNCH	*/

/*------------------------------------------------------------------------
 * tcdm - handle the telnet "DATA MARK" command (marks end of SYNCH)
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
tcdm(SOCKET sfd, FILE *tfp, int c)
{
	if (synching > 0)
		synching--;
	return 0;
}
