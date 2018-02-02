/* fifoserver.c */
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <linux/stat.h>
#define FIFO_FILE "sampleFIFO"
int
main (void)
{
  FILE *fp;
  char readbuf[80];
  /* Create the FIFO if it does not exist */
  umask (0);
  /*在文件系统中创建有名管道 */ mknod (FIFO_FILE, S_IFIFO | 0666,
						   0);
  while (1)
    {
      /*打开有名管道 */
      fp = fopen (FIFO_FILE, "r");
      /*从有名管道中读取数据 */ fgets (readbuf, 80, fp);
      printf ("Received string: %s\n", readbuf);
      /*关闭有名管道 */
      fclose (fp);
    }
  return (0);
}
