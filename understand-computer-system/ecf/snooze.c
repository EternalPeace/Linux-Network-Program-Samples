/* $begin snoozesignal */
#include "csapp.h"

/* SIGINT handler */
void handler(int sig) 
{
    return; /* catch the signal and return */
}

/* $begin snooze */
unsigned int snooze(unsigned int secs) {
    unsigned int rc = sleep(secs);
    printf("Slept for %u of %u secs.\n", secs - rc, secs); 
    return rc;
}
/* $end snooze */

int main(int argc, char **argv) {

    if (argc != 2) {
	fprintf(stderr, "usage: %s <secs>\n", argv[0]);
	exit(0);
    }

    if (signal(SIGINT, handler) == SIG_ERR) /* install SIGINT handler */
	unix_error("signal error\n");
    (void)snooze(atoi(argv[1]));
    exit(0);
}
/* $end snoozesignal */
