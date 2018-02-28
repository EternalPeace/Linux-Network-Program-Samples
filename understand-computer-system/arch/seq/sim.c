/******* sim.c: Sequential simulator for Y86 ***************/

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h> /* For sim_log */

#include "isa.h"
#include "sim.h"

/********************** Global Variables ****************/

/* Am I simulating SEQ or SEQ+? */
int plusmode = 1;

/* Both instruction and data memory */
mem_t mem;
int minAddr = 0;
int memCnt = 0;

/* Register file */
mem_t reg;
/* Condition code register */
cc_t cc = DEFAULT_CC;
/* Input to condition code register */
cc_t cc_in = DEFAULT_CC;

/* SEQ+: Results computed by previous instruction.
   Used to compute PC in current instruction */
byte_t prev_icode = I_NOP;
byte_t prev_ifun = 0;
word_t prev_valc = 0;
word_t prev_valm = 0;
word_t prev_valp = 0;
bool_t prev_bcond = FALSE;

byte_t prev_icode_in = I_NOP;
byte_t prev_ifun_in = 0;
word_t prev_valc_in = 0;
word_t prev_valm_in = 0;
word_t prev_valp_in = 0;
bool_t prev_bcond_in = FALSE;


/* Program counter */
word_t pc = 0;
/* Input to program counter */
word_t pc_in = 0;

/* Intermediate values */
byte_t icode = I_NOP;
word_t ifun = 0;
byte_t instr = HPACK(I_NOP, 0);
word_t ra = REG_NONE;
word_t rb = REG_NONE;
word_t valc = 0;
word_t valp = 0;

word_t srcA = REG_NONE;
word_t srcB = REG_NONE;
word_t destE = REG_NONE;
word_t destM = REG_NONE;
word_t vala = 0;
word_t valb = 0;
word_t vale = 0;

bool_t bcond = FALSE;
word_t valm = 0;

bool_t mem_write = FALSE;
word_t mem_addr = 0;
word_t mem_data = 0;

/* Values computed by control logic */
int gen_pc();  /* SEQ+ */
int gen_need_regids();
int gen_need_valC();
int gen_instr_valid();
int gen_srcA();
int gen_srcB();
int gen_dstE();
int gen_dstM();
int gen_aluA();
int gen_aluB();
int gen_alufun();
int gen_set_cc();
int gen_mem_addr();
int gen_mem_data();
int gen_mem_read();
int gen_mem_write();
int gen_new_pc();

/* Log file */
FILE *dumpfile = NULL;

/*****************************************************************************
 * reporting code
 *****************************************************************************/

