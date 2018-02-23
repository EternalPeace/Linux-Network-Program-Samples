/* serverTLI.c - serverTLI */

#include <sys/types.h>
#include <sys/fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <netdb.h>
#include <tiuser.h>

extern int	errno, t_errno;
extern char	*sys_errlist[], *t_errlist[];

u_short	portbase = 0;		/* port base, for non-root servers	*/

/*------------------------------------------------------------------------
 * serverTLI - allocate & bind a server TLI descriptor using TCP or UDP
 *------------------------------------------------------------------------
 */
int
serverTLI( service, protocol, qlen )
char	*service;	/* service associated with the desired port	*/
char	*protocol;	/* name of protocol to use ("tcp" or "udp")	*/
int	qlen;		/* maximum length of the server request queue	*/
{
	struct servent	*pse;	/* pointer to service information entry	*/
	struct sockaddr_in sin, rsin;	/* requested & assigned addrs.	*/
	char	*pdevname;	/* device name for the given protocol	*/
	struct t_bind	*pbrq, *pbrt;	/* req. and return bind structs */
	int	d;		/* TLI descriptor			*/

	bzero((char *)&sin, sizeof(sin));
	sin.sin_family = AF_INET;
	sin.sin_addr.s_addr = INADDR_ANY;

    /* Map service name to port number */
	if ( pse = getservbyname(service, protocol) )
		sin.sin_port = htons(ntohs((u_short)pse->s_port)
			+ portbase);
	else if ( (sin.sin_port = htons((u_short)atoi(service))) == 0 )
		errexit("can't get \"%s\" service entry\n", service);

    /* Use protocol to choose a TLI device */
	if (strcmp(protocol, "udp") == 0)
		pdevname = "/dev/udp";
	else
		pdevname = "/dev/tcp";

    /* Open the device */
	d = t_open(pdevname, O_RDWR, 0);
	if (d < 0)
		errexit("can't open device: %s\n", t_errlist[t_errno]);

	pbrq = (struct t_bind *) t_alloc(d, T_BIND, T_ADDR);
	if (pbrq == 0)
		errexit("t_alloc failed: %s\n", t_errlist[t_errno]);
	pbrt = (struct t_bind *) t_alloc(d, T_BIND, T_ADDR);
	if (pbrt == 0)
		errexit("t_alloc failed: %s\n", t_errlist[t_errno]);
	bcopy(&sin, pbrq->addr.buf, sizeof(sin));
	pbrq->addr.len = sizeof(sin);
	pbrq->qlen = qlen;

    /* Bind the TLI descriptor */
	if (t_bind(d, pbrq, pbrt) < 0)
		errexit("t_bind to %s port: %s\n", service,
			t_errlist[t_errno]);
	bcopy(pbrt->addr.buf, &rsin, sizeof(rsin));

	t_free((char *)pbrq, T_BIND);
	t_free((char *)pbrt, T_BIND);

	if (sin.sin_port != rsin.sin_port)
		errexit("can't assign request address\n");
	return d;
}
