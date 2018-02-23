/* telnet.cpp - telnet */

#include <io.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <winsock.h>

#include "local.h"

extern unsigned char	synching;

#define	BUFSIZE		2048	/* read buffer size	*/


SOCKET	connectTCP(const char *host, const char *service);
SOCKET	ttycon(void);

/*------------------------------------------------------------------------
 * telnet - do the TELNET protocol to the given host and port
 *------------------------------------------------------------------------
 */
void
telnet(const char *host, const char *service)
{
	SOCKET	sock, con; /* remote and console socket descriptors */
	u_char	buf[BUFSIZE];
	int	cc;
	int	on = 1;
	fd_set	arfds, rfds;

	con = ttycon();

	sock = connectTCP(host, service);

	fsmbuild();	/* set up FSM's */

	(void) setsockopt(sock, SOL_SOCKET, SO_OOBINLINE, (char *)&on,
			sizeof(on));
	FD_ZERO(&arfds);
	FD_SET(sock, &arfds);	/* the socket			*/
	FD_SET(con, &arfds);	/* standard input		*/

	while (1) {
		memcpy(&rfds, &arfds, sizeof(rfds));

		if (select(FD_SETSIZE, &rfds, (fd_set *)0,
		    (fd_set *)0, (struct timeval *)0) < 0) {
			if (GetLastError() == WSAEINTR)
				continue;	/* just a signal*/
			errexit("select: %d\n", GetLastError());
		}
		if (FD_ISSET(sock, &rfds)) {
			unsigned long	no_urg;
			if (ioctlsocket(sock, SIOCATMARK, &no_urg) ==
			    SOCKET_ERROR)
				errexit("socket ioctl error %d\n",
					GetLastError());
			synching = !no_urg;

			cc = recv(sock, (char *)buf, sizeof(buf), 0);
			if (cc == SOCKET_ERROR)
				errexit("socket recv: %d\n",
						GetLastError());
			else if (cc == 0)
				errexit("\nconnection close.\n");
			else
				ttwrite(sock, stdout, buf, cc);
		}
		if (FD_ISSET(con, &rfds)) {
			cc = recv(con, (char *)buf, sizeof(buf), 0);
			if (cc == SOCKET_ERROR)
				errexit("tty read: %d\n",
						GetLastError());
			else if (cc == 0) {
				FD_CLR(con, &arfds);
				(void) shutdown(sock, 1);
			} else
				sowrite(sock, stdout, buf, cc);
		}
		(void) fflush(stdout);
	}
}
