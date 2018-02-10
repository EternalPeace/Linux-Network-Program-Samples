/*
 * atshm.c - Attaching a shared memory segment
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int shmid; /* Segment ID */
    char *shmbuf; /* Address in process */
    
    /* Expect an segment id on the command-line */
    if(argc != 2) {
        puts("USAGE: atshm <identifier>");
        exit(EXIT_FAILURE);
    }
    shmid = atoi(argv[1]);
    
    /* Attach the segment */
    if((shmbuf = shmat(shmid, 0, 0)) < (char *)0) {
        perror("shmat");
        exit(EXIT_FAILURE);
    }
    /* Where is it attached? */
    printf("segment attached at %p\n", shmbuf);
    
    /* See, we really are attached! */
    system("ipcs -m");

    /* Detach */
    if((shmdt(shmbuf)) < 0) {
        perror("shmdt");
        exit(EXIT_FAILURE);
    }
    puts("segment detached");

    /* Yep, we really did detach it */
    system("ipcs -m");
    
    exit(EXIT_SUCCESS);
}
