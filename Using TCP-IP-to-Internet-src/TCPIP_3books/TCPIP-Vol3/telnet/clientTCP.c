/* clientTCP.c - clientTCP */

#include <sys/types.h>
#include <netinet/in.h>

#include <tiuser.h>

extern int	t_errno;
extern char	*t_errlist[];


/*------------------------------------------------------------------------
 * clientTCP - connect to a specified TCP service on a specified host
 *------------------------------------------------------------------------
 */
int
clientTCP(host, service)
char	*host;		/* name of host to which connection is desired	*/
char	*service;	/* service associated with the desired port	*/
{
	struct sockaddr_in	sin;
	struct t_call		*pcall;
	int		d;

	d = clientTLI(host, service, "tcp", &sin);

    /* Allocate and initialize send call structure */
        pcall = (struct t_call *) t_alloc(d, T_CALL, T_ADDR);
        if (pcall == 0)
                errexit("t_alloc failed: %s\n", t_errlist[t_errno]);

	bcopy(&sin, pcall->addr.buf, sizeof(sin));
	pcall->addr.len = sizeof(sin);

	if (t_connect(d, pcall, 0) < 0)
		errexit("can't connect: %s\n", t_errlist[t_errno]);
	t_free((char *)pcall, T_CALL);
	return d;
}
