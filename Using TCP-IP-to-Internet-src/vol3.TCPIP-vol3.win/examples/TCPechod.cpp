/* TCPechod.cpp - main, TCPechod */

#include <stdio.h>
#include <winsock.h>
#include <process.h>

#define	QLEN		   5	/* maximum connection queue length	*/
#define	STKSIZE		16536
#define	BUFSIZE		4096
#define	WSVERS		MAKEWORD(2, 0)

SOCKET	msock, ssock;		/* master & slave server sockets	*/

int	TCPechod(SOCKET);
void	errexit(const char *, ...);
SOCKET	passiveTCP(const char *, int);

/*------------------------------------------------------------------------
 * main - Concurrent TCP server for ECHO service
 *------------------------------------------------------------------------
 */
int
main(int argc, char *argv[])
{
	char	*service = "echo";	/* service name or port number	*/
	struct	sockaddr_in fsin;	/* the address of a client	*/
	int	alen;			/* length of client's address	*/
	WSADATA	wsadata;

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPechod [port]\n");
	}

	if (WSAStartup(WSVERS, &wsadata) != 0)
		errexit("WSAStartup failed\n");
	msock = passiveTCP(service, QLEN);

	while (1) {
		alen = sizeof(fsin);
		ssock = accept(msock, (struct sockaddr *)&fsin, &alen);
		if (ssock == INVALID_SOCKET)
			errexit("accept: error number\n", GetLastError());
		if (_beginthread((void (*)(void *))TCPechod, STKSIZE,
		    (void *)ssock) < 0) {
			errexit("_beginthread: %s\n", strerror(errno));
		}
	}
	return 1;	/* not reached */
}

/*------------------------------------------------------------------------
 * TCPechod - echo data until end of file
 *------------------------------------------------------------------------
 */
int
TCPechod(SOCKET fd)
{
	char	buf[BUFSIZE];
	int	cc;

	cc = recv(fd, buf, sizeof buf, 0);
	while (cc != SOCKET_ERROR && cc > 0) {
		if (send(fd, buf, cc, 0) == SOCKET_ERROR) {
			fprintf(stderr, "echo send error: %d\n",
				GetLastError());
			break;
		}
		cc = recv(fd, buf, sizeof buf, 0);
	}
	if (cc == SOCKET_ERROR)
		fprintf(stderr, "echo recv error: %d\n", GetLastError());
	closesocket(fd);
	return 0;
}

