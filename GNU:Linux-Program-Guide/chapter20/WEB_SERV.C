/* web_server.c
 * Copyright Mark Watson 1999. Open Source software license.
 */

#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <errno.h>

unsigned short port = 8000;     // Default server port number

#define DEBUG 1

char * error_return = "<HTML>\n<BODY>File not found\n</BODY>\n</HTML>";

char ret_buf[32768];

char * read_file(char * buf, int num_buf) {
  int i;
  char *cp, *cp2;
  FILE *f;
  cp = buf + 5;
  cp2 = strstr(cp, " HTTP");
  if (cp2 != NULL) *cp2 = '\0';
  if (DEBUG) printf("file: |%s|\n", cp);
  // fetch file:
  f = fopen(cp, "r");
  if (f == NULL) return error_return;
  i = fread(ret_buf, 1, 32768, f);
  if (DEBUG) printf("%d bytes read from file %s\n", i, cp);
  if (i == 0)  { fclose(f);  return error_return; }
  ret_buf[i] = '\0';
  fclose(f);
  return ret_buf;
}

int main(int argc, char* argv[]) {
  int i, sock;
  char*  recvBuffer   = (char *)malloc(4001);

  int rc = 0;
  int serverSocket;
  struct sockaddr_in serverAddr;
  struct sockaddr_in clientAddr;
  int clientAddrSize;
  struct hostent* entity;
  int totalReceived;
  int size;
  int totalSent;
  int bytesSent;
  char * cbuf;


  serverSocket = socket(AF_INET, SOCK_STREAM, 0);
  if (serverSocket == -1) {
    printf("Invalid socket\n");
    exit(1);
  }

  serverAddr.sin_family      = AF_INET;
  serverAddr.sin_port        = htons(port);
  serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
  memset(&(serverAddr.sin_zero), 0, 8);

  printf("Binding server socket to port %d\n", port);

  rc = bind(serverSocket, (struct sockaddr*) &serverAddr,
	    sizeof(struct sockaddr));
  if (rc == -1) {
    printf("Bad bind\n");
    exit(1);
  }

  rc = listen(serverSocket, 10); // allow 10 queued requests
  if (rc == -1) {
    printf("Bad listen\n");
    exit(1);
  }

  printf("Accepting connections ...\n");

  while (1) {
    clientAddrSize = sizeof(struct sockaddr_in);
    do
      sock = accept(serverSocket,
		    (struct sockaddr*) &clientAddr, 
		    &clientAddrSize);
    while ((sock == -1) && (errno == EINTR));
    if (sock == -1) {
      printf("Bad accept\n");
      exit(1);
    }

    entity = gethostbyaddr((char*) &clientAddr.sin_addr,
			   sizeof(struct in_addr), AF_INET);
    if (DEBUG) printf("Connection from %d\n",
		      inet_ntoa((struct in_addr) clientAddr.sin_addr));

    i = recv(sock, recvBuffer, 4000, 0);
    if (i == -1)  break;
    if (recvBuffer[i - 1] != '\n') break;
    recvBuffer[i] = '\0';
    if (DEBUG) {
      printf("Received from client: %s\n", recvBuffer);
    }

    // call a separate work function to process request:
    cbuf = read_file(recvBuffer, totalReceived);
    size = strlen(cbuf);
    totalSent = 0;
    do {
      bytesSent = send(sock, cbuf + totalSent,
		       strlen(cbuf + totalSent), 0);
      if (bytesSent == -1) break;
      totalSent += bytesSent;
    } while (totalSent < size);
    if (DEBUG) printf("Connection closed by client.\n");
    close(sock);
  }
  return 0;
}
