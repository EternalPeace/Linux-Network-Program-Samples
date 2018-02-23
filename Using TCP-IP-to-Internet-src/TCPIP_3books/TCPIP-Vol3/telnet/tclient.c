/* tclient.c - main */

char	*host = "localhost";	/* host to use if none supplied		*/

/*------------------------------------------------------------------------
 * main - TCP client for TELNET service
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	*service = "telnet";	/* default service name		*/

	switch (argc) {
	case 1:	break;
	case 3:
		service = argv[2];
		/* FALL THROUGH */
	case 2:
		host = argv[1];
		break;
	default:
		errexit("usage: telnet [host [port]]\n");
	}
	telnet(host, service);
	exit(0);
}

