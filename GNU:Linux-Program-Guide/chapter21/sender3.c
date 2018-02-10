#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <errno.h>
 
int port = 6789;

void main() {
  int socket_descriptor;
  int iter = 0;
  ssize_t sendto_rc;
  int close_rc;
  char buf[80]; 
  struct sockaddr_in address;
  struct hostent *hostbyname;

/*
   Translate a host name to IP address
*/ 
  hostbyname = gethostbyname("127.0.0.1");
  if (hostbyname == NULL)
  {
    perror ("gethostbyname failed");
    exit (errno);
  }
/*
   Initialize socket address structure for Internet Protocols
   The address comes from the datastructure returned by gethostbyname()
*/ 
  bzero(&address, sizeof(address)); /* empty data structure */
  address.sin_family = AF_INET;
  memcpy(&address.sin_addr.s_addr, hostbyname->h_addr, sizeof(address.sin_addr.s_addr)); 
  address.sin_port = htons(port);
/*
   Create a UDP socket
*/
  socket_descriptor = socket(AF_INET, SOCK_DGRAM, 0);
  if (socket_descriptor == -1)
  {
    perror ("socket call failed");
    exit (errno);
  }
/*
   Loop 20 times (a nice round number)  sending data.
*/
  for (iter = 0; iter <= 20; iter++)
  {
    sprintf(buf,"data packet with ID %d\n", iter);
    sendto_rc = sendto(socket_descriptor,
           buf, sizeof(buf),
           0, (struct sockaddr *)&address, sizeof(address));
    if (sendto_rc == -1)
    {
      perror ("sendto call failed");
      exit (errno);
    }
    sleep(3); /* this is the only difference from sender2.c */
  }


/*
   Send a termination message
*/
   sprintf(buf, "stop\n");
   sendto_rc = sendto(socket_descriptor,
          buf, sizeof(buf),
          0, (struct sockaddr *)&address, sizeof(address));
   if (sendto_rc == -1)
   {
     perror ("sendto STOP call failed");
     exit (errno);
   }
/*
    Most people don't bother to check the return code
    returned by the close function
*/ 
   close_rc = close(socket_descriptor); 
   if (close_rc == -1)
   {
     perror ("close call failed");
     exit (errno);
   }

   printf("Messages Sent, Terminating\n");
   exit (0);
}

