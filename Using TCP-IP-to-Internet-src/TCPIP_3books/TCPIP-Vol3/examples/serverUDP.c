/* serverUDP.c - serverUDP */

/*------------------------------------------------------------------------
 * serverUDP - create a server TLI descriptor for use with UDP
 *------------------------------------------------------------------------
 */
int
serverUDP( service )
char	*service;	/* service associated with the desired port	*/
{
	return serverTLI(service, "udp", 0);
}
