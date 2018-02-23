/* recopt.c - recopt, no_op */

#include <sys/types.h>

#include <stdio.h>

u_char	option_cmd;	/* has value WILL, WONT, DO, or DONT		*/

/*------------------------------------------------------------------------
 * recopt - record option type
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
recopt(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
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
no_op(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	return 0;
}
