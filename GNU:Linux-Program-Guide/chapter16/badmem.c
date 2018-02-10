/*
 * badmem.c - Demonstrate usage of memory debugging tools
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char g_buf[5];

int main(void)
{
	char *buf;
	char *leak;
	char l_buf[5];

	/* won't free this */
	leak = malloc(10);

	/* overrun buf a little bit */
	buf = malloc(5);
	strcpy(buf, "abcde");
	fprintf(stdout, "LITTLE  : %s\n", buf);
	free(buf);

	/* overrun buf a lot */
	buf = malloc(5);
	strcpy(buf, "abcdefgh");
	fprintf(stdout, "BIG     : %s\n", buf);

	/* underrun buf */
	*(buf - 2) = '\0';
	fprintf(stdout, "UNDERRUN: %s\n", buf);
	
	/* free buf twice */
	free(buf);
	free(buf);

	/* access freed memory */
	strcpy(buf, "This will blow up");
	fprintf(stdout, "FREED   : %s\n", buf);

	/* trash the global variable */
	strcpy(g_buf, "global boom");
	fprintf(stdout, "GLOBAL  : %s\n", g_buf);

	/* trash the local variable */
	strcpy(l_buf, "local boom");
	fprintf(stdout, "LOCAL   : %s\n", l_buf);

	exit(EXIT_SUCCESS);
}
