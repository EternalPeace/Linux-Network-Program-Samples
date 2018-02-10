/*
 * mkq.c - Create a SysV IPC message queue
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int qid; /* The queue identifier */
    key_t key; /* The queue key */

    key = 123;

    /* Create the queue */
    if((qid = msgget(key, IPC_CREAT | 0666)) < 0) {
        perror("msgget:create");
        exit(EXIT_FAILURE);
    }
    printf("created queue id = %d\n", qid);
     
    /* Open the queue again */
    if((qid == msgget(key, 0)) < 0) {
        perror("msgget:open");
        exit(EXIT_FAILURE);
    }
    printf("opened queue id = %d\n", qid);

    exit(EXIT_SUCCESS);
}
     
