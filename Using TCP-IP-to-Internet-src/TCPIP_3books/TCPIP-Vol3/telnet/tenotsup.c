/* tenotsup.c - tenotsup */

#include <stdio.h>

/*------------------------------------------------------------------------
 * tenotsup - an unsupported escape command
 *------------------------------------------------------------------------
 */
/*ARGSUSED*/
int
tenotsup(rfp, tfp, c)
FILE	*rfp, *tfp;
int	c;
{
	fprintf(tfp, "\nunsupported escape: %c.\n", c);
	fprintf(tfp, "s  - turn on scripting\t\t");
	fprintf(tfp, "u  - turn off scripting\n");
	fprintf(tfp, ".  - disconnect\t\t\t");
	fprintf(tfp, "^Z - suspend\n");
	fprintf(tfp, "^T - print status\n");
	return 0;
}
