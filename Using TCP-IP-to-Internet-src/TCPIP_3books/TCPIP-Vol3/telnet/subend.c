/* subend.c - subend */

#include <sys/types.h>

#include <stdio.h>

#include "tnfsm.h"

extern int		substate;

/*------------------------------------------------------------------------
 * subend - end of an option subnegotiation; reset FSM
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
subend(sfp, tfp, c)
FILE	*sfp, *tfp;
int	c;
{
	substate = SS_START;
	return 0;
}
