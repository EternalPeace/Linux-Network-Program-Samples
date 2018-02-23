/* ttfsm.c */

#include <sys/types.h>
#include <stdio.h>
#include "telnet.h"
#include "tnfsm.h"
#include "local.h"

extern int do_echo(), do_noga(), do_notsup(), do_status(), no_op(),
	recopt(), subend(), subopt(), tcdm(), ttputc(), will_notsup(),
	will_termtype(), will_txbinary(), abort(), do_txbinary();

struct fsm_trans ttstab[] = {
	/* State	Input		Next State	Action	*/
	/* ------	------		-----------	-------	*/
	{ TSDATA,	TCIAC,		TSIAC,		no_op		},
	{ TSDATA,	TCANY,		TSDATA,		ttputc 		},
	{ TSIAC,	TCIAC,		TSDATA,		ttputc		},
	{ TSIAC,	TCSB,		TSSUBNEG,	no_op		},
/* TELNET Commands */
	{ TSIAC,	TCNOP,		TSDATA,		no_op		},
	{ TSIAC,	TCDM,		TSDATA,		tcdm		},
/* Option Negotiation */
	{ TSIAC,	TCWILL,		TSWOPT,		recopt		},
	{ TSIAC,	TCWONT,		TSWOPT,		recopt		},
	{ TSIAC,	TCDO,		TSDOPT,		recopt		},
	{ TSIAC,	TCDONT,		TSDOPT,		recopt		},
	{ TSIAC,	TCANY,		TSDATA,		no_op		},
/* Option Subnegotion */
	{ TSSUBNEG,	TCIAC,		TSSUBIAC,	no_op		},
	{ TSSUBNEG,	TCANY,		TSSUBNEG,	subopt		},
	{ TSSUBIAC,	TCSE,		TSDATA,		subend		},
	{ TSSUBIAC,	TCANY,		TSSUBNEG,	subopt		},

	{ TSWOPT,	TOECHO,		TSDATA,		do_echo		},
	{ TSWOPT,	TONOGA,		TSDATA,		do_noga		},
	{ TSWOPT,	TOTXBINARY,	TSDATA,		do_txbinary	},
	{ TSWOPT,	TCANY,		TSDATA,		do_notsup	},

	{ TSDOPT,	TOTERMTYPE,	TSDATA,		will_termtype	},
	{ TSDOPT,	TOTXBINARY,	TSDATA,		will_txbinary	},
	{ TSDOPT,	TCANY,		TSDATA,		will_notsup	},

	{ FSINVALID,	TCANY,		FSINVALID,	abort		},
};

#define	NTRANS (sizeof(ttstab)/sizeof(ttstab[0]))

int	ttstate;
u_char	ttfsm[NTSTATES][NCHRS];
