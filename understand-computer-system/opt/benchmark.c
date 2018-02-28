#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cpe.h"
#include "combine.h"

#define SHORT 0
#if SHORT 
#define ASIZE 31
#else
#define ASIZE 973
#endif

/* Keep track of a number of different combining programs */
#define MAX_BENCHMARKS 100

static struct {
    combiner cfunct;
    combiner checkfunct;
    char *description;
    double cpe;
} benchmarks[MAX_BENCHMARKS];

static int benchmark_count = 0;

static int current_benchmark = 0;

static vec_ptr data;
static data_t combine_result;

/* Used to make sure code doesn't get optimized away */
volatile data_t sink; 

static void setup()
{
    int i;
    data = new_vec(ASIZE);
    /* Initialize array  */
    for (i = 0; i < ASIZE; i++) 
#if IS_x86
	/* This runs into overflow inefficiencies with FLOAT PROD */
	set_vec_element(data, i, (data_t) (i+1));
#else
    set_vec_element(data, i, (data_t) 1);
#endif
    sink = (data_t) 0;
}

void run(int cnt) {
    set_vec_length(data, cnt);
    benchmarks[current_benchmark].cfunct(data, &combine_result);
}
     
/* Perform test of combination function */
static void run_test(int bench_index) {
    double cpe;
    char *description = benchmarks[bench_index].description;
    data_t good_result;
    current_benchmark = bench_index;
    setup();
#if 0    
    cpe = find_cpe(run, ASIZE);
#endif
#if USE_UNI
    cpe = find_cpe_full(run, ASIZE, 12, stdout, UNI_SAMPLE, 0.3, 0);
#else /* USE_UNI */
    cpe = find_cpe_full(run, ASIZE, 200, stdout, RAN_SAMPLE, 0.3, 0);
#endif
    benchmarks[bench_index].cfunct(data, &combine_result);
    benchmarks[bench_index].checkfunct(data, &good_result);
    if (combine_result != good_result) {
	printf("Function %s, Should be %d, Got %d\n",
	       description, (int) good_result, (int) combine_result);
    }
    benchmarks[current_benchmark].cpe = cpe;
    /* print results */
    /* Column Heading */
    printf("%s %s %s:\n", DATA_NAME, OPER_NAME, description);
    printf("%.2f cycles/element\n", cpe);
}

void add_combiner(combiner f, combiner fc, char *description) {
    benchmarks[benchmark_count].cfunct = f;
    benchmarks[benchmark_count].checkfunct = fc;
    benchmarks[benchmark_count].description = description;
    benchmark_count++;
}

int main()
{
    int i;
    printf("Hi\n");
    register_combiners();
    for (i = 0; i < benchmark_count; i++) {
	run_test(i);
    }
    return 0;
}

