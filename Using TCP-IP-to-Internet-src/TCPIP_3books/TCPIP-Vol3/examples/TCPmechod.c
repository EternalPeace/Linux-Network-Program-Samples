/* TCPmechod.c - main, echo */

#include <sys/param.h>

#include <poll.h>
#include <stdio.h>
#include <tiuser.h>

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
	int	mdesc;			/* master server TLI descriptor	*/
	struct	pollfd	fds[NOFILE];
	int	alen;			/* from-address length		*/
	int	fd;
	
	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPmechod [port]\n");
	}

	mdesc = serverTCP(service, QLEN);

	for (fd=0; fd<NOFILE; ++fd)
		fds[fd].fd = -1;

	fds[mdesc].events = POLLIN;
	fds[mdesc].fd = mdesc;

	while (1) {
		if (poll(fds, NOFILE, -1) < 0)
			errexit("poll: %s\n", sys_errlist[errno]);
		if (fds[mdesc].revents) {
			int	sdesc;

			sdesc = newconTCP(mdesc);
			fds[sdesc].events = POLLIN;
			fds[sdesc].fd = sdesc;
		}
		for (fd=0; fd<NOFILE; ++fd)
			if (fd != mdesc && fds[fd].revents)
				if (echo(fd) == 0) {
					(void) t_close(fd);
					fds[fd].events = 0;
					fds[fd].fd = -1;
				}
	}
}

/*------------------------------------------------------------------------
 * echo - echo one buffer of data, returning byte count
 *------------------------------------------------------------------------
 */
int
echo(fd)
int	fd;
{
	char	buf[BUFSIZ];
	int	cc, flags;

	cc = t_rcv(fd, buf, sizeof buf, &flags);
	if (cc < 0)
		if (t_errno == TLOOK) {
			(void) t_rcvrel(fd);
			return 0;
		} else
			errexit("echo t_rcv: %s\n", t_errlist[t_errno]);
	if (cc && t_snd(fd, buf, cc, 0) < 0)
		errexit("echo t_snd: %s\n", t_errlist[t_errno]);
	return cc;
}
