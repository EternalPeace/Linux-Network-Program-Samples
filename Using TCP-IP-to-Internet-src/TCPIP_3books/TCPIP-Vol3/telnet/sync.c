/* sync.c - tcdm, rcvurg */

#include <stdio.h>

char	synching;	/* non-zero, if we are doing TELNET SYNCH	*/

/*------------------------------------------------------------------------
 * tcdm - handle the TELNET DATA MARK command (marks end of SYNCH)
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
tcdm(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	synching = 0;
	return 0;
}

/*------------------------------------------------------------------------
 * rcvurg - receive urgent data input (indicates a TELNET SYNCH)
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
rcvurg()
{
	synching++;
}
