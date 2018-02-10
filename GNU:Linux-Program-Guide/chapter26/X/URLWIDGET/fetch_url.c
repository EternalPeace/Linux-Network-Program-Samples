// fetch_url.c

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <string.h>

static int port = 80;

char * fetch_url(char * url) {
  char * buf = (char *)malloc(50000);
  char message[256];
  char host_name[200];
  char file_name[200];
  char *error_string;
  int sd;
  struct sockaddr_in pin;
  struct hostent *nlp_host;
  int count, sum, iter;
  char *sp1, *sp2;

  sp1 = strstr(url, "http://");
  if (sp1 == NULL) {
    sprintf(host_name, "%s", url);
  } else {
    sprintf(host_name, "%s", &(url[7]));
  }
  printf("1.  host_name=%s\n", host_name);
  sp1 = strstr(host_name, "/");

  if (sp1 == NULL) {
    // no file name, so use index.html:
    sprintf(file_name, "index.html");
  } else {
    sprintf(file_name, "%s", (char *)(sp1 + 1));
    *sp1 = '\0';
  }

  printf("2.  host_name=%s, file_name=%s\n", host_name, file_name);

  if ((nlp_host = gethostbyname(host_name)) == 0) {
    error_string = (char *)malloc(128);
    sprintf(error_string, "Error resolving local host\n");
    return error_string;
  }
    
  bzero(&pin, sizeof(pin));
  pin.sin_family = AF_INET;
  pin.sin_addr.s_addr = htonl(INADDR_ANY);
  pin.sin_addr.s_addr = ((struct in_addr *)(nlp_host->h_addr))->s_addr;
  pin.sin_port = htons(port);

  if ((sd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
    error_string = (char *)malloc(128);
    sprintf(error_string, "Error opening socket\n");
    return error_string;
  }

  if (connect(sd, (void *)&pin, sizeof(pin)) == -1) {
    error_string = (char *)malloc(128);
    sprintf(error_string, "Error connecting to socket\n");
    return error_string;
  }

  // NOTE: must send a carriage return at end of message:

  sprintf(message,"GET /%s  HTTP/1.0\n\n", file_name);

  printf("Sending message %s to web_server...\n", message);

  if (send(sd, message, strlen(message), 0) == -1) {
    error_string = (char *)malloc(128);
    sprintf(error_string, "Error in send\n");
    return error_string;
  }

  printf("..sent message.. wait for response...\n");

  count = sum = iter = 0;
  while (iter++ < 5) {
    count = recv(sd, &(buf[sum]), 50000 - count, 0);
    if (count == -1) {
      break;
    }
    sum += count;
  }
  
  close(sd);
  return buf;
}
