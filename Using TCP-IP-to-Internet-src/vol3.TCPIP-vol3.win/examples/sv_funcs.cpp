/* sv_funcs.cpp - TCPechod, TCPchargend, TCPdaytimed, TCPtimed */

#include <stdio.h>
#include <time.h>
#include <winsock.h>

#define	BUFFERSIZE	4096		/* max read buffer size	*/

void	TCPechod(SOCKET), TCPchargend(SOCKET), TCPdaytimed(SOCKET),
	TCPtimed(SOCKET);
void	errexit(const char *, ...);

/*------------------------------------------------------------------------
 * TCPecho - do TCP ECHO on the given socket
 *------------------------------------------------------------------------
 */
void
TCPechod(SOCKET fd)
{
	char	buf[BUFFERSIZE];
	int	cc;

	while (cc = recv(fd, buf, sizeof buf, 0)) {
		if (cc == SOCKET_ERROR)
			errexit("echo recv: errnum %d\n", GetLastError());
		if (send(fd, buf, cc, 0) == SOCKET_ERROR)
			errexit("echo send: errnum %d\n", GetLastError());
	}
	closesocket(fd);
}

#define	LINELEN		72

/*------------------------------------------------------------------------
 * TCPchargend - do TCP CHARGEN on the given socket
 *------------------------------------------------------------------------
 */
void
TCPchargend(SOCKET fd)
{
	char	c, buf[LINELEN+2];	/* print LINELEN chars + \r\n */

	c = ' ';
	buf[LINELEN] = '\r';
	buf[LINELEN+1] = '\n';
	while (1) {
		int	i;

		for (i=0; i<LINELEN; ++i) {
			buf[i] = c++;
			if (c > '~')
				c = ' ';
		}
		if (send(fd, buf, LINELEN+2, 0) == SOCKET_ERROR)
			break;
	}
	closesocket(fd);
}

/*------------------------------------------------------------------------
 * TCPdaytimed - do TCP DAYTIME protocol
 *------------------------------------------------------------------------
 */
void
TCPdaytimed(SOCKET fd)
{
	char	buf[LINELEN];
	time_t	now;

	(void) time(&now);
	sprintf(buf, "%s", ctime(&now));
	(void) send(fd, buf, strlen(buf), 0);
	closesocket(fd);
}

#define	WINEPOCH	2208988800	/* Windows epoch, in UCT secs	*/

/*------------------------------------------------------------------------
 * TCPtimed - do TCP TIME protocol
 *------------------------------------------------------------------------
 */
void
TCPtimed(SOCKET fd)
{
	time_t	now;

	(void) time(&now);
	now = htonl((u_long)(now + WINEPOCH));
	(void) send(fd, (char *)&now, sizeof(now), 0);
	closesocket(fd);
}
