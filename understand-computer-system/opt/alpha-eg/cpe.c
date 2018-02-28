/* Compute CPE for function */
#include <stdlib.h>
#include <stdio.h>
#include "clock.h"
#include "cpe.h"
#include "lsquare.h"

/* Find Number of cycles for function f on argument cnt */
#define MIN_CYCLES 1
#define MIN_CALLS 4
static double run_function(elem_fun_t f, int cnt)
{
  int reps = 1;
  int nreps = 1;
  int calls = 0;
  double cycles;
  /* First run the function */
  f(cnt);
  /* Now keep running until get enough cycles */
  do {
    int c = nreps;
    reps = nreps;
    start_counter();
    while(c--)
      f(cnt);
    cycles = get_counter(); 
    nreps += nreps;
  } while (++calls < MIN_CALLS && cycles < MIN_CYCLES);
  return cycles/reps;
}
  
#define MAX_TRIALS 15
#define TOL 0.01

/* Find number of cycles taken by function.
   Do this by running number of trials until best two within TOL of
   each other
*/
double measure_function(elem_fun_t f, int cnt)
{
  double best = run_function(f, cnt);
  double err = 1.0;
  int trials = 1;
  while (trials < MAX_TRIALS && err > TOL) {
    double meas = run_function(f, cnt);
    double newerr;
    if (meas < best) {
      /* Swap best & meas */
      double tmp = meas;
      meas = best;
      best = tmp;
    }
    newerr = (meas-best)/best;
    if (newerr < err)
      err = newerr;
    trials++;
  }
  /*
  printf("Took %d trials to get error within %.3f\n",
	 trials, err);
  */
  return best;
}

#define MAXCNT 100

#define LIM (1<<30)

/* LCM of unrolling degree */
#ifdef USE_UNI
#define UNROLL 32
#else /* USE_UNI */
#define UNROLL 1
#endif

static int get_cnt(int index, int samples,
		   int maxcnt, sample_t smethod, double bias)
{
  int mincnt = (int) (bias*maxcnt);
  double weight;
  int val;
  switch (smethod) {
  case UNI_SAMPLE:
    weight = (double) index/(samples - 1);
    break;
  case RAN_SAMPLE:
    weight = (double) (random() % LIM) / (double) (LIM-1);
    break;
  default:
    fprintf(stderr, "Undefined sampling method %d\n", smethod);
    exit(1);
  }
  val = mincnt + weight*(maxcnt-mincnt);
  return UNROLL * (val/UNROLL);
}

#define SEED 31415

/* Find cpe for function f, which allows cnt up to maxcnt, using
   specified number of sample points.
   If data_file, then print data so that can plot points with Excel
   smethod determines method for generating samples
*/
double find_cpe_full(elem_fun_t f, int maxcnt, int samples, FILE *data_file,
		     sample_t smethod, double bias, int verbose)
{
  int i;
  int cnt;
  double cpe;
  double overhead;
  double *cnt_val = calloc(maxcnt, sizeof(double));
  double *cycle_val = calloc(maxcnt, sizeof(double));
  /* Do the samples */

  srandom(SEED);
  for (i = 0; i < samples; i++) {
    cnt = get_cnt(i, samples, maxcnt, smethod, bias);
    cnt_val[i] = cnt;
    cycle_val[i] = measure_function(f, cnt);
  }
  /* Fit data */
  cpe = ls_slope(cnt_val, cycle_val, samples);
  if (data_file)
    overhead = ls_intercept(cnt_val, cycle_val, samples);
  if (data_file && verbose) {
    /* Print x values */
    fprintf(data_file, "Cnt\t0");
    for (i = 0; i < samples; i++) 
      fprintf(data_file, "\t%.0f", cnt_val[i]);
    fprintf(data_file, "\n");
    /* Print y values */
    fprintf(data_file, "Cycs.\t");
    for (i = 0; i < samples; i++) 
      fprintf(data_file, "\t%.2f", cycle_val[i]);
    fprintf(data_file, "\n");
#if 0
    /* Print (y-b)/x values */
    fprintf(data_file, "CPE");
    for (i = 0; i < samples; i++) 
      fprintf(data_file, "\t%.2f", (cycle_val[i]-overhead)/cnt_val[i]);
    fprintf(data_file, "\n");
#endif
    /* Print ax*b values */
    fprintf(data_file, "Interp.\t%.2f", overhead);
    for (i = 0; i < samples; i++) 
      fprintf(data_file, "\t%.2f", cpe*cnt_val[i]+overhead);
    fprintf(data_file, "\n");
  }
  if (data_file && verbose) {
    /* Print results */
    fprintf(data_file, "cpe\t%.2f\tovhd\t%.2f\tavgerr\t\%.3f\tmaxerr\t\%.3f\n",
	    cpe, overhead,
	    ls_error(cnt_val, cycle_val, samples, LS_AVG),
	    ls_error(cnt_val, cycle_val, samples, LS_MAX));
  }
  free(cnt_val);
  free(cycle_val);
  return cpe;
}

/* Use default parameters */
double find_cpe(elem_fun_t f, int maxcnt)
{
  return find_cpe_full(f, maxcnt, 100, stdout, RAN_SAMPLE, 0.3, 0);
}







