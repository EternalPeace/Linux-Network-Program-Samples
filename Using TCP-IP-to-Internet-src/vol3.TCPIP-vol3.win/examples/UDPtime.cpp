/* UDPtime.cpp - main */

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <winsock.h>

#define	BUFSIZE		  64
#define	WSVERS		MAKEWORD(2, 0)

#define	WINEPOCH	2208988800	/* Windows epoch, in UCT secs	*/
#define	MSG		"what time is it?\n"

SOCKET	connectUDP(const char *, const char *);
void	errexit(const char *, ...);

/*------------------------------------------------------------------------
 * main - UDP client for TIME service that prints the resulting time
 *------------------------------------------------------------------------
 */
int
main(int argc, char *argv[])
{
	char	*host = "localhost";	/* host to use if none supplied	*/
	char	*service = "time";	/* default service name		*/
	time_t	now;			/* 32-bit integer to hold time	*/
	SOCKET	s;			/* socket descriptor		*/
	int	n;			/* recv count			*/
	WSADATA	wsadata;

	switch (argc) {
	case 1:
		host = "localhost";
		break;
	case 3:
		service = argv[2];
		/* FALL THROUGH */
	case 2:
		host = argv[1];
		break;
	default:
		fprintf(stderr, "usage: UDPtime [host [port]]\n");
		exit(1);
	}
	if (WSAStartup(WSVERS, &wsadata))
		errexit("WSAStartup failed\n");

	s = connectUDP(host, service);

	(void) send(s, MSG, strlen(MSG), 0);

	/* Read the time */

	n = recv(s, (char *)&now, sizeof(now), 0);
  	if (n == SOCKET_ERROR)
		errexit("recv failed: recv() error %d\n", GetLastError());
	WSACleanup();
	now = ntohl((u_long)now);	/* put in host byte order	*/
	now -= WINEPOCH;		/* convert UCT to Windows epoch	*/
	printf("%s", ctime(&now));
	return 0;	/* exit */
}