#ifdef HAS_GUI
/* Representations of digits */
static char digits[16] =
   {'0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

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

/* used for formatting instructions */
static char status_msg[128];

/* SEQ+ */
static char *format_prev()
{
    char istring[9];
    char mstring[9];
    char pstring[9];
    wstring(prev_valc, 4, 32, istring);
    wstring(prev_valm, 4, 32, mstring);
    wstring(prev_valp, 4, 32, pstring);
    sprintf(status_msg, "%c %s %s %s %s",
	    prev_bcond ? 'Y' : 'N',
	    iname(HPACK(prev_icode, prev_ifun)),
	    istring, mstring, pstring);

    return status_msg;
}

static char *format_pc()
{
  char pstring[9];
  wstring(pc, 4, 32, pstring);
  sprintf(status_msg, "%s", pstring);
  return status_msg;
}

static char *format_f()
{
  char valcstring[9];
  char valpstring[9];
  wstring(valc, 4, 32, valcstring);
  wstring(valp, 4, 32, valpstring);
  sprintf(status_msg, "%s %s %s %s %s", 
	  iname(HPACK(icode, ifun)),
	  reg_name(ra),
	  reg_name(rb),
	  valcstring,
	  valpstring);
  return status_msg;
}

static char *format_d()
{
  char valastring[9];
  char valbstring[9];
  wstring(vala, 4, 32, valastring);
  wstring(valb, 4, 32, valbstring);
  sprintf(status_msg, "%s %s %s %s %s %s",
	  valastring,
	  valbstring,
	  reg_name(destE),
	  reg_name(destM),
	  reg_name(srcA),
	  reg_name(srcB));

  return status_msg;
}

static char *format_e()
{
    char valestring[9];
    wstring(vale, 4, 32, valestring);
    sprintf(status_msg, "%c %s",
	    bcond ? 'Y' : 'N',
	    valestring);
    return status_msg;
}

static char *format_m()
{
    char valmstring[9];
    wstring(valm, 4, 32, valmstring);
    sprintf(status_msg, "%s", valmstring);
    return status_msg;
}

static char *format_npc()
{
    char npcstring[9];
    wstring(pc_in, 4, 32, npcstring);
    sprintf(status_msg, "%s", npcstring);
    return status_msg;
}
#endif /* HAS_GUI */

/* Report system state */
static void sim_report() {
#ifdef HAS_GUI
  report_pc(pc);
  if (plusmode) {
    report_state("PREV", format_prev());
    report_state("PC", format_pc());
  } else {
    report_state("OPC", format_pc());
  }
  report_state("F", format_f());
  report_state("D", format_d());
  report_state("E", format_e());
  report_state("M", format_m());
  if (!plusmode) {
    report_state("NPC", format_npc());
  }
  show_cc(cc);
#endif
}

static int initialized = 0;

void sim_init()
{
    /* Create memory and register files */
    initialized = 1;
    mem = init_mem(1024);
    reg = init_reg();
    sim_reset();
    clear_mem(mem);
}

void sim_reset()
{
    if (!initialized)
	sim_init();
    clear_mem(reg);
    minAddr = 0;
    memCnt = 0;
#ifdef HAS_GUI
    signal_register_clear();
    create_memory_display(minAddr, memCnt);
    sim_report();
#endif
    if (plusmode) {
      prev_icode = prev_icode_in = I_NOP;
      prev_ifun = prev_ifun_in = 0;
      prev_valc = prev_valc_in = 0;
      prev_valm = prev_valm_in = 0;
      prev_valp = prev_valp_in = 0;
      prev_bcond = prev_bcond_in = FALSE;
      pc = 0;
    } else {
	pc_in = 0;
    }
    cc = DEFAULT_CC;
    cc_in = DEFAULT_CC;
    destE = REG_NONE;
    destM = REG_NONE;
    mem_write = FALSE;
    mem_addr = 0;
    mem_data = 0;

    /* Reset intermediate values to clear display */
    icode = I_NOP;
    ifun = 0;
    instr = HPACK(I_NOP, 0);
    ra = REG_NONE;
    rb = REG_NONE;
    valc = 0;
    valp = 0;

    srcA = REG_NONE;
    srcB = REG_NONE;
    destE = REG_NONE;
    destM = REG_NONE;
    vala = 0;
    valb = 0;
    vale = 0;

    bcond = FALSE;
    valm = 0;

    sim_report();
}

/* Update the processor state */
static exc_t update_state()
{
    exc_t status = EXC_NONE;
    if (plusmode) {
	prev_icode = prev_icode_in;
	prev_ifun  = prev_ifun_in;
	prev_valc  = prev_valc_in;
	prev_valm  = prev_valm_in;
	prev_valp  = prev_valp_in;
	prev_bcond = prev_bcond_in;
    } else {
	pc = pc_in;
    }
    cc = cc_in;
    /* Writeback */
    if (destE != REG_NONE)
	set_reg_val(reg, destE, vale);
    if (destM != REG_NONE)
	set_reg_val(reg, destM, valm);

    if (mem_write) {
	if (!set_word_val(mem, mem_addr, mem_data)) {
	    sim_log("Couldn't write to address 0x%x\n", mem_addr);
	    status = EXC_ADDR;
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
    return status;
}

/* Execute one instruction */
/* Return resulting exception status */
static exc_t sim_step()
{
    word_t aluA;
    word_t aluB;
    word_t alufun;
    exc_t status = update_state(); /* Update state from last cycle */

    if (plusmode) {
      pc = gen_pc();
    }
    valp = pc;
    if (get_byte_val(mem, valp, &instr)) {
	icode = HI4(instr);
	ifun = LO4(instr);
    } else {
	instr = HPACK(I_NOP,0);
	icode = I_NOP;
	ifun = 0;
	status = EXC_ADDR;
	sim_log("Couldn't fetch at address 0x%x\n", valp);
    }
    valp++;
    if (gen_need_regids()) {
	byte_t regids;
	if (get_byte_val(mem, valp, &regids)) {
	    ra = GET_RA(regids);
	    rb = GET_RB(regids);
	} else {
	    ra = REG_NONE;
	    rb = REG_NONE;
	    status = EXC_ADDR;
	    sim_log("Couldn't fetch at address 0x%x\n", valp);
	}
	valp++;
    } else {
	ra = REG_NONE;
	rb = REG_NONE;
    }

    if (gen_need_valC()) {
	if (get_word_val(mem, valp, &valc)) {
	} else {
	    valc = 0;
	    status = EXC_ADDR;
	    sim_log("Couldn't fetch at address 0x%x\n", valp);
	}
	valp+=4;
    } else {
	valc = 0;
    }

    if (status == EXC_NONE && !gen_instr_valid()) {
	status = EXC_INSTR;
    }

    sim_log("IF: Fetched %s at 0x%x.  ra=%s, rb=%s, valC = 0x%x\n",
	    iname(HPACK(icode,ifun)), pc, reg_name(ra), reg_name(rb), valc);

    if (status == EXC_NONE && icode == I_HALT) {
	status = EXC_HALT;
    }
    
    srcA = gen_srcA();
    if (srcA != REG_NONE) {
	vala = get_reg_val(reg, srcA);
    } else {
	vala = 0;
    }
    
    srcB = gen_srcB();
    if (srcB != REG_NONE) {
	valb = get_reg_val(reg, srcB);
    } else {
	valb = 0;
    }

    destE = gen_dstE();
    destM = gen_dstM();

    aluA = gen_aluA();
    aluB = gen_aluB();
    alufun = gen_alufun();
    vale = compute_alu(alufun, aluA, aluB);
    cc_in = cc;
    if (gen_set_cc())
	cc_in = compute_cc(alufun, aluA, aluB);

    bcond = (icode == I_JMP) && take_branch(cc, ifun);

    mem_addr = gen_mem_addr();
    mem_data = gen_mem_data();

    if (status == EXC_NONE && gen_mem_read()) {
	if (!get_word_val(mem, mem_addr, &valm)) {
	    sim_log("Couldn't read at address 0x%x\n", mem_addr);
	    return EXC_ADDR;
	}
    } else
	valm = 0;

    mem_write = status == EXC_NONE && gen_mem_write();

    if (plusmode) {
      prev_icode_in = icode;
      prev_ifun_in = ifun;
      prev_valc_in = valc;
      prev_valm_in = valm;
      prev_valp_in = valp;
      prev_bcond_in = bcond;
    } else {
      /* Update PC */
      pc_in = gen_new_pc();
    } 
    sim_report();
    return status;
}

/*
  Run processor until one of following occurs:
  - An exception is encountered in WB.
  - max_instr instructions have completed through WB

  Return number of instructions executed.
  if statusp nonnull, then will be set to exception status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
int sim_run(int max_instr, exc_t *statusp, cc_t *ccp)
{
  int icount = 0;
  exc_t status = EXC_NONE;
  while (icount < max_instr) {
      status = sim_step();
      icount++;
      if (status != EXC_NONE)
	  break;
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
