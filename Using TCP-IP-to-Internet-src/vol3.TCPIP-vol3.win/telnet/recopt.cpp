/* recopt.cpp - recopt, no_op */

#include <stdio.h>
#include <winsock.h>

u_char	option_cmd;	/* has value WILL, WONT, DO, or DONT		*/

/*------------------------------------------------------------------------
 * recopt - record option type
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
recopt(SOCKET sfd, FILE *tfp, int c)
{
	option_cmd = c;
	return 0;
}

/*------------------------------------------------------------------------
 * no_op - do nothing
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
no_op(SOCKET sfd, FILE *tfp, int c)
{
	return 0;
}
