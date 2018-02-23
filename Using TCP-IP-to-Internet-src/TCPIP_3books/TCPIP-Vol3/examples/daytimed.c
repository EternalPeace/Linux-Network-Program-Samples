/* daytimed.c - main */

#include <sys/time.h>
#include <netinet/in.h>

#include <poll.h>
#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

#define	NFDS		  2
#define	QLEN		  5

#define	LINELEN		128

/*------------------------------------------------------------------------
 * main - Iterative server for DAYTIME service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*service = "daytime";	/* service name or port number	*/
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	int	td; 			/* TCP master TLI descriptor	*/
	int	ud;			/* UDP descriptor		*/
	int	nfds;			/* max descriptor number	*/
	int	flags;
	struct pollfd		fds[NFDS];
	struct t_unitdata	*pud;	/* UDP unit data structure	*/

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: daytimed [port]\n");
	}
	td = serverTCP(service, QLEN);
	ud = serverUDP(service);

	fds[0].fd = td;
	fds[0].events = POLLIN;
	fds[1].fd = ud;
	fds[1].events = POLLIN;

	pud = (struct t_unitdata *) t_alloc(ud, T_UNITDATA,
		T_ADDR|T_UDATA);
	if (pud == 0)
		errexit("t_alloc failed: %s\n", t_errlist[t_errno]);

	while (1) {
		if (poll(fds, NFDS, -1) < 0)
			errexit("poll error: %s\n", sys_errlist[errno]);
		if (fds[0].revents & POLLIN) {
			int	sd;		/* TCP slave descriptor	*/

			sd = newconTCP(td);
			daytime(buf);
			(void) t_snd(sd, buf, strlen(buf), 0);
			(void) t_close(sd);
		}
		if (fds[1].revents & POLLIN) {
			if (t_rcvudata(ud, pud, &flags) < 0)
				errexit("t_rcvudata: %s\n",
					t_errlist[t_errno]);
			while ((flags & T_MORE) &&
					t_rcvudata(ud, pud, &flags) > 0)
				/* empty */;
			daytime(pud->udata.buf);
			pud->udata.len = strlen(pud->udata.buf);
			(void) t_sndudata(ud, pud);
		}
	}
}

/*------------------------------------------------------------------------
 * daytime - fill the given buffer with the time of day
 *------------------------------------------------------------------------
 */
int
daytime(buf)
char	buf[];
{
	char	*ctime();
	time_t	time(), now;

	(void) time(&now);
	sprintf(buf, "%s", ctime(&now));
}
