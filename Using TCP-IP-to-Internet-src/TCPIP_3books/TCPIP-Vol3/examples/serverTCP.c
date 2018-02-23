/* serverTCP.c - serverTCP */

/*------------------------------------------------------------------------
 * serverTCP - create a server TLI descriptor for use with TCP
 *------------------------------------------------------------------------
 */
int
serverTCP( service, qlen )
char	*service;	/* service associated with the desired port	*/
int	qlen;		/* maximum server request queue length		*/
{
	return serverTLI(service, "tcp", qlen);
}
