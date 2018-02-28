#include "csapp.h"
#include "mm.h"
#include "memlib.h"
#include "malloc.h"

#define MEMSIZE   20*(1<<20)

struct {
    int heapsize; /* suggested heap size (ignored) */
    int blocks;   /* number of distinct block indices */
    int ops;      /* number of malloc/free operations */
    int weight;   /* evaluation weight (ingored) */
} tracehdr;

int main(int argc, char **argv) 
{
    char c;
    char **p;         /* array of ptrs returned from malloc */
    char type;        /* 'm' (malloc) or 'f' (free) */
    int index, size;  /* block index and malloc size */
    int linenum = 4;  /* for error msgs, first lines are hdr info */
    int verbose = 0;  /* print the heap each time */

    /* parse command line arguments */
    while ((c = getopt(argc, argv, "vh")) != EOF)
        switch (c) {
        case 'v':
            verbose = 1;
            break;
	case 'h':
            fprintf(stderr, "Usage: %s [-v]\n", argv[0]);
            exit(0);
        default:
            fprintf(stderr, "Usage: %s [-v]\n", argv[0]);
            exit(0);
        }

    /* initialize the "memory system" */
    mem_init(MEMSIZE); 
    if (mm_init() < 0)
	unix_error("mm_init");
    
    /* read and interpret the trace file */
    scanf("%d\n", &tracehdr.heapsize);
    scanf("%d\n", &tracehdr.blocks);
    scanf("%d\n", &tracehdr.ops);
    scanf("%d\n", &tracehdr.weight);

    p = (char **)Malloc(tracehdr.blocks * sizeof(char *));

    while (1) {

	if (scanf("%c", &type) == EOF)
	    break;
	linenum++;
	switch (type) {

	case 'a':  /* malloc */
	    scanf("%d %d\n", &index, &size);
	    if (index < 0 || index >= tracehdr.blocks) {
		fprintf(stderr, "Error (line %d): Bad malloc() index (%d)\n",
		       linenum, index);
		exit(0);
	    }
	    if (verbose)
		printf("***p[%d] = malloc(%d)\n", index, size);
	    p[index] = (char *)mm_malloc(size);
	    if (!p[index]) {
		fprintf(stderr, "Error (line %d): malloc returned NULL ptr\n", 
		       linenum);
		perror("Malloc error");
		exit(0);
	    }
	    mm_checkheap(verbose);
	    break;

	case 'f':  /* free */
	    scanf("%d\n", &index);
	    if (index < 0 || index >= tracehdr.blocks) {
		fprintf(stderr, "Error (line %d): Bad free index (%d)\n",
		       linenum, index);
		exit(0);
	    }
	    if (!p[index]) {
		fprintf(stderr, "Error (line %d): Null free ptr (index %d)\n", 
		       linenum, index);
		exit(0);
	    }
	    if (verbose)
		printf("***free(p[%d]=%p)\n", index, p[index]);
	    mm_free(p[index]);
	    mm_checkheap(verbose);
	    break;
	    
	default:
	    fprintf(stderr, "Error (line %d): Unknown operator (%c)\n", 
		   linenum, type);
	    exit(0);
	}
    }
    exit(0);
}

