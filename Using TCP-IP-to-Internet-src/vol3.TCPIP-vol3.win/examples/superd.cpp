/* superd.cpp - main, doTCP */

#include <process.h>
#include <winsock.h>

#define	UDP_SERV	0
#define	TCP_SERV	1

struct service {
	char	*sv_name;
	char	sv_useTCP;
	SOCKET	sv_sock;
	void	(*sv_func)(SOCKET);
};

void	TCPechod(SOCKET), TCPchargend(SOCKET), TCPdaytimed(SOCKET),
	TCPtimed(SOCKET);

SOCKET	passiveTCP(const char *, int);
SOCKET	passiveUDP(const char *);
void	errexit(const char *, ...);
void	doTCP(struct service *);

struct service svent[] =
	{	{ "echo", TCP_SERV, INVALID_SOCKET, TCPechod },
		{ "chargen", TCP_SERV, INVALID_SOCKET, TCPchargend },
		{ "daytime", TCP_SERV, INVALID_SOCKET, TCPdaytimed },
		{ "time", TCP_SERV, INVALID_SOCKET, TCPtimed },
		{ 0, 0, 0, 0 },
	};


#define WSVERS		MAKEWORD(2, 0)
#define	QLEN		   5
#define	LINELEN		 128

extern	u_short	portbase;	/* from passivesock()	*/

/*------------------------------------------------------------------------
 * main - Super-server main program
 *------------------------------------------------------------------------
 */
void
main(int argc, char *argv[])
{
	struct service	*psv;		/* service table pointer	*/
	fd_set		afds, rfds;	/* readable file descriptors	*/
	WSADATA		wsdata;

	switch (argc) {
	case 1:
		break;
	case 2:
		portbase = (u_short) atoi(argv[1]);
		break;
	default:
		errexit("usage: superd [portbase]\n");
	}
	if (WSAStartup(WSVERS, &wsdata))
		errexit("WSAStartup failed\n");

	FD_ZERO(&afds);
	for (psv = &svent[0]; psv->sv_name; ++psv) {
		if (psv->sv_useTCP)
			psv->sv_sock = passiveTCP(psv->sv_name, QLEN);
		else
			psv->sv_sock = passiveUDP(psv->sv_name);
		FD_SET(psv->sv_sock, &afds);
	}

	while (1) {
		memcpy(&rfds, &afds, sizeof(rfds));
		if (select(FD_SETSIZE, &rfds, (fd_set *)0, (fd_set *)0,
		    (struct timeval *)0) == SOCKET_ERROR)
			errexit("select error: %d\n", GetLastError());
		for (psv=&svent[0]; psv->sv_name; ++psv) {
			if (FD_ISSET(psv->sv_sock, &rfds)) {
				if (psv->sv_useTCP)
					doTCP(psv);
				else
					psv->sv_func(psv->sv_sock);
			}
		}
	}
}

/*------------------------------------------------------------------------
 * doTCP - handle a TCP service connection request
 *------------------------------------------------------------------------
 */
void
doTCP(struct service *psv)
{
	struct sockaddr_in fsin;	/* the request from address	*/
	int		alen;		/* from-address length		*/
	SOCKET		ssock;

	alen = sizeof(fsin);
	ssock = accept(psv->sv_sock, (struct sockaddr *)&fsin, &alen);
	if (ssock == INVALID_SOCKET)
		errexit("accept: %d\n", GetLastError());
	if (_beginthread((void (*)(void *))psv->sv_func, 0, (void *)ssock)
	    == (unsigned long) -1)
		errexit("_beginthread: %s\n", strerror(errno));
}


