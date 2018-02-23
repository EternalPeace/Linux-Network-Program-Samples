/* UDPecho.cpp - main, UDPecho */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <winsock.h>

void	UDPecho(const char *, const char *);
void	errexit(const char *, ...);
SOCKET	connectUDP(const char *, const char *);

#define	LINELEN		128
#define	WSVERS		MAKEWORD(2, 0)

/*------------------------------------------------------------------------
 * main - UDP client for ECHO service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	char	*host = "localhost";
	char	*service = "echo";
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
		fprintf(stderr, "usage: UDPecho [host [port]]\n");
		exit(1);
	}
	if (WSAStartup(WSVERS, &wsadata))
		errexit("WSAStartup failed\n");
	UDPecho(host, service);
	WSACleanup();
	exit(0);
}

/*------------------------------------------------------------------------
 * UDPecho - send input to ECHO service on specified host and print reply
 *------------------------------------------------------------------------
 */
void
UDPecho(const char *host, const char *service)
{
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	SOCKET	s;			/* socket descriptor */
	int	nchars;			/* read count*/

	s = connectUDP(host, service);

	while (fgets(buf, sizeof(buf), stdin)) {
		buf[LINELEN] = '\0';	/* ensure null-terminated */
		nchars = strlen(buf);
		(void) send(s, buf, nchars, 0);

		if (recv(s, buf, nchars, 0) < 0)
			errexit("recv failed: error %d\n",
					GetLastError());
		fputs(buf, stdout);
	}
}
