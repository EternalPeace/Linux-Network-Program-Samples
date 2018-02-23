#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <rpc/rpc.h>
#include <rpc/pmap_clnt.h>

#define RPC_SVC
#include "rdict.h"

#define	WSVERS	MAKEWORD(2, 0)

static void rdictprog_1(struct svc_req *, SVCXPRT *);


main()
{
	SVCXPRT *transp;
	WSADATA	wsdata;

	if (WSAStartup(WSVERS, &wsdata) < 0) {
		fprintf(stderr, "WSAStartup failed.\n");
		exit(1);
	}

	(void)pmap_unset(RDICTPROG, RDICTVERS);

	transp = svcudp_create(RPC_ANYSOCK);
	if (transp == NULL) {
		(void)fprintf(stderr, "cannot create udp service.\n");
		exit(1);
	}
	if (!svc_register(transp, RDICTPROG, RDICTVERS, rdictprog_1, IPPROTO_UDP)) {
		(void)fprintf(stderr, "unable to register (RDICTPROG, RDICTVERS, udp).\n");
		exit(1);
	}

	transp = svctcp_create(RPC_ANYSOCK, 0, 0);
	if (transp == NULL) {
		(void)fprintf(stderr, "cannot create tcp service.\n");
		exit(1);
	}
	if (!svc_register(transp, RDICTPROG, RDICTVERS, rdictprog_1, IPPROTO_TCP)) {
		(void)fprintf(stderr, "unable to register (RDICTPROG, RDICTVERS, tcp).\n");
		exit(1);
	}
	svc_run();
	(void)fprintf(stderr, "svc_run returned\n");
	exit(1);
}

static void
rdictprog_1(struct svc_req *rqstp, SVCXPRT *transp)
{
	union {
		char *insertw_1_arg;
		char *deletew_1_arg;
		char *lookupw_1_arg;
	} argument;
	char *result;
	xdrproc_t xdr_argument, xdr_result;
	char *(*local)(void *, struct svc_req *);

	switch (rqstp->rq_proc) {
	case NULLPROC:
		(void)svc_sendreply(transp, (xdrproc_t)xdr_void, (char *)NULL);
		return;

	case INITW:
		xdr_argument = (xdrproc_t)xdr_void;
		xdr_result = (xdrproc_t)xdr_int;
		local = (char *(*)(void *, struct svc_req *)) initw_1;
		break;

	case INSERTW:
		xdr_argument = (xdrproc_t)xdr_wrapstring;
		xdr_result = (xdrproc_t)xdr_int;
		local = (char *(*)(void *, struct svc_req *)) insertw_1;
		break;

	case DELETEW:
		xdr_argument = (xdrproc_t)xdr_wrapstring;
		xdr_result = (xdrproc_t)xdr_int;
		local = (char *(*)(void *, struct svc_req *)) deletew_1;
		break;

	case LOOKUPW:
		xdr_argument = (xdrproc_t)xdr_wrapstring;
		xdr_result = (xdrproc_t)xdr_int;
		local = (char *(*)(void *, struct svc_req *)) lookupw_1;
		break;

	default:
		svcerr_noproc(transp);
		return;
	}
	memset((char *)&argument, 0, sizeof(argument));
	if (!svc_getargs(transp, xdr_argument, (caddr_t)&argument)) {
		svcerr_decode(transp);
		return;
	}
	result = (*local)(&argument, rqstp);
	if (result != NULL && !svc_sendreply(transp, xdr_result, result)) {
		svcerr_systemerr(transp);
	}
	if (!svc_freeargs(transp, xdr_argument, (caddr_t)&argument)) {
		(void)fprintf(stderr, "unable to free arguments\n");
		exit(1);
	}
}

