/* TCPechod.c - main, TCPechod */

#include <sys/types.h>
#include <sys/signal.h>

#include <stdio.h>

#define	QLEN		   5	/* maximum connection queue length	*/
#define	BUFSIZE		4096

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

/*------------------------------------------------------------------------
 * main - Concurrent TCP server for ECHO service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*service = "echo";	/* service name or port number	*/
	int	md, sd;			/* master & slave descriptors	*/

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPechod [port]\n");
	}

	md = serverTCP(service, QLEN);

	(void) signal(SIGCHLD, SIG_IGN);

	while (1) {
		sd = newconTCP(md);
		switch (fork()) {
		case 0:		/* child */
			(void) t_close(md);
			exit(TCPechod(sd));
		default:	/* parent */
			(void) t_close(sd);
			break;
		case -1:
			errexit("fork: %s\n", sys_errlist[errno]);
		}
	}
}

/*------------------------------------------------------------------------
 * TCPechod - echo data until end of file
 *------------------------------------------------------------------------
 */
int
TCPechod(fd)
int	fd;
{
	char	buf[BUFSIZ];
	int	cc, flags;

	while ((cc = t_rcv(fd, buf, sizeof buf, &flags)) > 0) {
		if (t_snd(fd, buf, cc, 0) < 0)
			errexit("echo t_snd: %s\n", t_errlist[t_errno]);
	}
	if (cc < 0)
		errexit("echo t_rcv: %s\n", t_errlist[t_errno]);
	return 0;
}
