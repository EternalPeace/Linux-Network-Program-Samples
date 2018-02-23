/* clientTLI.c - clientTLI */

#include <sys/types.h>
#include <sys/fcntl.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <netdb.h>
#include <tiuser.h>

#ifndef	INADDR_NONE
#define	INADDR_NONE	0xffffffff
#endif	/* INADDR_NONE */

extern int	errno;
extern char	*sys_errlist[];

extern int	t_errno;
extern char	*t_errlist[];

u_long	inet_addr();

/*------------------------------------------------------------------------
 * clientTLI - allocate & connect a TLI descriptor using TCP or UDP
 *------------------------------------------------------------------------
 */
int
clientTLI( host, service, protocol, psin )
char	*host;		/* name of host to which connection is desired	*/
char	*service;	/* service associated with the desired port	*/
char	*protocol;	/* name of protocol to use ("tcp" or "udp")	*/
struct sockaddr_in	*psin;	/* remote server's address		*/
{
	struct hostent	*phe;	/* pointer to host information entry	*/
	struct servent	*pse;	/* pointer to service information entry	*/
	char		*pdevname;
	int		d;	/* TLI descriptor			*/


	bzero((char *)psin, sizeof(struct sockaddr_in));
	psin->sin_family = AF_INET;

    /* Map service name to port number */
	if ( pse = getservbyname(service, protocol) )
		psin->sin_port = pse->s_port;
	else if ( (psin->sin_port = htons((u_short)atoi(service))) == 0 )
		errexit("can't get \"%s\" service entry\n", service);

    /* Map host name to IP address, allowing for dotted decimal */
	if ( phe = gethostbyname(host) )
		bcopy(phe->h_addr,(char *)&psin->sin_addr,phe->h_length);
	else if ((psin->sin_addr.s_addr = inet_addr(host)) == INADDR_NONE)
		errexit("can't get \"%s\" host entry\n", host);

    /* Use protocol to choose a TLI device */
	if (strcmp(protocol, "udp") == 0)
		pdevname = "/dev/udp";
	else if (strcmp(protocol, "tcp") == 0)
		pdevname = "/dev/tcp";
	else
		errexit("unsupported protocol \"%s\"\n", protocol);

    /* Open the device */
	d = t_open(pdevname, O_RDWR, 0);
	if (d < 0)
		errexit("can't open device \"%s\": %s\n", pdevname,
			sys_errlist[errno]);

	if (t_bind(d, 0, 0) < 0)
		errexit("can't get local address: %s\n", t_errlist[t_errno]);

	return d;
}
