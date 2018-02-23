/* dcon.cpp - dcon */

#include <stdlib.h>
#include <stdio.h>
#include <winsock.h>

#include "local.h"

/*------------------------------------------------------------------------
 * dcon - disconnect from remote
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
dcon(SOCKET sfd, FILE *tfp, int c)
{
	fprintf(tfp, "disconnecting.\n");
	WSACleanup();
	exit(0);
	return 0;	/* pro forma */
}
