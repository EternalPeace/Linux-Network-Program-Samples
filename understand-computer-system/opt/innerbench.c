#include <stdio.h>
#include "cpe.h"
#include "inner.h"

#define SHORT 0
#if SHORT 
#define ASIZE 31
#else
#define ASIZE 1024
#endif

/* Keep track of a number of different combining programs */
#define MAX_BENCHMARKS 100

static struct {
    inner cfunct;
    inner checkfunct;
    char *description;
    double cpe;
} benchmarks[MAX_BENCHMARKS];

static int benchmark_count = 0;

static int current_benchmark = 0;

static vec_ptr udata, vdata;
static data_t inner_result;

/* Used to make sure code doesn't get optimized away */
volatile data_t sink; 

static void setup()
{
    int i;
    udata = new_vec(ASIZE);
    vdata = new_vec(ASIZE);
    /* Initialize arrays */
    for (i = 0; i < ASIZE; i++) {
	set_vec_element(udata, i, (data_t) (i+1));
	set_vec_element(vdata, i, (data_t) (ASIZE+i+1));
    }
    sink = (data_t) 0;
}

void run(int cnt) {
    set_vec_length(udata, cnt);
    set_vec_length(vdata, cnt);
    benchmarks[current_benchmark].cfunct(udata, vdata, &inner_result);
}
    
/* Perform test of inner product function */
static void run_test(int bench_index) {
    double cpe;
    char *description = benchmarks[bench_index].description;
    data_t good_result;
    current_benchmark = bench_index;
    setup();
    cpe = find_cpe(run, ASIZE);
    set_vec_length(udata, ASIZE);
    set_vec_length(vdata, ASIZE);  
    benchmarks[bench_index].cfunct(udata, vdata, &inner_result);
    benchmarks[bench_index].checkfunct(udata, vdata, &good_result);
    if (inner_result != good_result) {
	printf("Function %s, Should be %d, Got %d\n",
	       description, (int) good_result, (int) inner_result);
    }
#ifdef VERBOSE
    printf("Inner function: %s\n", description);
#endif
    benchmarks[current_benchmark].cpe = cpe;
#ifdef VERBOSE
    printf("CPE = %.2f cycles\n", cpe);
#endif
    /* print results */
    /* Column Heading */
    printf("%s %s:\n", DATA_NAME, description);
    printf("%.2f cycles/element\n", cpe);
}

void add_inner(inner f, inner fc, char *description) {
    benchmarks[benchmark_count].cfunct = f;
    benchmarks[benchmark_count].checkfunct = fc;
    benchmarks[benchmark_count].description = description;
    benchmark_count++;
}

int main()
{
    int i;
    printf("Inner Product routines\n");
    register_inners();
    for (i = 0; i < benchmark_count; i++) {
	run_test(i);
    }
    return 0;
}

