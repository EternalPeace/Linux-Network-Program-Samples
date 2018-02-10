/*
 * opshm.c - Reading and writing a shared memory segment
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <ctype.h>

#define BUFSZ 4096

int main(int argc, char *argv[])
{
    int shmid; /* Segment ID */
    char *shmbuf; /* Address in process */
    int fd; /* File descriptor */
    int i; /* Counter */
    
    /* Expect an segment id on the command-line */
    if(argc != 2) {
        puts("USAGE: opshm <identifier>");
        exit(EXIT_FAILURE);
    }
    shmid = atoi(argv[1]);
    
    /* Attach the segment */
    if((shmbuf = shmat(shmid, 0, 0)) < (char *)0) {
        perror("shmat");
        exit(EXIT_FAILURE);
    }
    
    /* Size shmbuf appropriately */
    if((shmbuf = malloc(sizeof(char) * BUFSZ)) == NULL) {
        perror("malloc");
        exit(EXIT_FAILURE);
    }

    for(i = 0; i < BUFSZ; ++i) {
        shmbuf[i] = rand();
    }

    /* Write the segment's raw contents out to a file */
    fd = open("opshm.out", O_CREAT | O_WRONLY, 0600);
    write(fd, shmbuf, BUFSZ);
	free(shmbuf); /* Don't want memory leaks */

    exit(EXIT_SUCCESS);
}
