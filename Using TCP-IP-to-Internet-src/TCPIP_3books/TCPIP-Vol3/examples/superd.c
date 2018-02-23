/* superd.c - main */

#include <sys/param.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/errno.h>
#include <sys/signal.h>

#include <poll.h>
#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

#define	UDP_SERV	0
#define	TCP_SERV	1

#define	NODESC		-1	/* an invalid TLI descriptor	*/

int	TCPechod(), TCPchargend(), TCPdaytimed(), TCPtimed();

struct service {
	char	*sv_name;
	char	sv_useTCP;
	int	sv_desc;
	int	(*sv_func)();
} svent[] = {	{ "echo", TCP_SERV, NODESC, TCPechod },
		{ "chargen", TCP_SERV, NODESC, TCPchargend },
		{ "daytime", TCP_SERV, NODESC, TCPdaytimed },
		{ "time", TCP_SERV, NODESC, TCPtimed },
		{ 0, 0, 0, 0 },
	};

#ifndef	MAX
#define	MAX(x, y)	((x) > (y) ? (x) : (y))
#endif	/* MAX */

#define	QLEN		  5

#define	LINELEN		128

extern	u_short	portbase;	/* from serverTLI()	*/

/*------------------------------------------------------------------------
 * main - Super-server main program
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	struct service	*psv,		/* service table pointer	*/
		*fd2sv[NOFILE];		/* map fd to service pointer	*/
	struct pollfd	fds[NOFILE];
	int		i, nfds;

	switch (argc) {
	case 1:
		break;
	case 2:
		portbase = (u_short) atoi(argv[1]);
		break;
	default:
		errexit("usage: superd [portbase]\n");
	}

	for (i=0; i<NOFILE; ++i)
		fds[i].fd = -1;
	nfds = 0;
	for (psv = &svent[0]; psv->sv_name; ++psv) {
		if (psv->sv_useTCP)
			psv->sv_desc = serverTCP(psv->sv_name, QLEN);
		else
			psv->sv_desc = serverUDP(psv->sv_name);
		fd2sv[psv->sv_desc] = psv;
		fds[nfds].fd = psv->sv_desc;
		fds[nfds].events = POLLIN;
		nfds++;
	}
	(void) signal(SIGCHLD, SIG_IGN);

	while (1) {
		if (poll(fds, NOFILE, -1) < 0) {
			if (errno == EINTR)
				continue;
			errexit("poll error: %s\n", sys_errlist[errno]);
		}
		for (i=0; i<nfds; ++i)
			if (fds[i].revents & POLLIN) {
				psv = fd2sv[fds[i].fd];
				if (psv->sv_useTCP)
					doTCP(psv);
				else
					psv->sv_func(psv->sv_desc);
			}
	}
}

/*------------------------------------------------------------------------
 * doTCP - handle a TCP service connection request
 *------------------------------------------------------------------------
 */
int
doTCP(psv)
struct service	*psv;
{
	int	fd, sdesc;

	sdesc = newconTCP(psv->sv_desc);

	switch (fork()) {
	case 0:	
		break;
	case -1:
		errexit("fork: %s\n", sys_errlist[errno]);
	default:
		(void) t_close(sdesc);
		return;		/* parent */
	}
	/* child */

	for (fd = NOFILE; fd >= 0; --fd)
		if (fd != sdesc)
			(void) t_close(fd);
	exit(psv->sv_func(sdesc));
}
