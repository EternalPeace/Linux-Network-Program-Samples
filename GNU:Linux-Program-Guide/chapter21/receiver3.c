#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <errno.h>
#include <fcntl.h>
 
int port = 6789;

void main() {
  int sin_len;
  char message[256];
  int socket_descriptor;
  struct sockaddr_in sin;
  int bind_rc, close_rc;
  ssize_t recv_rc;
  long save_file_flags;

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
  if (socket_descriptor == -1)
  {
    perror ("socket call failed");
    exit (errno);
  }

  bind_rc = bind(socket_descriptor, (struct sockaddr *)&sin, sizeof(sin));
  if (bind_rc == -1)
  {
    perror ("bind call failed");
    exit (errno);
  }
/*
   set socket to non-blocking: 
*/
  save_file_flags = fcntl(socket_descriptor, F_GETFL);
  printf("file flags are %ld\n", save_file_flags);
  save_file_flags |= O_NONBLOCK;
  if (fcntl(socket_descriptor, F_SETFL, save_file_flags) == -1) 
  {
    perror("trying to set input socket to non-blocking");
    exit (errno);
  }
  printf("file flags are now %ld\n", save_file_flags);
 
/*
   Loop forever (or until a termination message is received)
   Receive data through the socket and process it.  The processing
   in this program is really simple -- printing.
*/
  while (1)
  {
    sleep (1); /* wait a moment... */
    recv_rc = recvfrom(socket_descriptor, message, sizeof(message), 0,
             (struct sockaddr *)&sin, &sin_len);
    if (recv_rc == -1 && errno != EAGAIN)
    {
      fprintf(stderr, "errno %d  ", errno); perror ("recvfrom call failed");
      exit (errno);
    }
    else if (recv_rc == 0 || errno == EAGAIN)  /* no data */
    {
      printf("no data yet\n");
      errno = 0;   /* clear the error */
      continue;
    }

    errno = 0;   /* clear the error */
    printf("Response from server: %s\n", message);

    if (strncmp(message, "stop", 4) == 0) 
    {
       printf("Sender has told me to end the connection\n");
       break;
     }
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
    
  exit (0);
}

