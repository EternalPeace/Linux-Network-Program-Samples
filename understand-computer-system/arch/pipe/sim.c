/******* sim.c: Pipelined simulator for Y86 ***************/

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h> /* For sim_log */

#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

/********************** Global Variables ****************/

/* Performance monitoring */

/* Has simulator gotten past initial bubbles? */
static int starting_up = 1;

/* How many cycles have been simulated? */
int cycles = 0;
/* How many instructions have passed through the WB stage? */
int instructions = 0;

/* Both instruction and data memory */
mem_t mem;
int minAddr = 0;
int memCnt = 0;

/* Register file */
mem_t reg;
/* Condition code register */
cc_t cc;


/* Pending updates to state */
word_t cc_in = DEFAULT_CC;
word_t wb_destE = REG_NONE;
word_t wb_valE = 0;
word_t wb_destM = REG_NONE;
word_t wb_valM = 0;
word_t mem_addr = 0;
word_t mem_data = 0;
bool_t mem_write = FALSE;


/* EX Operand sources */
mux_source_t amux = MUX_NONE;
mux_source_t bmux = MUX_NONE;

/* Current and next states of all pipeline registers */
pc_ptr pc_curr;
if_id_ptr if_id_curr;
id_ex_ptr id_ex_curr;
ex_mem_ptr ex_mem_curr;
mem_wb_ptr mem_wb_curr;

pc_ptr pc_next;
if_id_ptr if_id_next;
id_ex_ptr id_ex_next;
ex_mem_ptr ex_mem_next;
mem_wb_ptr mem_wb_next;

/* Intermediate values */
word_t f_pc;
word_t d_regvala;
word_t d_regvalb;
word_t e_vala;
word_t e_valb;
bool_t e_bcond;

/* The pipeline state */
pipe_ptr pc_state, if_id_state, id_ex_state, ex_mem_state, mem_wb_state;

/* Simulator operating mode */
sim_mode_t sim_mode = S_FORWARD;
/* Log file */
FILE *dumpfile = NULL;

/*****************************************************************************
 * reporting code
 *****************************************************************************/

#ifdef HAS_GUI
/* used for formatting instructions */
static char status_msg[128];

static char *format_pc(pc_ptr state)
{
  char pstring[9];
  wstring(state->pc, 4, 32, pstring);
  sprintf(status_msg, "%s %s", exc_name(state->exception), pstring);
  return status_msg;
}

static char *format_if_id(if_id_ptr state)
{
  char valcstring[9];
  char valpstring[9];
  wstring(state->valc, 4, 32, valcstring);
  wstring(state->valp, 4, 32, valpstring);
  sprintf(status_msg, "%s %s %s %s %s %s",
	  exc_name(state->exception),
	  iname(HPACK(state->icode,state->ifun)),
	  reg_name(state->ra),
	  reg_name(state->rb),
	  valcstring,
	  valpstring);
  return status_msg;
}

static char *format_id_ex(id_ex_ptr state)
{
  char valcstring[9];
  char valastring[9];
  char valbstring[9];
  wstring(state->valc, 4, 32, valcstring);
  wstring(state->vala, 4, 32, valastring);
  wstring(state->valb, 4, 32, valbstring);
  sprintf(status_msg, "%s %s %s %s %s %s %s %s %s",
	  exc_name(state->exception),
	  iname(HPACK(state->icode, state->ifun)),
	  valcstring,
	  valastring,
	  valbstring,
	  reg_name(state->deste),
	  reg_name(state->destm),
	  reg_name(state->srca),
	  reg_name(state->srcb));
  return status_msg;
}

static char *format_ex_mem(ex_mem_ptr state)
{
    char valestring[9];
    char valastring[9];
    wstring(state->vale, 4, 32, valestring);
    wstring(state->vala, 4, 32, valastring);
    sprintf(status_msg, "%s %s %c %s %s %s %s",
	    exc_name(state->exception),
	    iname(HPACK(state->icode, state->ifun)),
	    state->takebranch ? 'Y' : 'N',
	    valestring,
	    valastring,
	    reg_name(state->deste),
	    reg_name(state->destm));

  return status_msg;
}

static char *format_mem_wb(mem_wb_ptr state)
{
    char valestring[9];
    char valmstring[9];
    wstring(state->vale, 4, 32, valestring);
    wstring(state->valm, 4, 32, valmstring);
    sprintf(status_msg, "%s %s %s %s %s %s",
	    exc_name(state->exception),
	    iname(HPACK(state->icode, state->ifun)),
	    valestring,
	    valmstring,
	    reg_name(state->deste),
	    reg_name(state->destm));

  return status_msg;
}
#endif /* HAS_GUI */

