/*
 * struct.c - debug a program with a struct
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void err_quit(char *msg);

int main(int argc, char *argv[])
{
	int i = 0;
	struct s {
		int index;
		char *name;
	} *S;

	/* incorrect memory allocation */
	if((S = malloc((sizeof(S)) * argc)) == NULL)
		err_quit("(__LINE__)malloc");

	while(i < argc) {
		S[i].index = i;
		if((S[i].name = malloc(strlen(argv[i]) + 1)) == NULL)
			err_quit("(__LINE__)malloc");
		strcpy(S[i].name, argv[i]);
		++i;
	}

	/* Now, display the values in the array */
	for(i = 0; i < argc; ++i)
		fprintf(stdout, "%d: %d, %s\n", i, S[i].index, S[i].name);
	
	exit(EXIT_FAILURE);
}

void err_quit(char *msg)
{
	perror(msg);
	exit(EXIT_FAILURE);
}
