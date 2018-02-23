/* UDPtime.c - main */

#include <sys/types.h>

#include <stdio.h>
#include <tiuser.h>

#define	BUFSIZE 64

#define	UNIXEPOCH	2208988800	/* UNIX epoch, in UCT secs	*/
#define	MSG		"what time is it?\n"

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

char	*ctime();
u_long	ntohl();

/*------------------------------------------------------------------------
 * main - UDP client for TIME service that prints the resulting time
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*host = "localhost";	/* host to use if none supplied	*/
	char	*service = "time";	/* default service name		*/
	time_t	now;			/* 32-bit integer to hold time	*/ 
	int	d, n;			/* TLI descriptor, read count	*/
	int	flags;
	struct t_unitdata	*pud;	/* returned t_unitdata struct	*/

	switch (argc) {
	case 1:
		host = "localhost";
		break;
	case 3:
		service = argv[2];
		/* FALL THROUGH */
	case 2:
		host = argv[1];
		break;
	default:
		fprintf(stderr, "usage: UDPtime [host [port]]\n");
		exit(1);
	}

	d = clientUDP(host, service, &pud);

	strcpy(pud->udata.buf, MSG);
	pud->udata.len = strlen(pud->udata.buf);
	if (t_sndudata(d, pud) < 0)
		errexit("t_sndudata: %s\n", t_errlist[t_errno]);

	/* Read the time */

	n = t_rcvudata(d, pud, &flags);
	if (n < 0)
		errexit("t_rcvudata: %s\n", t_errlist[t_errno]);

	now = *(long *)pud->udata.buf;
	now = ntohl((u_long)now);	/* put in host byte order	*/
	now -= UNIXEPOCH;		/* convert UCT to UNIX epoch	*/
	printf("%s", ctime(&now));
	exit(0);
}