/* Report system state */
static void sim_report() {
#ifdef HAS_GUI
  report_pc(f_pc, pc_curr->exception != EXC_BUBBLE,
	    if_id_curr->stage_pc, if_id_curr->exception != EXC_BUBBLE,
	    id_ex_curr->stage_pc, id_ex_curr->exception != EXC_BUBBLE,
	    ex_mem_curr->stage_pc, ex_mem_curr->exception != EXC_BUBBLE,
	    mem_wb_curr->stage_pc, mem_wb_curr->exception != EXC_BUBBLE);
  report_state("F", 0, format_pc(pc_next));
  report_state("F", 1, format_pc(pc_curr));
  report_state("D", 0, format_if_id(if_id_next));
  report_state("D", 1, format_if_id(if_id_curr));
  report_state("E", 0, format_id_ex(id_ex_next));
  report_state("E", 1, format_id_ex(id_ex_curr));
  report_state("M", 0, format_ex_mem(ex_mem_next));
  report_state("M", 1, format_ex_mem(ex_mem_curr));
  report_state("W", 0, format_mem_wb(mem_wb_next));
  report_state("W", 1, format_mem_wb(mem_wb_curr));
  /* signal_sources(); */
  show_cc(cc);
  show_cpi();
#endif
}

/*****************************************************************************
 * pipeline control
 * These functions can be used to handle hazards
 *****************************************************************************/

/* bubble stage (has effect at next update) */
void sim_bubble_stage(stage_id_t stage) {
  switch (stage)
    {
    case IF_STAGE : pc_state->op     = P_BUBBLE; break;
    case ID_STAGE : if_id_state->op  = P_BUBBLE; break;
    case EX_STAGE : id_ex_state->op  = P_BUBBLE; break;
    case MEM_STAGE: ex_mem_state->op = P_BUBBLE; break;
    case WB_STAGE : mem_wb_state->op = P_BUBBLE; break;
    }
}

/* stall stage (has effect at next update) */
void sim_stall_stage(stage_id_t stage) {
  switch (stage)
    {
    case IF_STAGE : pc_state->op     = P_STALL; break;
    case ID_STAGE : if_id_state->op  = P_STALL; break;
    case EX_STAGE : id_ex_state->op  = P_STALL; break;
    case MEM_STAGE: ex_mem_state->op = P_STALL; break;
    case WB_STAGE : mem_wb_state->op = P_STALL; break;
    }
}


static int initialized = 0;

void sim_init()
{
    /* Create memory and register files */
    initialized = 1;
    mem = init_mem(1024);
    reg = init_reg();
    
    /* create 5 pipe registers */
    pc_state     = new_pipe(sizeof(pc_ele), (void *) &bubble_pc);
    if_id_state  = new_pipe(sizeof(if_id_ele), (void *) &bubble_if_id);
    id_ex_state  = new_pipe(sizeof(id_ex_ele), (void *) &bubble_id_ex);
    ex_mem_state = new_pipe(sizeof(ex_mem_ele), (void *) &bubble_ex_mem);
    mem_wb_state = new_pipe(sizeof(mem_wb_ele), (void *) &bubble_mem_wb);
  
    /* connect them to the pipeline stages */
    pc_next   = pc_state->next;
    pc_curr   = pc_state->current;
  
    if_id_next = if_id_state->next;
    if_id_curr = if_id_state->current;

    id_ex_next = id_ex_state->next;
    id_ex_curr = id_ex_state->current;

    ex_mem_next = ex_mem_state->next;
    ex_mem_curr = ex_mem_state->current;

    mem_wb_next = mem_wb_state->next;
    mem_wb_curr = mem_wb_state->current;

    sim_reset();
    clear_mem(mem);
}

void sim_reset()
{
    if (!initialized)
	sim_init();
    clear_pipes();
    clear_mem(reg);
    minAddr = 0;
    memCnt = 0;
    starting_up = 1;
    cycles = instructions = 0;
#ifdef HAS_GUI
    signal_register_clear();
    create_memory_display(minAddr, memCnt);
#endif
    amux = bmux = MUX_NONE;
    cc = cc_in = DEFAULT_CC;
    wb_destE = REG_NONE;
    wb_valE = 0;
    wb_destM = REG_NONE;
    wb_valM = 0;
    mem_addr = 0;
    mem_data = 0;
    mem_write = FALSE;
    sim_report();
}

