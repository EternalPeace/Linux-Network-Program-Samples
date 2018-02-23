/* TCPtecho.c - main, TCPtecho, reader, writer, mstime */

#include <sys/param.h>
#include <sys/filio.h>

#include <poll.h>
#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

#define	MIN(x, y)	((x) < (y) ? (x) : (y))

#define	BUFSIZE		4096		/* write buffer size		*/
#define	CCOUNT		64*1024		/* default character count	*/

#define	USAGE	"usage: TCPtecho [ -c count ] host1 host2...\n"

char	*hname[NOFILE];			/* fd to host name mapping	*/
int	rc[NOFILE], wc[NOFILE];		/* read/write character counts	*/
char	buf[BUFSIZE];			/* read/write data buffer	*/
long	mstime();


/*------------------------------------------------------------------------
 * main - concurrent TCP client for ECHO service timing
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	int	ccount = CCOUNT;
	int	i, hcount, maxfd, fd;
	struct	pollfd	fds[NOFILE];
	int	one = 1;

	for (fd=0; fd<NOFILE; ++fd)
		fds[fd].fd = -1;

	hcount = 0;
	maxfd = -1;
	for (i=1; i<argc; ++i) {
		if (strcmp(argv[i], "-c") == 0) {
			if (++i < argc && (ccount = atoi(argv[i])))
				continue;
			errexit(USAGE);
		}
		/* else, a host */

		fd = clientTCP(argv[i], "echo");
		if (ioctl(fd, FIONBIO, (char *)&one))
			errexit("can't mark descriptor nonblocking: %s\n",
				sys_errlist[errno]);
		if (fd > maxfd)
			maxfd = fd;
		hname[fd] = argv[i];
		++hcount;
		fds[fd].fd = fd;
		fds[fd].events = POLLIN|POLLOUT;
	}
	TCPtecho(fds, maxfd+1, ccount, hcount);
	exit(0);
}

/*------------------------------------------------------------------------
 * TCPtecho - time TCP ECHO requests to multiple servers
 *------------------------------------------------------------------------
 */
int
TCPtecho(fds, nfds, ccount, hcount)
struct	pollfd	fds[];
int	nfds, ccount, hcount;
{
	int	fd, i;

	for (i=0; i<BUFSIZE; ++i)	/* echo data	*/
		buf[i] = 'D';
	for (fd=0; fd<nfds; ++fd)
		rc[fd] = wc[fd] = ccount;

	(void) mstime((long *)0);	/* set the epoch */

	while (hcount) {
		if (poll(fds, nfds, -1) < 0)
			errexit("poll failed: %s\n",sys_errlist[errno]);
		for (fd=0; fd<nfds; ++fd) {
			if (fds[fd].revents & POLLIN)
				if (reader(fd, fds) == 0)
					hcount--;
			if ((fds[fd].events & POLLOUT) &&
			    (fds[fd].revents & POLLOUT))
				writer(fd, fds);
		}
	}
}

/*------------------------------------------------------------------------
 * reader - handle ECHO reads
 *------------------------------------------------------------------------
 */
int
reader(fd, fds)
int		fd;
struct	pollfd	fds[];
{
	long	now;
	int	cc, flags;

	cc = t_rcv(fd, buf, sizeof(buf), &flags);
	if (cc < 0)
		if (t_errno == TSYSERR)
			errexit("t_rcv: %s\n", sys_errlist[errno]);
		else
			errexit("t_rcv: %s\n", t_errlist[t_errno]);
	if (cc == 0)
		errexit("t_rcv: premature end of file\n");
	rc[fd] -= cc;
	if (rc[fd])
		return 1;
	(void) mstime(&now);
	printf("%s: %d ms\n", hname[fd], now);
	(void) t_close(fd);
	fds[fd].fd = -1;
	return 0;
}

/*------------------------------------------------------------------------
 * writer - handle ECHO writes
 *------------------------------------------------------------------------
 */
int
writer(fd, fds)
int		fd;
struct	pollfd	fds[];
{
	int	cc;

	cc = t_snd(fd, buf, MIN(sizeof(buf), wc[fd]), 0);
	if (cc < 0)
		if (t_errno == TSYSERR)
			errexit("t_snd: %s\n", sys_errlist[errno]);
		else
			errexit("t_snd: %s\n", t_errlist[t_errno]);
	wc[fd] -= cc;
	if (wc[fd] == 0) {
		(void) t_sndrel(fd);
		fds[fd].events &= ~POLLOUT;
	}
}

/*------------------------------------------------------------------------
 * mstime - report the number of milliseconds since Jan 1, 1970
 *------------------------------------------------------------------------
 */
long
mstime(pms)
long	*pms;
{
	static struct timeval	epoch;
	struct timeval		now;

	if (gettimeofday(&now, (struct timezone *)0))
		errexit("gettimeofday: %s\n", sys_errlist[errno]);
	if (!pms) {
		epoch = now;
		return 0;
	}
	*pms = (now.tv_sec - epoch.tv_sec) * 1000;
	*pms += (now.tv_usec - epoch.tv_usec + 500)/ 1000;
	return *pms;
}
