#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
 
int port = 6789;

void main() {
  int sin_len;
  char message[256];
  int socket_descriptor;
  struct sockaddr_in sin;
  printf("Waiting for data from sender\n");
/*
   Initialize socket address structure for Internet Protocols
*/
  bzero(&sin, sizeof(sin)); /* empty data structure */
  sin.sin_family = AF_INET;
  sin.sin_addr.s_addr = htonl(INADDR_ANY);
  sin.sin_port = htons(port);
  sin_len = sizeof(sin);
/* 
   Create a UDP socket
   and bind it to the port
*/
  socket_descriptor = socket(AF_INET, SOCK_DGRAM, 0);
  bind(socket_descriptor, (struct sockaddr *)&sin, sizeof(sin));
/*
   Loop forever (or until a termination message is received)
   Receive data through the socket and process it.  The processing
   in this program is really simple -- printing.
*/
  while (1)
  {
    recvfrom(socket_descriptor, message, sizeof(message), 0,
             (struct sockaddr *)&sin, &sin_len);
    printf("Response from server: %s\n", message);
    if (strncmp(message, "stop", 4) == 0) 
    {
       printf("Sender has told me to end the connection\n");
       break;
     }
  }
  close(socket_descriptor);
  exit (0);
}

