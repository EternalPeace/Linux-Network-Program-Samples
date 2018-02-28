#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* Experiments with putting executable code in a data area */

/* Look at functions from int to int */
typedef int (*i_function)(int);

/* Data type for bytes of code */
typedef unsigned char code_byte_t;

#define MATCH_BYTE_CNT 2
/* Code for code sequence "pop %ebp ; ret" */
static code_byte_t end_pattern[MATCH_BYTE_CNT] = { 0x5d, 0xc3 };

/* Copy functions into generic space and then cast it to be a function.
   Implementation is x86 specific, in that it assumes a function
   ends with a particular hex pattern.
   Returns NULL if don't find ending sequence within specified byte limit.
*/
i_function function_cpy(code_byte_t *dest, i_function src, int max_bytes)
{
  int i;
  code_byte_t *cdest = (code_byte_t *) dest;
  code_byte_t *csrc = (code_byte_t *) src;
  int match_cnt = 0;
  for (i = 0; i < max_bytes && match_cnt < MATCH_BYTE_CNT; i++) {
    code_byte_t c = csrc[i];
    cdest[i] = c;
    if (c == end_pattern[match_cnt])
      match_cnt++;
    else
      match_cnt = 0;
  }
  if (match_cnt == MATCH_BYTE_CNT)
    return (i_function) dest;
  else
    return NULL;
}

/* Sample functions */
int plus1(int x)
{
  return x+1;
}

int minusx(int x)
{
  return -x;
}

int absval(int x)
{
  if (x < 0)
    return -x;
  else
    return x;
}

/* What is the longest function we want to store? */
#define ALLOC_CNT 40

/* How many functions do I have? */
#define F_CNT 3

i_function funs[F_CNT] = { plus1, minusx, absval };
char *fnames[F_CNT] = {"plus1", "minusx", "absval" };

/* Different types of space */
typedef enum { S_STACK, S_HEAP, S_GLOBAL, S_CODE } space_t;

/* Storing function as global data */
code_byte_t global[ALLOC_CNT];

/* Copy function to specified space and then execute it with the specified
   argument
*/
int test_function(i_function fun, int argval, space_t loc)
{
  code_byte_t stack[ALLOC_CNT];
  code_byte_t *heap = calloc(ALLOC_CNT, sizeof(code_byte_t));
  i_function sfun;
  int val;
  switch(loc) {
  case S_STACK:
    sfun = function_cpy(stack, fun, ALLOC_CNT);
    break;
  case S_HEAP:
    sfun = function_cpy(heap, fun, ALLOC_CNT);
    break;
  case S_GLOBAL:
    sfun = function_cpy(global, fun, ALLOC_CNT);
    break;
  case S_CODE:
  default:
    sfun = fun;
    break;
  }
  if (sfun == NULL) {
    fprintf(stdout, "Error: Could not make copy of function\n");
    exit(1);
  } else {
    fprintf(stdout, "Copy function from %p to %p\n",
	    fun, sfun);
  }
  val = sfun(argval);
  return val;
}

void usage(char *name)
{
  fprintf(stderr, "Usage: %s (plus1|minusx|absval) val (-h|-s|-g|-c)\n", name);
  exit(0);
}

int main(int argc, char *argv[]) {
  int argval = 0;
  int val;
  int found_fun = 0;
  i_function fun = funs[0];
  space_t loc = S_CODE;
  char *loc_name = "stack";
  int i;
  if (argc != 4)
    usage(argv[0]);
  for (i = 0; i < F_CNT && !found_fun; i++)
    if (!strcmp(argv[1], fnames[i])) {
      fun = funs[i];
      found_fun = 1;
    }
  if (!found_fun)
    usage(argv[0]);
  argval = strtol(argv[2], NULL, 0);
  if (argv[3][0] != '-')
    usage(argv[0]);
  switch (argv[3][1]) {
  case 'h':
    loc = S_HEAP;
    loc_name = "heap";
    break;
  case 's':
    loc = S_STACK;
    loc_name = "stack";
    break;
  case 'g':
    loc = S_GLOBAL;
    loc_name = "global";
    break;
  case 'c':
    loc = S_CODE;
    loc_name = "code";
    break;
  default:
    usage(argv[0]);
  }
  val = test_function(fun, argval, loc);
  printf("%s_%s(%d) --> %d\n",
	 argv[1], loc_name, argval, val);
  return 0;
}
