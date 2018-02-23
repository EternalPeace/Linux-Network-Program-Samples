/* fsminit.cpp - fsminit */

#include <stdio.h>
#include <winsock.h>

#include "tnfsm.h"

#define	TINVALID	0xff	/* an invalid transition index		*/

/*------------------------------------------------------------------------
 * fsminit - Finite State Machine initializer
 *------------------------------------------------------------------------
 */
void
fsminit(u_char fsm[][NCHRS], struct fsm_trans ttab[], int nstates)
{
	struct fsm_trans	*pt;
	int			sn, ti, cn;

	for (cn=0; cn<NCHRS; ++cn)
		for (ti=0; ti<nstates; ++ti)
			fsm[ti][cn] = TINVALID;

	for (ti=0; ttab[ti].ft_state != FSINVALID; ++ti) {
		pt = &ttab[ti];
		sn = pt->ft_state;
		if (pt->ft_char == TCANY) {
			for (cn=0; cn<NCHRS; ++cn)
				if (fsm[sn][cn] == TINVALID)
					fsm[sn][cn] = ti;
		} else
			fsm[sn][pt->ft_char] = ti;
	}
	/* set all uninitialized indices to an invalid transition	*/
	for (cn=0; cn<NCHRS; ++cn)
		for (ti=0; ti<nstates; ++ti)
			if (fsm[ti][cn] == TINVALID)
				fsm[ti][cn] = ti;
}
