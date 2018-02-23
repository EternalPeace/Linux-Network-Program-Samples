/* sowrite.cpp - sowrite */

#include <stdio.h>
#include <winsock.h>

#include "tnfsm.h"

extern struct fsm_trans	sostab[];
extern int		sostate;
extern u_char		sofsm[][NCHRS];

/*------------------------------------------------------------------------
 * sowrite - do output processing to the socket
 *------------------------------------------------------------------------
 */
void
sowrite(SOCKET sfd, FILE *tfp, u_char *buf, int cc)
{
	struct fsm_trans	*pt;
	int			i, ki;

	for (i=0; i<cc; ++i) {
		int	c = buf[i];

		ki = sofsm[sostate][c];
		pt = &sostab[ki];

		if ((pt->ft_action)(sfd, tfp, c) < 0)
			sostate = KSREMOTE;	/* an error occurred	*/
		else
			sostate = pt->ft_next;
	}
}
