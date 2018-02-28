/*** TTY version of Y86 Simulator *****/

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h> /* For sim_log */
#include <getopt.h>

#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

static void usage(char *name)
{
    printf("Usage: %s [FILE.yo] [-h] [-v 0-2] [-t]\n", name);
    printf("       -h Print this message\n");
    printf("       -v 0-2 Set verbosity level\n");
    printf("       -t Test result against ISA model\n");
    exit(0);
}

/* Run the simulator */
int sim_main(int argc, char *argv[])
{
    FILE *code_file = stdin;
    int instr_limit = 50000;
    int icount = 0;
    int byte_cnt = 0;
    bool_t verbosity = 2;
    exc_t status = EXC_NONE;
    cc_t result_cc = 0;
    char c;

    mem_t mem0, reg0;
    bool_t do_check = FALSE;
    state_ptr isa_state = NULL;

    while ((c = getopt(argc, argv, "hv:t")) != -1) {
	switch(c) {
	case 'h':
	    usage(argv[0]);
	    break;
	case 'c':
	    code_file = fopen(optarg, "r");
	    if (!code_file) {
		fprintf(stderr, "Couldn't open code file %s\n", optarg);
		exit(1);
	    }
	    break;
	case 'v':
	    verbosity = atoi(optarg);
	    if (verbosity < 0 || verbosity > 2)
		usage(argv[0]);
	    break;
	case 't':
	    do_check = TRUE;
	    break;
	default:
	    usage(argv[0]);
	    break;
	}
    }
    if (optind < argc-1) {
      usage(argv[0]);
    }
    if (optind < argc) {
      code_file = fopen(argv[optind], "r");
      if (!code_file) {
	fprintf(stderr, "Can't open code file %s\n", argv[optind]);
	exit(1);
      }
    }

    if (verbosity >= 2)
	sim_set_dumpfile(stdout);
    sim_init();

    byte_cnt = load_mem(mem, code_file, 1);
    if (byte_cnt == 0) {
	fprintf(stderr, "No lines of code found\n");
	exit(1);
    } else if (verbosity >= 2) {
	printf("%d bytes of code read\n", byte_cnt);
    }
    fclose(code_file);
    if (do_check) {
	isa_state = new_state(0);
	free_mem(isa_state->r);
	free_mem(isa_state->m);
	isa_state->m = copy_mem(mem);
	isa_state->r = copy_mem(reg);
	isa_state->cc = cc;
    }

    mem0 = copy_mem(mem);
    reg0 = copy_mem(reg);
    
    icount = sim_run_pipe(instr_limit, 5*instr_limit, &status, &result_cc);
    if (verbosity > 0) {
	printf("%d instructions executed\n", icount);
	printf("Exception status = %s\n", exc_name(status));
	printf("Condition Codes: %s\n", cc_name(result_cc));
	printf("Changed Register State:\n");
	diff_reg(reg0, reg, stdout);
	printf("Changed Memory State:\n");
	diff_mem(mem0, mem, stdout);
    }
    if (do_check) {
	exc_t e = EXC_NONE;
	int step;
	bool_t match = TRUE;

	for (step = 0; step < instr_limit && e == EXC_NONE; step++) {
	    e = step_state(isa_state, stdout);
	}

	if (diff_reg(isa_state->r, reg, NULL)) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Register != Pipeline Register File\n");
		diff_reg(isa_state->r, reg, stdout);
	    }
	}
	if (diff_mem(isa_state->m, mem, NULL)) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Memory != Pipeline Memory\n");
		diff_mem(isa_state->m, mem, stdout);
	    }
	}
	if (isa_state->cc != result_cc) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Cond. Codes (%s) != Pipeline Cond. Codes (%s)\n",
		       cc_name(isa_state->cc), cc_name(result_cc));
	    }
	}
	if (match) {
	    printf("ISA Check Succeeds\n");
	} else {
	    printf("ISA Check Fails\n");
	}
    }
    {
	double cpi = instructions > 0 ? (double) cycles/instructions : 1.0;
	printf("CPI: %d cycles/%d instructions = %.2f\n",
	       cycles, instructions, cpi);
    }
    exit(0);
}



