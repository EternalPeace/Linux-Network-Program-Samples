#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define SEND_NORMAL_DATA "123"
#define SEND_OOB_DATA "abc"	//其中只有最后的字符'c'会被当做带外数据

int
main (int argc, char **argv)
{
  int fd = socket (AF_INET, SOCK_STREAM, 0);
  if (fd == -1)
    printf ("1:%m\n"), exit (-1);

  struct sockaddr_in dr;
  dr.sin_family = AF_INET;
  dr.sin_port = htons (1200);
  dr.sin_addr.s_addr = INADDR_ANY;

  int result = connect (fd, (struct sockaddr *) &dr, sizeof (dr));
  if (result == -1)
    printf ("2:%m\n"), exit (-1);

  fd_set fds;
  FD_ZERO (&fds);
  FD_SET (fd, &fds);
  select (fd + 1, 0, &fds, 0, 0);
  send (fd, SEND_NORMAL_DATA, strlen (SEND_NORMAL_DATA), 0);	//发送正常数据
  //注意: 带外数据,接收端的带外缓存只有1Byte,所以只有字符'c'是真正的带外数据,同理带MSG_OOB标志的recv能接收带外数据
  send (fd, SEND_OOB_DATA, strlen (SEND_OOB_DATA), MSG_OOB);	//使用带外数据标志flag=MSG_OOB

  close (fd);
}
