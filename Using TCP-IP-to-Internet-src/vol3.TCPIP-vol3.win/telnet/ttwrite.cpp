/* ttwrite.cpp - ttwrite */

#include <stdio.h>
#include <winsock.h>

#include "tnfsm.h"

extern struct fsm_trans	ttstab[];
extern u_char		ttfsm[][NCHRS];
extern int		ttstate;

/*------------------------------------------------------------------------
 * ttwrite - do output processing for (local) network virtual printer
 *------------------------------------------------------------------------
 */
void
ttwrite(SOCKET sfd, FILE *tfp, u_char *buf, int cc)
{
	struct fsm_trans	*pt;
	int			i, ti;

	for (i=0; i<cc; ++i) {
		int	c = buf[i];

		ti = ttfsm[ttstate][c];
		pt = &ttstab[ti];

		(pt->ft_action)(sfd, tfp, c);
		ttstate = pt->ft_next;
	}
}
