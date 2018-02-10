/* $Id$
 * prn_env.c - Display values of environment variables
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

static char rcsid[] = "$Id$\n";

int main(void)
{
	extern char **environ;
	char **my_env = environ;

	while(*my_env) {
		printf("%s\n", *my_env);
		my_env++;
	}

	exit(EXIT_SUCCESS);
}
