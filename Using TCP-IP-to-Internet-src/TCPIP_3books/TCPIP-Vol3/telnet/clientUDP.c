/* clientUDP.c - clientUDP */

#include <sys/types.h>
#include <netinet/in.h>

#include <tiuser.h>

extern int	t_errno;
extern char	*t_errlist[];

/*------------------------------------------------------------------------
 * clientUDP - set up call to a specified UDP service on a specified host
 *------------------------------------------------------------------------
 */
int
clientUDP( host, service, ppud )
char	*host;		/* name of host to which connection is desired	*/
char	*service;	/* service associated with the desired port	*/
struct t_unitdata	**ppud;
{
	struct sockaddr_in	sin;
	struct t_unitdata	*pud;
	int			d;

	d = clientTLI(host, service, "udp", &sin);

    /* Allocate and initialize unit data structure */
        pud = (struct t_unitdata *) t_alloc(d, T_UNITDATA,T_ADDR|T_UDATA);
        if (pud == 0)
                errexit("t_alloc failed: %s\n", t_errlist[t_errno]);

	bcopy(&sin, pud->addr.buf, sizeof(sin));
        pud->addr.len = sizeof(sin);

	*ppud = pud;
	return d;
}
