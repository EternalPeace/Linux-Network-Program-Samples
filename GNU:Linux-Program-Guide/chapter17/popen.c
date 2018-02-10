/*
 * popen.c - Using popen() to open a pipe
 */
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <limits.h>

#define BUFSZ PIPE_BUF

void err_quit(char *msg);

int main(void)
{
    FILE *fp; /* FILE stream for popen */
    char *cmdstring = "cat popen.c";
    char buf[BUFSZ]; /* Buffer for "input" */

    /* Create the pipe */
    if((fp = popen(cmdstring, "r")) == NULL)
        err_quit("popen");

    /* Read cmdstring's output */
    while((fgets(buf, BUFSZ, fp)) != NULL)
        printf("%s", buf);

    /* Close and reap the exit status */
    pclose(fp);
    exit(EXIT_SUCCESS);
}

void err_quit(char *msg)
{
    perror(msg);
	exit(EXIT_FAILURE);
}
