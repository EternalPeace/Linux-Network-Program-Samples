/* 
 * listen.c - An IP multicast client
 *
 * Copyright Mark Watson 1999. Open Source Software License.
 * Hacked on by Kurt Wall
 */

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdlib.h>
#include <unistd.h>
 
char * host_name = "224.0.0.1"; /* Address for multicast IP */
int port = 6789;

int main(void)
{
    struct ip_mreq command;
    int loop = 1; /* The broadcast loops back to localhost */
    int iter = 0;
    int sin_len;
    char message[256];
    int socket_descriptor;
    struct sockaddr_in sin;
    struct hostent *server_host_name;

    if((server_host_name = gethostbyname(host_name)) == 0) {
        perror("gethostbyname");
        exit(EXIT_FAILURE);
    }

    /*bzero(&sin, sizeof(sin));*/
	memset(&sin, 0, sizeof(sin));
    sin.sin_family = AF_INET;
    sin.sin_addr.s_addr = htonl(INADDR_ANY);
    sin.sin_port = htons(port);

    if((socket_descriptor = socket(PF_INET, SOCK_DGRAM, 0)) == -1) {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    /* Allow multiple processes to use this same port:*/
    loop = 1;
    if(setsockopt(socket_descriptor, SOL_SOCKET, SO_REUSEADDR,
         &loop, sizeof(loop)) < 0) {
        perror("setsockopt:SO_REUSEADDR");
        exit(EXIT_FAILURE);
    }

    if(bind(socket_descriptor, (struct sockaddr *)&sin, sizeof(sin)) < 0) {
        perror("bind");
        exit(EXIT_FAILURE);
    }

    /* Allow broadcast to this machine */
    loop = 1;
    if(setsockopt(socket_descriptor, IPPROTO_IP, IP_MULTICAST_LOOP,
         &loop, sizeof(loop)) < 0) {
        perror("setsockopt:IP_MULTICAST_LOOP");
        exit(EXIT_FAILURE);
    }

    /* Join the broadcast group:*/
    command.imr_multiaddr.s_addr = inet_addr("224.0.0.1");
    command.imr_interface.s_addr = htonl(INADDR_ANY);

    if(command.imr_multiaddr.s_addr == -1) {
        perror("224.0.0.1 not a legal multicast address");
        exit(EXIT_FAILURE);
    }

    if (setsockopt(socket_descriptor, IPPROTO_IP, IP_ADD_MEMBERSHIP,
         &command, sizeof(command)) < 0) {
        perror("setsockopt:IP_ADD_MEMBERSHIP");
    }

    while(iter++ < 10) {
        sin_len = sizeof(sin);
        if(recvfrom(socket_descriptor, message, 256, 0,
           (struct sockaddr *)&sin, &sin_len) == -1) {
            perror("recvfrom");
        }
        printf("Response #%-2d from server: %s\n", iter, message);
        sleep(2);
    }

    /* leave the broadcast group */
    if(setsockopt(socket_descriptor, IPPROTO_IP, IP_DROP_MEMBERSHIP,
       &command, sizeof(command)) < 0) {
        perror("setsockopt:IP_DROP_MEMBERSHIP");
    }

    close(socket_descriptor);

    exit(EXIT_SUCCESS);
}    
