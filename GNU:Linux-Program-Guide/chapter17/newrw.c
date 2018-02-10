/*
 * piperw.c - The correct way to open a pipe and fork
 *            a child process.
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
     FILE *fp;			/* FILE stream for popen */
     char *cmdstring = "cat pipopn.c";
     char buf[BUFSZ];		/* Buffer for "input" */

     /* Create the pipe */
     if((fp = popen(cmdstring, "r")) == NULL)
	 err_quit("popen");
	 
     /* "Read" cmdstring's output */
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
