/*
 * execve.c - Illustrate execve
 */
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    char *argv[] = {"/bin/ls", NULL};
    
    if(execve("/bin/ls", argv, NULL) == -1) {
	perror("execve");
	exit(EXIT_FAILURE);
    }
    
    puts("shouldn't get here");
    
    exit(EXIT_SUCCESS);
}
