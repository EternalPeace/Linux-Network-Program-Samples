/* daytimed.cpp - main, daytime */

#include <stdio.h>
#include <time.h>
#include <winsock.h>

void	daytime(char buf[]);
void	errexit(const char *, ...);
SOCKET	passiveTCP(const char *, int);
SOCKET	passiveUDP(const char *);

#define WSVERS		MAKEWORD(2, 0)
#define	QLEN		   5

#define	LINELEN		 128

/*------------------------------------------------------------------------
 * main - Iterative server for DAYTIME service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	char	*service = "daytime";	/* service name or port number	*/
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	struct	sockaddr_in fsin;	/* the request from address	*/
	int	alen;			/* from-address length		*/
	SOCKET	tsock; 			/* TCP master socket		*/
	SOCKET	usock;			/* UDP socket			*/
	fd_set	rfds;			/* readable file descriptors	*/
	int	rv;
	WSADATA	wsadata;

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: daytimed [port]\n");
	}

	if (WSAStartup(WSVERS, &wsadata) != 0)
		errexit("WSAStartup failed\n");

	tsock = passiveTCP(service, QLEN);
	usock = passiveUDP(service);

	FD_ZERO(&rfds);

	while (1) {
		FD_SET(tsock, &rfds);
		FD_SET(usock, &rfds);

		if (select(FD_SETSIZE, &rfds, (fd_set *)0, (fd_set *)0,
				(struct timeval *)0) == SOCKET_ERROR)
			errexit("select error: %d\n", GetLastError());
		if (FD_ISSET(tsock, &rfds)) {
			SOCKET	ssock;		/* TCP slave socket	*/

			alen = sizeof(fsin);
			ssock = accept(tsock, (struct sockaddr *)&fsin,
				&alen);
			if (ssock == INVALID_SOCKET)
				errexit("accept failed: error %d\n",
					GetLastError());
			daytime(buf);
			(void) send(ssock, buf, strlen(buf), 0);
			(void) closesocket(ssock);
		}
		if (FD_ISSET(usock, &rfds)) {
			alen = sizeof(fsin);
			rv = recvfrom(usock, buf, sizeof(buf), 0,
			    (struct sockaddr *)&fsin, &alen);
			if (rv == SOCKET_ERROR)
				errexit("recvfrom: error number %d\n",
					GetLastError());
			daytime(buf);
			(void) sendto(usock, buf, strlen(buf), 0,
				(struct sockaddr *)&fsin, sizeof(fsin));
		}
	}
}

/*------------------------------------------------------------------------
 * daytime - fill the given buffer with the time of day
 *------------------------------------------------------------------------
 */
void
daytime(char buf[])
{
	time_t	now;

	(void) time(&now);
	sprintf(buf, "%s", ctime(&now));
}
