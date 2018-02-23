/* ttfsm.cpp */

#include <stdio.h>
#include <winsock.h>

#include "telnet.h"
#include "tnfsm.h"
#include "local.h"

extern int do_echo(SOCKET,FILE *,int), do_noga(SOCKET,FILE *,int),
	do_notsup(SOCKET,FILE *,int), do_status(SOCKET,FILE *,int),
	no_op(SOCKET,FILE *,int), recopt(SOCKET,FILE *,int),
	subend(SOCKET,FILE *,int), subopt(SOCKET,FILE *,int),
	tcdm(SOCKET,FILE *,int), ttputc(SOCKET,FILE *,int),
	will_notsup(SOCKET,FILE *,int), will_termtype(SOCKET,FILE *,int),
	will_txbinary(SOCKET,FILE *,int), tnabort(SOCKET,FILE *,int),
	do_txbinary(SOCKET,FILE *,int);

struct fsm_trans ttstab[] = {
	/* State	Input		Next State	Action	*/
	/* ------	------		-----------	-------	*/
	{ TSDATA,	TCIAC,		TSIAC,		no_op		},
	{ TSDATA,	TCANY,		TSDATA,		ttputc 		},
	{ TSIAC,	TCIAC,		TSDATA,		ttputc		},
	{ TSIAC,	TCSB,		TSSUBNEG,	no_op		},
/* Telnet Commands */
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

	{ FSINVALID,	TCANY,		FSINVALID,	tnabort		},
};

#define	NTRANS (sizeof(ttstab)/sizeof(ttstab[0]))

int	ttstate;
u_char	ttfsm[NTSTATES][NCHRS];
