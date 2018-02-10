/*
 * qsnd.c - Send a message to previously opened queue
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BUFSZ 512

struct msg {			/* Message structure */
     long msg_type;
     char msg_text[BUFSZ];
};

int main(int argc, char *argv[])
{
     int qid;			/* The queue identifier */
     int len;			/* Length of data sent */
     struct msg *pmsg;		/* Pointer to message structure */
     
     /* Expect the queue ID passed on the command-line */
     if(argc != 2) {
	  puts("USAGE: qsnd <queue ID>");
	  exit(EXIT_FAILURE);
     }
     qid = atoi(argv[1]);

     /* Get the message to add to the queue */
     puts("Enter message to post:");
     if((fgets(pmsg->msg_text, BUFSZ, stdin)) == NULL) {
	  puts("no message to post");
	  exit(EXIT_SUCCESS);
     }
     
     /* Associate the message with this process */
     pmsg->msg_type = getpid();
     /* Add the message to the queue */
     len = strlen(pmsg->msg_text);
     if((msgsnd(qid, pmsg, len, 0)) < 0) {
	  perror("msgsnd");
	  exit(EXIT_FAILURE);
     }
     puts("message posted");

     exit(EXIT_SUCCESS);
}
     
