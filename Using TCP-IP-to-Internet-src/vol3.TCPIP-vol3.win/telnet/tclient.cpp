/* tclient.cpp - main */

#include <stdlib.h>
#include <winsock.h>

#define	WSVERS	MAKEWORD(2, 0)

char	*host = "localhost";	/* host to use if none supplied		*/

void	errexit(const char *, ...);
void	telnet(const char *, const char *);

/*------------------------------------------------------------------------
 * main - TCP client for TELNET service
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	char	*service = "telnet";	/* default service name		*/
	WSADATA	wsdata;

	switch (argc) {
	case 1:	break;
	case 3:
		service = argv[2];
		/* FALL THROUGH */
	case 2:
		host = argv[1];
		break;
	default:
		errexit("usage: telnet [host [port]]\n");
	}
	if (WSAStartup(WSVERS, &wsdata))
		errexit("WSAStartup failed.\n");
	telnet(host, service);
	exit(0);
}

