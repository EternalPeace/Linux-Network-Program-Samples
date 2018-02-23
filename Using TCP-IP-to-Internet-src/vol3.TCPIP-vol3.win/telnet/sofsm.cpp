/* sofsm.cpp */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"
#include "tnfsm.h"

/* Special chars: */
char	t_flushc = '\017';	/* ^O */
char	t_intrc  = '\003';	/* ^C */
char	t_quitc  = '\034';	/* ^\ */
char	sg_erase = '\010';	/* ^H */
char	sg_kill  = '\030';	/* ^X */

extern int	soputc(SOCKET, FILE *, int), scrinit(SOCKET, FILE *, int),
		scrgetc(SOCKET, FILE *, int),scrwrap(SOCKET, FILE *, int),
		unscript(SOCKET, FILE *, int), dcon(SOCKET, FILE *, int),
		status(SOCKET, FILE *, int),sonotsup(SOCKET, FILE *, int),
		no_op(SOCKET, FILE *, int), tnabort(SOCKET, FILE *, int);

struct fsm_trans sostab[] = {
        /* State        Input           Next State      Action  */
        /* ------       ------          -----------     ------- */
/* Data Input */
	{ KSREMOTE,	KCESCAPE,	KSLOCAL,	no_op		},
	{ KSREMOTE,	KCANY,		KSREMOTE,	soputc		},
/* Local Escape Commands */
	{ KSLOCAL,	KCSCRIPT,	KSCOLLECT,	scrinit		},
	{ KSLOCAL,	KCUNSCRIPT,	KSREMOTE,	unscript	},
	{ KSLOCAL,	KCESCAPE,	KSREMOTE,	soputc		},
	{ KSLOCAL,	KCDCON,		KSREMOTE,	dcon		},
	{ KSLOCAL,	KCSTATUS,	KSREMOTE,	status		},
	{ KSLOCAL,	KCANY,		KSREMOTE,	sonotsup	},
/* Script Filename Gathering */
	{ KSCOLLECT,	KCCR,		KSREMOTE,	scrwrap		},
	{ KSCOLLECT,	KCANY,		KSCOLLECT,	scrgetc		},

	{ FSINVALID,	KCANY,		FSINVALID,	tnabort		},
};

#define	NTRANS	(sizeof(sostab)/sizeof(sostab[0]))

int	sostate;
u_char	sofsm[NKSTATES][NCHRS];
