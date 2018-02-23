/* TCPdtd.cpp - main, TCPdaytimed */

#include <stdlib.h>
#include <winsock.h>
#include <time.h>

void	errexit(const char *, ...);
void	TCPdaytimed(SOCKET);
SOCKET	passiveTCP(const char *, int);

#define QLEN	   5
#define	WSVERS	MAKEWORD(2, 0)

/*------------------------------------------------------------------------
 * main - Iterative TCP server for DAYTIME service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	struct	sockaddr_in fsin;	/* the from address of a client	*/
	char	*service = "daytime";	/* service name or port number	*/
	SOCKET	msock, ssock;		/* master & slave sockets	*/
	int	alen;			/* from-address length		*/
	WSADATA wsadata;

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPdaytimed [port]\n");
	}

	if (WSAStartup(WSVERS, &wsadata) != 0)
		errexit("WSAStartup failed\n");

	msock = passiveTCP(service, QLEN);

	while (1) {
		alen = sizeof(struct sockaddr);
		ssock = accept(msock, (struct sockaddr *)&fsin, &alen);
		if (ssock == INVALID_SOCKET)
			errexit("accept failed: error number %d\n",
				 GetLastError());
		TCPdaytimed(ssock);
		(void) closesocket(ssock);
	}
}

/*------------------------------------------------------------------------
 * TCPdaytimed - do TCP DAYTIME protocol
 *------------------------------------------------------------------------
 */
void
TCPdaytimed(SOCKET fd)
{
	char	*pts;			/* pointer to time string	*/
	time_t	now;			/* current time			*/

	(void) time(&now);
	pts = ctime(&now);
	(void) send(fd, pts, strlen(pts), 0);
}	
