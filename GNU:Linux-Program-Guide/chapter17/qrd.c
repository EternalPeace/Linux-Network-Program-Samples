/*
 * qrd.c - Read all message from a message queue
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>

#define BUFSZ 512

/* Message structure */
struct msg {
    long msg_type;
    char msg_text[BUFSZ];
};

int main(int argc, char *argv[])
{
    int qid; /* The queue identifier */
    int len; /* Length of message */
    struct msg pmsg; /* A message structure */
     
    /* Expect the queue ID passed on the command-line */
    if(argc != 2) {
        puts("USAGE: qrd <queue ID>");
        exit(EXIT_FAILURE);
    }
    qid = atoi(argv[1]);

    /* Retrieve and display a message from the queue */
    len = msgrcv(qid, &pmsg, BUFSZ, 0, 0);
    if(len > 0) {
        (&pmsg)->msg_text[len] = '\0';
        printf("reading queue id: %05d\n", qid);
        printf("message type: %05ld\n", (&pmsg)->msg_type);
		printf("message length: %d bytes\n", len); 
        printf("message text: %s\n", (&pmsg)->msg_text);
    } else {
        perror("msgrcv");
        exit(EXIT_FAILURE);
    }
     
    exit(EXIT_SUCCESS);
}
