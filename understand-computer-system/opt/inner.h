#ifdef FLOAT
typedef float data_t;
#define DATA_NAME "Float"
#else
#ifdef DOUBLE
typedef double data_t;
#define DATA_NAME "Double"
#else
#ifdef EXTEND
typedef long double data_t;
#define DATA_NAME "Extended"
#else
typedef int data_t;
#define DATA_NAME "Integer"
#endif /* EXTEND */
#endif /* DOUBLE */
#endif /* FLOAT */

#include "vec.h"

/* Declaration of a combining routine */
/* Source vector, destination location */
typedef void (*inner)(vec_ptr, vec_ptr, data_t *);

/* Add combining routine to list of programs to measure */
void add_inner(inner f, inner fc, char *description);

/* Called by main to register the set of transposition routines to benchmark */
void register_inners(void);


