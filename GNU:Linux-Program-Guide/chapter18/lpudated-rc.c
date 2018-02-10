/*
 * lpudated-rc.c - Simple timestamping daemon that reads a 
 *                 config file in /etc
 */
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <time.h>
#include <syslog.h>

#define RCFILE "/etc/lpudated.conf" /* The config file */
#define BUFLEN 256 /* Length of buffer reads */

int main(void)
{
    pid_t pid, sid;
    time_t timebuf;
    int fd, rcfd, len;

    pid = fork();
    if(pid < 0) {
        syslog(LOG_ERR, "%s\n", perror);
        exit(EXIT_FAILURE);
    }
    
    if(pid > 0) 
        /* In the parent, let's bail */
        exit(EXIT_SUCCESS);

    /* In the child */
    /* Open the system log */
    openlog("lpudated", LOG_PID, LOG_DAEMON);

    /* Read the config file */
    if((rcfd = open(RCFILE, O_RDONLY)) < 0) {
        syslog(LOG_ERR, "%s\n", "error opening RCFILE\n");
        exit(EXIT_FAILURE);
    } else {
        /* Read the config file */
        char rcbuf[BUFLEN]; /* Hold the value read */
        int len; /* The length of the buffer */

        if((len = read(rcfd, rcbuf, BUFLEN)) < 0) {
            syslog(LOG_ERR, "%s\n", "error reading RCFILE\n");
            exit(EXIT_FAILURE);
        }
        rcbuf[len] = '\0';

        /* Close the config file */
        if(close(rcfd) < 0) {
            syslog(LOG_ERR, "%s\n", "error closing RCFILE\n");
            exit(EXIT_FAILURE);
        }

        /* Write the read value out to the system log */
        syslog(LOG_INFO, "%s\n", rcbuf);
    }

    /* First, start a new session */
    if((sid = setsid()) < 0) {
        syslog(LOG_ERR, "%s\n", "setsid");
        exit(EXIT_FAILURE);
    }

    /* Next, make / the current directory */
    if((chdir("/")) < 0) {
        syslog(LOG_ERR, "%s\n", "chdir");
        exit(EXIT_FAILURE);
    }

    /* Reset the file mode */
    umask(0);

    /* Close unneeded file descriptors */
    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);

    /*  Finally, do our work */
    len = strlen(ctime(&timebuf));
    while(1) {
        char *buf = malloc(sizeof(char) * (len + 1));
    
        if(buf == NULL) {
            syslog(LOG_ERR, "malloc");
            exit(EXIT_FAILURE);
        }
        if((fd = open("/var/log/lpudated.log",
                       O_CREAT | O_WRONLY | O_APPEND, 0600)) < 0) {
            syslog(LOG_ERR, "open");
            exit(EXIT_FAILURE);
        }
        time(&timebuf);
        strncpy(buf, ctime(&timebuf), len + 1);
        write(fd, buf, len + 1);
        close(fd);
        sleep(60);
    }

    /* Close the system log and scram */
    closelog();
    exit(EXIT_SUCCESS);
}
     
