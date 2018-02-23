/* UDPtimed.c - main */

#include <sys/types.h>
#include <netinet/in.h>

#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

time_t	time();

#define	UNIXEPOCH	2208988800	/* UNIX epoch, in UCT secs	*/

/*------------------------------------------------------------------------
 * main - Iterative UDP server for TIME service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*service = "time";	/* service name or port number	*/
	int	d;			/* server TLI descriptor	*/
	time_t	now;			/* current time			*/
	int	flags;
	struct t_unitdata	*pud;

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: UDPtimed [port]\n");
	}

	d = serverUDP(service);

	pud = (struct t_unitdata *) t_alloc(d, T_UNITDATA,
			T_ADDR|T_UDATA);
	if (pud == 0)
		errexit("t_alloc failed: %s\n", t_errlist[t_errno]);

	while (1) {
		if (t_rcvudata(d, pud, &flags) < 0)
			errexit("t_rcvudata: %s\n", t_errlist[t_errno]);
		while ((flags & T_MORE) && t_rcvudata(d, pud, &flags) > 0)
			/* empty */;

		(void) time(&now);
		now = htonl((u_long)(now + UNIXEPOCH));

		pud->udata.len = sizeof(now);
		*(long *)pud->udata.buf = now;

		(void) t_sndudata(d, pud);
	}
}
