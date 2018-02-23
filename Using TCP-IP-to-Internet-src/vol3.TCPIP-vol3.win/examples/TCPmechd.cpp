/* TCPmechd.cpp - main, echo */

#include <winsock.h>
#include <string.h>

#define	QLEN		   5	/* maximum connection queue length	*/

#define	BUFSIZE		4096
#define	WSVERS		MAKEWORD(2, 0)


void	errexit(const char *, ...);
SOCKET	passiveTCP(const char *, int);
int	echo(SOCKET);


/*------------------------------------------------------------------------
 * main - Concurrent TCP server for ECHO service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	char	*service = "echo";	/* service name or port number	*/
	struct	sockaddr_in fsin;	/* the from address of a client	*/
	SOCKET	msock;			/* master server socket		*/
	fd_set	rfds;			/* read file descriptor set	*/
	fd_set	afds;			/* active file descriptor set	*/
	int	alen;			/* from-address length		*/
	WSADATA	wsdata;
	unsigned int	fdndx;

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPmechod [port]\n");
	}

	if (WSAStartup(WSVERS, &wsdata) != 0)
		errexit("WSAStartup failed\n");

	msock = passiveTCP(service, QLEN);

	FD_ZERO(&afds);
	FD_SET(msock, &afds);

	while (1) {
		memcpy(&rfds, &afds, sizeof(rfds));

		if (select(FD_SETSIZE, &rfds, (fd_set *)0, (fd_set *)0,
		    (struct timeval *)0) == SOCKET_ERROR)
			errexit("select error: %d\n", GetLastError());
		if (FD_ISSET(msock, &rfds)) {
			SOCKET	ssock;

			alen = sizeof(fsin);
			ssock = accept(msock, (struct sockaddr *)&fsin,
				&alen);
			if (ssock == INVALID_SOCKET)
				errexit("accept: error %d\n",
					GetLastError());
			FD_SET(ssock, &afds);
		}

		for (fdndx=0; fdndx<rfds.fd_count; ++fdndx){
			SOCKET fd = rfds.fd_array[fdndx];

			if (fd != msock && FD_ISSET(fd, &rfds))
				if (echo(fd) == 0) {
					(void) closesocket(fd);
					FD_CLR(fd, &afds);
				}
		}
	}
}

/*------------------------------------------------------------------------
 * echo - echo one buffer of data, returning byte count
 *------------------------------------------------------------------------
 */
int
echo(SOCKET fd)
{
	char	buf[BUFSIZE];
	int	cc;

	cc = recv(fd, buf, sizeof buf, 0);
	if (cc == SOCKET_ERROR)
		errexit("echo recv error %d\n", GetLastError());
	if (cc && send(fd, buf, cc, 0) == SOCKET_ERROR)
		errexit("echo send error %d\n", GetLastError());
	return cc;
}
