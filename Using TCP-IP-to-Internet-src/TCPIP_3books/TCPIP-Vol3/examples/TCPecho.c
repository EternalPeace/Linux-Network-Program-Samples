/* TCPecho.c - main, TCPecho */

#include <stdio.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

#define	LINELEN		128

/*------------------------------------------------------------------------
 * main - TCP client for ECHO service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*host = "localhost";	/* host to use if none supplied	*/
	char	*service = "echo";	/* default service name		*/

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
		fprintf(stderr, "usage: TCPecho [host [port]]\n");
		exit(1);
	}
	TCPecho(host, service);
	exit(0);
}

/*------------------------------------------------------------------------
 * TCPecho - send input to ECHO service on specified host and print reply
 *------------------------------------------------------------------------
 */
int
TCPecho(host, service)
char	*host;
char	*service;
{
	char	buf[LINELEN+1];		/* buffer for one line of text	*/
	int	d, n;			/* TLI descriptor, read count	*/
	int	outchars, inchars;	/* characters sent and received	*/
	int	flags;

	d = clientTCP(host, service);

	while (fgets(buf, sizeof(buf), stdin)) {
		outchars = strlen(buf);
		(void) t_snd(d, buf, outchars, 0);

		/* read it back */
		for (inchars = 0; inchars < outchars; inchars+=n ) {
			n = t_rcv(d, &buf[inchars], outchars - inchars,
				&flags);
			if (n < 0)
				errexit("TLI receive failed: %s\n",
					t_errlist[t_errno]);
		}
		buf[outchars] = '\0';	/* ensure null-terminated	*/
		fputs(buf, stdout);
	}
}
