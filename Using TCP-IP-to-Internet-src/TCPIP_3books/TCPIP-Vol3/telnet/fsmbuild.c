/* ttinit.c - ttinit */

#include <sys/types.h>

#include <stdio.h>

#include "tnfsm.h"

extern struct fsm_trans	ttstab[], testab[], substab[];
extern u_char		ttfsm[][NCHRS], tefsm[][NCHRS], subfsm[][NCHRS];
extern int		ttstate, testate, substate;

/*------------------------------------------------------------------------
 * fsmbuild - build the Finite State Machine data structures
 *------------------------------------------------------------------------
 */
int
fsmbuild()
{
	fsminit(ttfsm, ttstab, NTSTATES);
	ttstate = TSDATA;

	fsminit(tefsm, testab, NKSTATES);
	testate = KSREMOTE;

	fsminit(subfsm, substab, NSSTATES);
	substate = SS_START;
}
