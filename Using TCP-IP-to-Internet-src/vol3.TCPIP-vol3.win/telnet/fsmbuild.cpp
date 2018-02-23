/* fsmbuild.cpp - fsmbuild */

#include <stdio.h>
#include <winsock.h>

#include "tnfsm.h"

extern struct fsm_trans	ttstab[], sostab[], substab[];
extern u_char		ttfsm[][NCHRS], sofsm[][NCHRS], subfsm[][NCHRS];
extern int		ttstate, sostate, substate;

void fsminit(u_char fsm[][NCHRS], struct fsm_trans ttab[], int nstates);

/*------------------------------------------------------------------------
 * fsmbuild - build the Finite State Machine data structures
 *------------------------------------------------------------------------
 */
void
fsmbuild()
{
	fsminit(ttfsm, ttstab, NTSTATES);
	ttstate = TSDATA;

	fsminit(sofsm, sostab, NKSTATES);
	sostate = KSREMOTE;

	fsminit(subfsm, substab, NSSTATES);
	substate = SS_START;
}
