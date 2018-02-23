/* TCPecho.cpp - main, TCPecho */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <winsock.h>

void	TCPecho(const char *, const char *);
void	errexit(const char *, ...);
SOCKET	connectTCP(const char *, const char *);

#define	LINELEN		 128
#define	WSVERS		MAKEWORD(2, 0)

/*------------------------------------------------------------------------
 * main - TCP client for ECHO service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	char	*host = "localhost";	/* host to use if none supplied	*/
	char	*service = "echo";	/* default service name		*/
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
		fprintf(stderr, "usage: TCPecho [host [port]]\n");
		exit(1);
	}
	if (WSAStartup(WSVERS, &wsadata) != 0)
		errexit("WSAStartup failed\n");
	TCPecho(host, service);
	WSACleanup();
	exit(0);
}

/*------------------------------------------------------------------------
 * TCPecho - send input to ECHO service on specified host and print reply
 *------------------------------------------------------------------------
 */
void
TCPecho(const char *host, const char *service)
{
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	SOCKET	s;			/* socket descriptor		*/
	int	cc, outchars, inchars;	/* characters counts		*/

	s = connectTCP(host, service);

	while (fgets(buf, sizeof(buf), stdin)) {
		buf[LINELEN] = '\0';	/* ensure line null-termination	*/
		outchars = strlen(buf);
		(void) send(s, buf, outchars, 0);

		/* read it back */
		for (inchars = 0; inchars < outchars; inchars += cc) {
			cc = recv(s, &buf[inchars], outchars-inchars, 0);
			if (cc == SOCKET_ERROR)
				errexit("socket recv failed: %d\n",
					GetLastError());
		}
		fputs(buf, stdout);
	}
	closesocket(s);
}
