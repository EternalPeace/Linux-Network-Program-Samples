/* telnet.c - telnet */

#include <sys/param.h>
#include <sys/time.h>
#include <sys/signal.h>
#include <sys/resource.h>
#include <sys/errno.h>

#include <poll.h>
#include <termios.h>
#include <stdio.h>

#include "local.h"

int	rcvurg();

extern int	errno;
extern char	*sys_errlist[];

#define	NFDS		   2	/* number of fd's (for poll)	*/

#define	BUFSIZE		2048	/* read buffer size		*/

struct termios	oldtty;

/*------------------------------------------------------------------------
 * telnet - do the TELNET protocol to the given host and port
 *------------------------------------------------------------------------
 */
int
telnet(host, service)
char	*host;
char	*service;
{
	int	d, nfds;	/* TLI descriptor & # file descriptors	*/
	FILE	*rfp;		/* buffered FILE pointer for remote	*/
	struct	rlimit	rlm;	/* to get max file descriptor number	*/
	struct	pollfd	fds[NFDS];
	u_char	buf[BUFSIZE];
	int	cc;
	int	on = 1;

	d = clientTCP(host, service);
	rwaddTLI(d);

	rfp = fdopen(d, "w");	/* for buffered remote output	*/

	ttysetup();

	fsmbuild();	/* set up FSM's */

	(void) signal(SIGURG, rcvurg);

	if (getrlimit(RLIMIT_NOFILE, &rlm) < 0)
		nfds = NOFILE;
	nfds = rlm.rlim_cur;

	fds[0].fd = 0;		/* standard input		*/
	fds[0].events = POLLIN;
	fds[1].fd = d;		/* the TLI descriptor		*/
	fds[1].events = POLLIN;

	while (1) {
		if (poll(fds, NFDS, -1) < 0) {
			if (errno == EINTR)
				continue;	/* just a signal	*/
			cerrexit("poll: %s\n", sys_errlist[errno]);
		}
		if (fds[1].revents & POLLIN) {	/* TLI desc	*/
			cc = read(d, (char *)buf, sizeof(buf));
			if (cc < 0)
				cerrexit("TLI read: %s\n",
						sys_errlist[errno]);
			else if (cc == 0) {
				printf("\nconnection closed.\n");
				if (tcsetattr(0, TCSADRAIN, &oldtty) < 0)
					errexit("tcsetattr: %s\n",
						sys_errlist[errno]);
				exit(0);
			} else
				ttwrite(rfp, stdout, buf, cc);
		}
		if (fds[0].revents & POLLIN) {	/* stdin desc	*/
			cc = read(0, (char *)buf, sizeof(buf));
			if (cc < 0)
				cerrexit("tty read: %s\n",
						sys_errlist[errno]);
			else if (cc == 0) {
				fds[0].fd = -1;
				(void) t_sndrel(d);
			} else
				tewrite(rfp, stdout, buf, cc);
		}
		(void) fflush(stdout);
		(void) fflush(rfp);
	}
}
