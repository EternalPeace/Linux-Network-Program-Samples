/*
 * mksem.c - Create and increment a semaphore
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int semid; /* Semaphore identifier */
    int nsems = 1; /* How many semaphores to create */
    int flags = 0666; /* World read-alter mode */
    struct sembuf buf; /* How semop should behave */
    
    /* Create the semaphore with world read-alter perms */
    semid = semget(IPC_PRIVATE, nsems, flags);
    if(semid < 0) {
        perror("semget");
        exit(EXIT_FAILURE);
    }
    printf("semaphore created: %d\n", semid);

    /* Set up the structure for semop */
    buf.sem_num = 0; /* A single semaphore */
    buf.sem_op = 1; /* Increment the semaphore */
    buf.sem_flg = IPC_NOWAIT; /* Don't block */

    if((semop(semid, &buf, nsems)) < 0) {
        perror("semop");
        exit(EXIT_FAILURE);
    }
    system("ipcs -s");
    exit(EXIT_SUCCESS);
}
