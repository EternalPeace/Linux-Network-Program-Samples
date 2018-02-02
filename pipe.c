#include <stdio.h>
#define MAXSTRS 5
int
main (void)
{
  int cntr;
  FILE *pipe_fp;
  char *strings[MAXSTRS] = { "roy", "zixia", "gouki", "supper", "mmwan" };
  /* 用popen建立管道 */
  if ((pipe_fp = popen ("sort", "w")) == NULL)
    {
      perror ("popen");
      exit (1);
    }

  /* Processing loop */ for (cntr = 0; cntr < MAXSTRS; cntr++)
    {
      fputs (strings[cntr], pipe_fp);
      fputc ('\n', pipe_fp);
    }
  /* 关闭管道 */ pclose (pipe_fp);
  return (0);
}
