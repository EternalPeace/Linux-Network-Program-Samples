
/******************************************************************************
 *	pipeline.c
 *
 *	Code for implementing pipelined processor simulators
 ******************************************************************************/

/******************************************************************************
 *	#includes
 ******************************************************************************/

#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "isa.h"
#include "pipeline.h"

/******************************************************************************
 *	defines
 ******************************************************************************/

#define MAX_STAGE 10

/******************************************************************************
 *	static variables
 ******************************************************************************/

static pipe_ptr pipes[MAX_STAGE];
static int pipe_count = 0;

/******************************************************************************
 *	function definitions
 ******************************************************************************/

/* Create new pipe with count bytes of state */
/* bubble_val indicates state corresponding to pipeline bubble */
pipe_ptr new_pipe(int count, void *bubble_val)
{
  pipe_ptr result = (pipe_ptr) malloc(sizeof(pipe_ele));
  result->current = malloc(count);
  result->next = malloc(count);
  memcpy(result->current, bubble_val, count);
  memcpy(result->next, bubble_val, count);
  result->count = count;
  result->op = P_LOAD;
  result->bubble_val = bubble_val;
  pipes[pipe_count++] = result; 
  return result;
}

/* Update all pipes */
void update_pipes()
{
  int s;
  for (s = 0; s < pipe_count; s++) {
    pipe_ptr p = pipes[s];
    switch (p->op)
      {
      case P_BUBBLE:
      	/* insert a bubble into the next stage */
      	memcpy(p->current, p->bubble_val, p->count);
      	break;
      
      case P_LOAD:
      	/* copy calculated state from previous stage */
      	memcpy(p->current, p->next, p->count);
      	break;
      case P_ERROR:
	  /* Like a bubble, but insert error condition */
      	memcpy(p->current, p->bubble_val, p->count);
      	break;
      case P_STALL:
      default:
      	/* do nothing: next stage gets same instr again */
      	;
      }
    if (p->op != P_ERROR)
	p->op = P_LOAD;
  }
}

/* Set all pipes to bubble values */
void clear_pipes()
{
  int s;
  for (s = 0; s < pipe_count; s++) {
    pipe_ptr p = pipes[s];
    memcpy(p->current, p->bubble_val, p->count);
    memcpy(p->next, p->bubble_val, p->count);
    p->op = P_LOAD;
  }
}

/******************** Utility Code *************************/

/* Representations of digits */
static char digits[16] =
   {'0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

/* Print hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   pbw denotes bits per word.*/
void wprint(unsigned x, int bpd, int bpw, FILE *fp)
{
  int digit;
  unsigned mask = (1 << bpd) - 1;
  for (digit = (bpw-1)/bpd; digit >= 0; digit--) {
    unsigned val = (x >> (digit * bpd)) & mask;
    putc(digits[val], fp);
  }
}

/* Create string in hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   pbw denotes bits per word.*/
void wstring(unsigned x, int bpd, int bpw, char *str)
{
  int digit;
  unsigned mask = (1 << bpd) - 1;
  for (digit = (bpw-1)/bpd; digit >= 0; digit--) {
    unsigned val = (x >> (digit * bpd)) & mask;
    *str++ = digits[val];
  }
  *str = '\0';
}


/******************************************************************************/



