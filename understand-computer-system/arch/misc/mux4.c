#include <stdio.h>
#include <stdlib.h>
int code_val, s0_val, s1_val;
char **data_names;
/* $begin sim-mux4-s1-c */
int gen_s1()
{
    return ((code_val) == 2||(code_val) == 3);
}

/* $end sim-mux4-s1-c */
int gen_s0()
{
    return ((code_val) == 1||(code_val) == 3);
}

int gen_Out4()
{
    return ((!(s1_val) & !(s0_val)) ? (atoi(data_names[0])) : !(s1_val) ? (atoi(data_names[1])) : ((s1_val) & !(s0_val)) ? (atoi(data_names[2])) : 1 ? (atoi(data_names[3])) : 0);
}

/* $begin sim-mux4-main-c */
int main(int argc, char *argv[]) {
  data_names = argv+2;
  code_val = atoi(argv[1]);
  s1_val = gen_s1();
  s0_val = gen_s0();
  printf("Out = %d\n", gen_Out4());
  return 0;
}
/* $end sim-mux4-main-c */
