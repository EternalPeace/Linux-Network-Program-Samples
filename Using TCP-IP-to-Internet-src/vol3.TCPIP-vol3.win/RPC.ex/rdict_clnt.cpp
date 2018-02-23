#include <string.h>
#include <rpc/rpc.h>

#define RPC_CLNT
#include "rdict.h"

/* Default timeout can be changed using clnt_control() */
static struct timeval TIMEOUT = { 25, 0 };

int *
initw_1(void *argp, CLIENT *clnt)
{
	static int res;

	memset((char *)&res, 0, sizeof(res));
	if (clnt_call(clnt, INITW, (xdrproc_t)xdr_void, (caddr_t)argp,
	    (xdrproc_t)xdr_int, (caddr_t)&res, TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&res);
}


int *
insertw_1(char **argp, CLIENT *clnt)
{
	static int res;

	memset((char *)&res, 0, sizeof(res));
	if (clnt_call(clnt, INSERTW, (xdrproc_t)xdr_wrapstring, (caddr_t)argp,
	    (xdrproc_t)xdr_int, (caddr_t)&res, TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&res);
}


int *
deletew_1(char **argp, CLIENT *clnt)
{
	static int res;

	memset((char *)&res, 0, sizeof(res));
	if (clnt_call(clnt, DELETEW, (xdrproc_t)xdr_wrapstring, (caddr_t)argp,
	    (xdrproc_t)xdr_int, (caddr_t)&res, TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&res);
}


int *
lookupw_1(char **argp, CLIENT *clnt)
{
	static int res;

	memset((char *)&res, 0, sizeof(res));
	if (clnt_call(clnt, LOOKUPW, (xdrproc_t)xdr_wrapstring, (caddr_t)argp,
	    (xdrproc_t)xdr_int, (caddr_t)&res, TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&res);
}

