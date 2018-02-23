/* TCPdaytimed.c - main */

#include <sys/types.h>

#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

long	time();

#define QLEN	5

/*------------------------------------------------------------------------
 * main - Iterative TCP server for DAYTIME service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*service = "daytime";	/* service name or port number	*/
	int	d, ds;			/* master & slave descriptors	*/

	switch (argc) {
	case	1:
		break;
	case	2:
		service = argv[1];
		break;
	default:
		errexit("usage: TCPdaytimed [port]\n");
	}

	d = serverTCP(service, QLEN);

	while (1) {
		ds = newconTCP(d);
		(void) TCPdaytimed(ds);
		t_close(ds);
	}
}

/*------------------------------------------------------------------------
 * TCPdaytimed - do TCP DAYTIME protocol
 *------------------------------------------------------------------------
 */
int
TCPdaytimed(fd)
int	fd;
{
	char	*pts;			/* pointer to time string	*/
	time_t	now;			/* current time			*/
	char	*ctime();

	(void) time(&now);
	pts = ctime(&now);
	if (t_snd(fd, pts, strlen(pts), 0) < 0)
		errexit("t_snd: %s\n", t_errlist[t_errno]);
	return 0;
}
