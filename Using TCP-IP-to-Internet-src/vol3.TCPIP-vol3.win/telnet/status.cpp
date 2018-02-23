/* status.cpp - status */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"

extern	char	*host, scrname[];
extern	FILE	*scrfp;

/*------------------------------------------------------------------------
 * status - print connection status information
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
status(SOCKET sfd, FILE *tfp, int c)
{
	struct	sockaddr_in	sin;
	int			sinlen;

	fprintf(tfp, "\nconnected to \"%s\" ", host);

	sinlen = sizeof(sin);
	if (getsockname(sfd, (struct sockaddr *)&sin,
			&sinlen) == 0)
		fprintf(tfp, "local port %d ", ntohs(sin.sin_port));
	sinlen = sizeof(sin);
	if (getpeername(sfd, (struct sockaddr *)&sin,
			&sinlen) == 0)
		fprintf(tfp, "remote port %d ", ntohs(sin.sin_port));
	(void) putc('\n', tfp);
	if (doecho || sndbinary || rcvbinary) {
		printf("options in effect: ");
		if (doecho)
			fprintf(tfp, "remote_echo ");
		if (sndbinary)
			fprintf(tfp, "send_binary ");
		if (rcvbinary)
			fprintf(tfp, "receive_binary ");
		(void) putc('\n', tfp);
	}
	if (scrfp)
		fprintf(tfp, "scripting to file \"%s\"\n", scrname);
	return 0;
}
