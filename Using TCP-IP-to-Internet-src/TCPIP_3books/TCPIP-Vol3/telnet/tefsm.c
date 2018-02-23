/* tefsm.c */

#include <sys/types.h>

#include <stdio.h>

#include "telnet.h"
#include "tnfsm.h"

/* Special chars: */
char	t_flushc, t_intrc, t_quitc, sg_erase, sg_kill;

extern int	teputc(), scrinit(), scrgetc(), scrwrap(), unscript(),
		dcon(), suspend(), status(), tenotsup(), abort(),
		no_op();

struct fsm_trans testab[] = {
        /* State        Input           Next State      Action  */
        /* ------       ------          -----------     ------- */
/* Data Input */
	{ KSREMOTE,	KCESCAPE,	KSLOCAL,	no_op		},
	{ KSREMOTE,	KCANY,		KSREMOTE,	teputc		},
/* Local Escape Commands */
	{ KSLOCAL,	KCSCRIPT,	KSCOLLECT,	scrinit		},
	{ KSLOCAL,	KCUNSCRIPT,	KSREMOTE,	unscript	},
	{ KSLOCAL,	KCESCAPE,	KSREMOTE,	teputc		},
	{ KSLOCAL,	KCDCON,		KSREMOTE,	dcon		},
	{ KSLOCAL,	KCSUSP,		KSREMOTE,	suspend		},
	{ KSLOCAL,	KCSTATUS,	KSREMOTE,	status		},
	{ KSLOCAL,	KCANY,		KSREMOTE,	tenotsup	},
/* Script Filename Gathering */
	{ KSCOLLECT,	KCNL,		KSREMOTE,	scrwrap		},
	{ KSCOLLECT,	KCANY,		KSCOLLECT,	scrgetc		},

	{ FSINVALID,	KCANY,		FSINVALID,	abort		},
};

#define	NTRANS	(sizeof(testab)/sizeof(testab[0]))

int	testate;
u_char	tefsm[NKSTATES][NCHRS];
