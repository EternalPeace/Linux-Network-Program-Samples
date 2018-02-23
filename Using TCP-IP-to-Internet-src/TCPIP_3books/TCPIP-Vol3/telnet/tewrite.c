/* tewrite.c - tewrite */

#include <sys/types.h>

#include <stdio.h>

#include "tnfsm.h"

extern struct fsm_trans	testab[];
extern int		testate;
extern u_char		tefsm[][NCHRS];

/*------------------------------------------------------------------------
 * tewrite - do output processing to the TLI descriptor
 *------------------------------------------------------------------------
 */
int
tewrite(rfp, tfp, buf, cc)
FILE	*rfp, *tfp;	/* remote and terminal FILE pointers	*/
u_char	*buf;		/* buffer of data to send		*/
int	cc;		/* # characters in buf			*/
{
	struct fsm_trans	*pt;
	int			i, ki;

	for (i=0; i<cc; ++i) {
		int	c = buf[i];

		ki = tefsm[testate][c];
		pt = &testab[ki];

		if ((pt->ft_action)(rfp, tfp, c) < 0)
			testate = KSREMOTE;	/* an error occurred	*/
		else
			testate = pt->ft_next;
	}
}
