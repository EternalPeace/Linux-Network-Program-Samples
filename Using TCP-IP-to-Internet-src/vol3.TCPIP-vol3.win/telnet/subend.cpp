/* subend.cpp - subend */

#include <stdio.h>
#include <winsock.h>

#include "tnfsm.h"

extern int		substate;

/*------------------------------------------------------------------------
 * subend - end of an option subnegotiation; reset FSM
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
subend(SOCKET sfd, FILE *tfp, int c)
{
	substate = SS_START;
	return 0;
}
