/* sputc.cpp - sputc */

#include <winsock.h>

/*-----------------------------------------------------------------------
 * sputc - put one character on a socket
 *-----------------------------------------------------------------------
 */
int
sputc(const char c, SOCKET sfd)
{
	return send(sfd, &c, 1, 0);
}
