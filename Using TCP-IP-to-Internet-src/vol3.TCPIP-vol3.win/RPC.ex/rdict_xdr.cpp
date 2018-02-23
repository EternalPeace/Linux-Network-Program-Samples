#include <rpc/rpc.h>
#include "rdict.h"


bool_t
xdr_example(XDR *xdrs, example *objp)
{
	if (!xdr_int(xdrs, &objp->exfield1)) {
		return (FALSE);
	}
	if (!xdr_char(xdrs, &objp->exfield2)) {
		return (FALSE);
	}
	return (TRUE);
}


