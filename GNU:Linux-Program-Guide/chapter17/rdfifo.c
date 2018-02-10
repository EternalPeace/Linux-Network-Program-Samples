/*
 * rdfifo.c - Create a FIFO and read from it
 */
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <limits.h>

int main(void)
{
    int fd;	/* Descriptor for FIFO */
    int len; /* Bytes read from FIFO */
    char buf[PIPE_BUF];
    mode_t mode = 0666;

    if((mkfifo("fifo1", mode)) < 0) {
        perror("mkfifo");
        exit(EXIT_FAILURE);
    }

    /* Open the FIFO read-only */
    if((fd = open("fifo1", O_RDONLY)) < 0) {
        perror("open");
        exit(EXIT_FAILURE);
    }
    /* Read and display the FIFO's output until EOF */
    while((len = read(fd, buf, PIPE_BUF - 1)) > 0)
        printf("rdfifo read: %s", buf);

    close(fd);

    exit(EXIT_SUCCESS);
}
