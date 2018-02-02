#include <stdio.h>
#include <stdlib.h>
#define FIFO_FILE "sampleFIFO"
int
main (int argc, char *argv[])
{
  FILE *fp;
  if (argc != 2)
    {
      printf ("USAGE: fifoclient [string]\n");
      exit (1);
    }
  /*打开有名管道 */
  if ((fp = fopen (FIFO_FILE, "w")) == NULL)
    {
      perror ("fopen");
      exit (1);
    }
  /*向有名管道中写入数据 */
  fputs (argv[1], fp);
  /*关闭有名管道 */
  fclose (fp);
  return (0);
}
