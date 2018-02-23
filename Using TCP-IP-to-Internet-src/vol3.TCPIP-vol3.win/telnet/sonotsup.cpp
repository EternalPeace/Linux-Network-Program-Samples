/* sonotsup.cpp - sonotsup */

#include <stdio.h>
#include <winsock.h>

/*------------------------------------------------------------------------
 * sonotsup - an unsupported escape command
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
sonotsup(SOCKET sfd, FILE *tfp, int c)
{
	fprintf(tfp, "\nunsupported escape: %c.\n", c);
	fprintf(tfp, "s  - turn on scripting\t\t");
	fprintf(tfp, "u  - turn off scripting\n");
	fprintf(tfp, ".  - disconnect\t\t\t");
	fprintf(tfp, "^T - print status\n");
	return 0;
}
