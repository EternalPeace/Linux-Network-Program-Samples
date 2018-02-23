/* TCPdaytime.c - TCPdaytime, main */

#include <stdio.h>
#include <tiuser.h>

extern int	errno ;
extern char	*sys_errlist[];

#define	LINELEN		128

/*------------------------------------------------------------------------
 * main - TCP client for DAYTIME service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*host = "localhost";	/* host to use if none supplied	*/
	char	*service = "daytime";	/* default service port		*/

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
		fprintf(stderr, "usage: TCPdaytime [host [port]]\n");
		exit(1);
	}
	TCPdaytime(host, service);
	exit(0);
}

/*------------------------------------------------------------------------
 * TCPdaytime - invoke Daytime on specified host and print results
 *------------------------------------------------------------------------
 */
TCPdaytime(host, service)
char	*host;
char	*service;
{
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	int	d, n;			/* TLI descriptor, read count	*/
	int	flags;

	d = clientTCP(host, service);

	while( (n = t_rcv(d, buf, LINELEN, &flags)) > 0) {
		buf[n] = '\0';		/* insure null-terminated	*/
		(void) fputs( buf, stdout );
		if (!(flags & T_MORE))
			break;
	}
}
