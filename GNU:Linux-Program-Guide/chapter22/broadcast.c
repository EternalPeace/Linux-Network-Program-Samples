/* 
 * broadcast.c - An IP multicast server
 *
 * Copyright Mark Watson 1999. Open Source Software License.
 * Hacked on by Kurt Wall
 */

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <unistd.h>
#include <stdlib.h>

int port = 6789;

int main(void)
{
    int socket_descriptor;
    struct sockaddr_in address;

    /* 
     * For broadcasting, this socket can be treated 
     * like a UDP socket:
     */
    socket_descriptor = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_descriptor == -1) {
        perror("Opening socket");
        exit(EXIT_FAILURE);
    }

    /* Initialize the address structure */
    memset(&address, 0, sizeof(address));
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr("224.0.0.1");
    address.sin_port = htons(port);

    /* Start broadcasting */
    while(1) {
        if(sendto(socket_descriptor, "test from broadcast", 
           sizeof("test from broadcast"), 0, 
           (struct sockaddr *)&address, sizeof(address)) < 0) {
            perror("sendto");
            exit(EXIT_FAILURE);
        }
        sleep(2);
    }
    
    exit(EXIT_SUCCESS);
}    
