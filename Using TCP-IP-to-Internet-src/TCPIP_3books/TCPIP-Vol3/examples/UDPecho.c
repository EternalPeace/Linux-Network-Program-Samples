/* UDPecho.c - main, UDPecho */

#include <stdio.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

/*------------------------------------------------------------------------
 * main - UDP client for ECHO service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*host = "localhost";
	char	*service = "echo";

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
		fprintf(stderr, "usage: UDPecho [host [port]]\n");
		exit(1);
	}
	UDPecho(host, service);
	exit(0);
}

/*------------------------------------------------------------------------
 * UDPecho - send input to ECHO service on specified host and print reply
 *------------------------------------------------------------------------
 */
int
UDPecho(host, service)
char	*host;
char	*service;
{
	int	d, cc;			/* descriptor, character count	*/
	struct t_unitdata	*pud;
	int	flags;

	d = clientUDP(host, service, &pud);

	while (fgets(pud->udata.buf, pud->udata.maxlen, stdin)) {
		pud->udata.len = strlen(pud->udata.buf);
		if (t_sndudata(d, pud) < 0)
			errexit("t_sndudata: %s\n", t_errlist[t_errno]);

		cc = t_rcvudata(d, pud, &flags);
		if (cc < 0)
			errexit("TLI receive failed: %s\n",
					t_errlist[t_errno]);
		if (pud->udata.len == pud->udata.maxlen)
			--pud->udata.len;
		pud->udata.buf[pud->udata.len] = '\0';
		fputs(pud->udata.buf, stdout);
	}
}
