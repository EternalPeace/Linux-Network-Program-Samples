#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <signal.h>
#include <fcntl.h>

int fd, cfd;

void
handle (int s)
{
  char data[100];
  if (s == SIGURG)
    {
      int r = recv (cfd, data, sizeof (data), MSG_OOB);
      data[r] = 0;
      printf ("接收%d字节的带外数据(oob data): %s\n", r, data);
    }
}

int
main (int argc, char **argv)
{
  fd = socket (AF_INET, SOCK_STREAM, 0);
  if (fd == -1)
    printf ("1:%m\n"), exit (-1);

  struct sockaddr_in dr;
  dr.sin_family = AF_INET;
  dr.sin_port = htons (10000);
  dr.sin_addr.s_addr = inet_addr(INADDR_ANY);

  int result = bind (fd, (struct sockaddr *) &dr, sizeof (dr));
  if (result == -1)
    printf ("2:%m\n"), exit (-1);

  result = listen (fd, 10);
  if (result == -1)
    printf ("3:%m\n"), exit (-1);

  signal (SIGURG, handle);	//添加SIGURG信号
  cfd = accept (fd, 0, 0);	//建立客户端连接
  if (cfd == -1)
    printf ("4:%m\n"), exit (-1);
  fcntl (cfd, F_SETOWN, getpid ());	//SIGURG的前提条件是进程必须持有文件描述符cfd

  char buf[100];
  while (1)
    {
      int r = recv (cfd, buf, sizeof (buf), 0);
      if (r > 0)
	{
	  buf[r] = 0;
	  printf ("接收%d字节的正常数据(normal data)：%s\n", r,
		  buf);
	  sleep (1);
	}
      else
	{
	  break;
	}
    }

  close (cfd);
  close (fd);
}
