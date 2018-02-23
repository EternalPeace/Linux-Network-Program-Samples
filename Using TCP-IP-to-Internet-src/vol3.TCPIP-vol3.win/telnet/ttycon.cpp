/* ttycon.cpp - ttycon, conreader */

#include <conio.h>
#include <process.h>
#include <stdio.h>
#include <string.h>
#include <winsock.h>

#include "local.h"

static void conreader(unsigned int);

unsigned int	ttyflags = ECHO;

/*------------------------------------------------------------------------
 * ttycon - set up console as SOCKET connection
 *------------------------------------------------------------------------
 */
SOCKET
ttycon(void)
{
	struct sockaddr_in	sin;
	SOCKET			lsock, rsock;
	int			len;

	/* initialize special characters */

	lsock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (lsock == INVALID_SOCKET)
		errexit("ttycon: socket failed (%d)\n", GetLastError());
	memset(&sin, 0, sizeof sin);
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
	sin.sin_port = 0;	/* let Windows pick a port */
	if (bind(lsock, (struct sockaddr *)&sin, sizeof sin) ==
	    SOCKET_ERROR)
		errexit("ttycon: bind failed (%d)\n", GetLastError());
	len = sizeof sin;
	if (getsockname(lsock, (struct sockaddr *)&sin, &len) ==
	    SOCKET_ERROR)
		errexit("ttycon: getsockname error %d\n", GetLastError());
	if (_beginthread((void (*)(void *))conreader, 0,
			(void *)sin.sin_port) < 0)
		errexit("ttycon: beginthread failed (%s)\n",
			strerror(errno));
	if (listen(lsock, 1) == SOCKET_ERROR)
		errexit("ttycon: listen failed (%d)\n", GetLastError());
	len = sizeof sin;
	rsock = accept(lsock, (struct sockaddr *)&sin, &len);
	if (rsock == INVALID_SOCKET)
		errexit("ttycon: accept failed (%d)\n", GetLastError());
	closesocket(lsock);
	return rsock;
}

/*
 * conreader - do blocking console I/O and relay it to a socket
 */
static void
conreader(unsigned int port)
{
	struct sockaddr_in	sin;
	SOCKET			telsock;
	char			ch;

	memset(&sin, 0, sizeof sin);
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = ntohl(INADDR_LOOPBACK);
	sin.sin_port = port;
	telsock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (telsock == INVALID_SOCKET)
		errexit("conreader: socket error %d\n", GetLastError());
	if (connect(telsock, (struct sockaddr *)&sin, sizeof sin) ==
	    SOCKET_ERROR)
		errexit("conreader: connect error %d\n", GetLastError());

	while (1) {
		ch = _getch();
		if (ttyflags & ECHO)
			putch(ch);
		if (send(telsock, &ch, 1, 0) == SOCKET_ERROR)
			return;
	}
	return;
}
