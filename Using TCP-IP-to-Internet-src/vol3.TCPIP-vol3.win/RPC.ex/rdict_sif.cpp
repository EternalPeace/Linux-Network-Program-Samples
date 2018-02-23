/* rdict_sif.cpp - init_1, insert_1, delete_1, lookup_1 */

#include <rpc/rpc.h>

#define	RPC_SVC
#include "rdict.h"

/* Server-side stub inteface routines written by hand */

static	int retcode;

int	initw(void), insertw(char *), deletew(char *), lookupw(char *);

/*------------------------------------------------------------------------
 * insertw_1 -  server side interface to remote procedure insertw
 *------------------------------------------------------------------------
 */
int	*
insertw_1(void *w, struct svc_req *rqstp)
{
	retcode = insertw(*(char **)w);
	return &retcode;
}

/*------------------------------------------------------------------------
 * initw_1 -  server side interface to remote procedure initw
 *------------------------------------------------------------------------
 */
int	*
initw_1(void *w, struct svc_req *rqstp)
{
	retcode = initw();
	return &retcode;
}

/*------------------------------------------------------------------------
 * deletew_1 -  server side interface to remote procedure deletew
 *------------------------------------------------------------------------
 */
int	*
deletew_1(void *w, struct svc_req *rqstp)
{
	retcode = deletew(*(char **)w);
	return &retcode;
}

/*------------------------------------------------------------------------
 * lookupw_1 -  server side interface to remote procedure lookupw
 *------------------------------------------------------------------------
 */
int	*
lookupw_1(void *w, struct svc_req *rqstp)
{
	retcode = lookupw(*(char**)w);
	return &retcode;
}
