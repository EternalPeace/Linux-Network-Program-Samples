/*
 * mem.c - Demonstrate malloc, calloc, realloc, and free usage
 */
#include <stdio.h>
#include <stdlib.h>

void err_quit(char *);
void prn(char *, char *, int);

int main(void)
{
	char *c, *d, *e;

	if((c = malloc(10)) == NULL)
		err_quit("malloc failed");
	prn("malloc", c, 10);
	free(c);

	if((d = calloc(10, 1)) == NULL)
		err_quit("calloc failed");
	prn("calloc", d, 10);

	strcpy(d, "foobar");
	printf("d = %s\n", d);
	if((d = realloc(d, 20)) == NULL)
		err_quit("realloc failed");
	printf("d = %s\n", d);
	prn("realloc", d, 20);
	free(d);

	if((e = alloca(10)) == NULL)
		err_quit("alloca failed");
	prn("alloca", e, 10);

	exit(0);
}

void err_quit(char *msg)
{
	fprintf(stderr, "%s\n", msg);
	exit(EXIT_FAILURE);
}

void prn(char *memop, char *str, int len)
{
	int i;
	printf("%8s : ", memop);
	for(i = 0; i < len; ++i)
		printf("%d ", str[i]);
	printf("\n");
}