/* Update state elements */
/* May need to disable updating of memory & condition codes */
static void update_state(bool_t update_mem, bool_t update_cc)
{
    /* Writeback(s):
       If either register is REG_NONE, write will have no effect .
       Order of two writes determines semantics of
       popl %esp.  According to ISA, %esp will get popped value
    */

    if (wb_destE != REG_NONE) {
	sim_log("Writeback: Wrote 0x%x to register %s\n",
		wb_valE, reg_name(wb_destE));
	set_reg_val(reg, wb_destE, wb_valE);
    }
    if (wb_destM != REG_NONE) {
	sim_log("Writeback: Wrote 0x%x to register %s\n",
		wb_valM, reg_name(wb_destM));
	set_reg_val(reg, wb_destM, wb_valM);
    }

    /* Memory write */
    if (mem_write && !update_mem) {
	sim_log("Disabled write of 0x%x to address 0x%x\n", mem_data, mem_addr);
    }
    if (update_mem && mem_write) {
	if (!set_word_val(mem, mem_addr, mem_data)) {
	    sim_log("Couldn't write to address 0x%x\n", mem_addr);
	} else {
	    sim_log("Wrote 0x%x to address 0x%x\n", mem_data, mem_addr);
#ifdef HAS_GUI
	    if (mem_addr % 4 != 0) {
		/* Just did a misaligned write.
		   Need to display both words */
		word_t align_addr = mem_addr & ~0x3;
		word_t val;
		get_word_val(mem, align_addr, &val);
		set_memory(align_addr, val);
		align_addr+=4;
		get_word_val(mem, align_addr, &val);
		set_memory(align_addr, val);
	    } else {
		set_memory(mem_addr, mem_data);
	    }
#endif
	}
    }
    if (update_cc)
	cc = cc_in;
}

/* Run pipeline for one cycle */
/* Return exception status of instruction in WB */
/* Max_instr indicates maximum number of instructions that
   want to complete during this simulation run.  */
static exc_t sim_step_pipe(int max_instr)
{
    exc_t wb_exc = mem_wb_curr->exception;
    exc_t mem_exc = mem_wb_next->exception;
    /* How many instructions are ahead of one in wb / ex? */
    int ahead_mem = (wb_exc != EXC_BUBBLE);
    int ahead_ex = ahead_mem + (mem_exc != EXC_BUBBLE);
    bool_t wb_ok = (wb_exc == EXC_NONE) || (wb_exc == EXC_BUBBLE);
    bool_t mem_ok = (mem_exc == EXC_NONE) || (mem_exc == EXC_BUBBLE);
    bool_t update_mem = wb_ok && ahead_mem < max_instr;
    bool_t update_cc = update_mem && mem_ok && ahead_ex < max_instr;

    if (!update_mem) {
	sim_log("Disabling memory write.  wb_exc = %s\n", exc_name(wb_exc));
    }

    /* Update program-visible state */
    update_state(update_mem, update_cc);
    /* Update pipe registers */
    update_pipes();
    if (pc_state->op == P_ERROR)
	pc_curr->exception = EXC_PIPE;
    if (if_id_state->op == P_ERROR)
	if_id_curr->exception = EXC_PIPE;
    if (id_ex_state->op == P_ERROR)
	id_ex_curr->exception = EXC_PIPE;
    if (ex_mem_state->op == P_ERROR)
	ex_mem_curr->exception = EXC_PIPE;
    if (mem_wb_state->op == P_ERROR)
	mem_wb_curr->exception = EXC_PIPE;
    
    /* Need to do decode after execute & memory stages,
       and memory stage before execute, in order to propagate
       forwarding values properly */
    do_if_stage();
    do_mem_stage();
    do_ex_stage();
    do_id_wb_stages();

    do_stall_check();
    if (id_ex_curr->exception != EXC_NONE
	&& id_ex_curr->exception != EXC_BUBBLE) {
	if_id_state->op = P_BUBBLE;
	id_ex_state->op = P_BUBBLE;
    }

    /* Performance monitoring */
    if (mem_wb_curr->exception != EXC_BUBBLE && mem_wb_curr->icode != I_POP2) {
	starting_up = 0;
	instructions++;
	cycles++;
    } else {
	if (!starting_up)
	    cycles++;
    }
    
    sim_report();
    return mem_wb_curr->exception;
}

/*
  Run pipeline until one of following occurs:
  - An exception is encountered in WB.
  - max_instr instructions have completed through WB
  - max_cycle cycles have been simulated

  Return number of instructions executed.
  if statusp nonnull, then will be set to exception status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
int sim_run_pipe(int max_instr, int max_cycle, exc_t *statusp, cc_t *ccp)
{
  int icount = 0;
  int ccount = 0;
  exc_t status = EXC_NONE;
  while (icount < max_instr && ccount < max_cycle) {
      status = sim_step_pipe(max_instr-icount);
      if (status != EXC_BUBBLE)
	  icount++;
      if (status != EXC_NONE && status != EXC_BUBBLE)
	  break;
      ccount++;
  }
  if (statusp)
      *statusp = status;
  if (ccp)
      *ccp = cc;
  return icount;
}

/* If dumpfile set nonNULL, lots of status info printed out */
void sim_set_dumpfile(FILE *df)
{
  dumpfile = df;
}

/*
 * sim_log dumps a formatted string to the dumpfile, if it exists
 * accepts variable argument list
 */
void sim_log( const char *format, ... ) {
  if (dumpfile) {
    va_list arg;
    va_start( arg, format );
    vfprintf( dumpfile, format, arg );
    va_end( arg );
    }
}
