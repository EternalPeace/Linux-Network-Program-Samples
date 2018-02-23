/* subfsm.cpp */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"
#include "tnfsm.h"

extern int	no_op(SOCKET, FILE *, int),
		subtermtype(SOCKET, FILE *, int),
		tnabort(SOCKET, FILE *, int);

struct fsm_trans substab[] = {
        /* State        Input           Next State      Action  */
        /* ------       ------          -----------     ------- */
	{ SS_START,	TOTERMTYPE,	SS_TERMTYPE,	no_op		},
	{ SS_START,	TCANY,		SS_END,		no_op		},

	{ SS_TERMTYPE,	TT_SEND,	SS_END,		subtermtype	},
	{ SS_TERMTYPE,	TCANY,		SS_END,		no_op		},

	{ SS_END,	TCANY,		SS_END,		no_op		},
	{ FSINVALID,	TCANY,		FSINVALID,	tnabort		},
};

int	substate;
u_char	subfsm[NSSTATES][NCHRS];
