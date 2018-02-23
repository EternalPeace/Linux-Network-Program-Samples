/* ttwrite.c - ttwrite */

#include <sys/types.h>

#include <stdio.h>

#include "tnfsm.h"

extern struct fsm_trans	ttstab[];
extern u_char		ttfsm[][NCHRS];
extern int		ttstate;

/*------------------------------------------------------------------------
 * ttwrite - do output processing for (local) network virtual printer
 *------------------------------------------------------------------------
 */
int
ttwrite(rfp, tfp, buf, cc)
FILE	*rfp, *tfp;	/* remote and terminal FILE ptrs*/
u_char	*buf;		/* buffer of data to send	*/
int	cc;		/* # characters in buf		*/
{
	struct fsm_trans	*pt;
	int			i, ti;

	for (i=0; i<cc; ++i) {
		int	c = buf[i];

		ti = ttfsm[ttstate][c];
		pt = &ttstab[ti];

		(pt->ft_action)(rfp, tfp, c);
		ttstate = pt->ft_next;
	}
}
