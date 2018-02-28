#include <stdio.h>
#include <stdlib.h>
#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"


/*************** Bubbled version of stages *************/

pc_ele bubble_pc = {0,EXC_NONE};
if_id_ele bubble_if_id = { I_NOP, 0, REG_NONE,REG_NONE,
			   0, 0, EXC_BUBBLE, 0};
id_ex_ele bubble_id_ex = { I_NOP, 0, 0, 0, 0,
			   REG_NONE, REG_NONE, REG_NONE, REG_NONE,
			   EXC_BUBBLE, 0};

ex_mem_ele bubble_ex_mem = { I_NOP, 0, FALSE, 0, 0,
			     REG_NONE, REG_NONE, EXC_BUBBLE, 0};

mem_wb_ele bubble_mem_wb = { I_NOP, 0, 0, 0, REG_NONE, REG_NONE,
			     EXC_BUBBLE, 0};

/*************** Stage Implementations *****************/

int gen_f_pc();
int gen_need_regids();
int gen_need_valC();
int gen_instr_valid();
int gen_new_F_predPC();
int gen_new_D_icode();

void do_if_stage()
{
    exc_t nstatus = EXC_NONE;
    word_t fetchpc = gen_f_pc();
    word_t valp = fetchpc;
    bool_t fetch_ok;
    byte_t instr;
    byte_t regids = HPACK(REG_NONE, REG_NONE);
    word_t valc = 0;

    f_pc = fetchpc;

    if (fetchpc == 0) {
	sim_log("Fetch: Fetch pc = 0, nominal pc = 0x%x\n",
		pc_curr->pc);
    }

    /* Ready to fetch instruction.  Speculatively fetch register byte
       and immediate word
    */
    fetch_ok = get_byte_val(mem, valp, &instr);
    if (fetch_ok) {
	if_id_next->icode = GET_ICODE(instr);
	if_id_next->ifun = GET_FUN(instr);
    } else {
	if_id_next->icode = I_NOP;
	if_id_next->ifun = 0;
	nstatus = EXC_ADDR;
    }
    valp++;
    if (fetch_ok && gen_need_regids()) {
	fetch_ok = get_byte_val(mem, valp, &regids);
	valp ++;
    }
    if_id_next->ra = HI4(regids);
    if_id_next->rb = LO4(regids);
    if (fetch_ok && gen_need_valC()) {
	fetch_ok = get_word_val(mem, valp, &valc);
	valp+= 4;
    }
    if_id_next->valp = valp;
    if_id_next->valc = valc;

    pc_next->pc = gen_new_F_predPC();

    if (!gen_instr_valid())
	{
	    byte_t instr = HPACK(if_id_next->icode, if_id_next->ifun);
	    sim_log("Fetch: Instruction code %s (0x%x) invalid\n",
		    iname(instr), instr);
	    nstatus = EXC_INSTR;
	}

    pc_next->exception = (nstatus == EXC_NONE) ? EXC_NONE : EXC_BUBBLE;

    if_id_next->stage_pc = fetchpc;
    if_id_next->exception = nstatus;

    /* Recompute icode for one-write implementation of popl */
    if_id_next->icode = gen_new_D_icode();

    sim_log("Fetch: Fetched %s at 0x%x, ra = %s, rb = %s, valp = 0x%x, status = %s\n",
	    iname(HPACK(if_id_next->icode, if_id_next->ifun)),
	    if_id_next->stage_pc,
	    reg_name(if_id_next->ra), reg_name(if_id_next->rb),
	    if_id_next->valp,
	    exc_name(nstatus));
}

int gen_new_E_srcA();
int gen_new_E_srcB();
int gen_new_E_dstE();
int gen_new_E_dstM();
int gen_new_E_valA();
int gen_new_E_valB();
int gen_w_dstE();
int gen_w_valE();
int gen_w_dstM();
int gen_w_valM();

/* Implements both ID and WB */
void do_id_wb_stages()
{
    /* Set up write backs.  Don't occur until end of cycle */
    wb_destE = gen_w_dstE();
    wb_valE = gen_w_valE();
    wb_destM = gen_w_dstM();
    wb_valM = gen_w_valM();

    id_ex_next->srca = gen_new_E_srcA();
    id_ex_next->srcb = gen_new_E_srcB();
    id_ex_next->deste = gen_new_E_dstE();
    id_ex_next->destm = gen_new_E_dstM();

    /* Read the registers */
    d_regvala = get_reg_val(reg, id_ex_next->srca);
    d_regvalb = get_reg_val(reg, id_ex_next->srcb);

    /* Do forwarding and valA selection */
    id_ex_next->vala = gen_new_E_valA();
    id_ex_next->valb = gen_new_E_valB();

    id_ex_next->icode = if_id_curr->icode;
    id_ex_next->ifun = if_id_curr->ifun;
    id_ex_next->valc = if_id_curr->valc;
    id_ex_next->stage_pc = if_id_curr->stage_pc;
    id_ex_next->exception = (if_id_curr->icode == I_HALT) ?
	EXC_HALT : if_id_curr->exception;
    sim_log("Decode: instr = %s, exc=%s\n",
	    iname(HPACK(if_id_curr->icode, if_id_curr->ifun)),
	    exc_name(if_id_curr->exception));
}

int gen_alufun();
int gen_set_cc();
int gen_Bch();
int gen_aluA();
int gen_aluB();
int gen_new_M_valA();

void do_ex_stage()
{
    alu_t alufun = gen_alufun();
    bool_t setcc = gen_set_cc();
    word_t alua, alub;

    alua = gen_aluA();
    alub = gen_aluB();

    e_bcond = 	take_branch(cc, id_ex_curr->ifun);
    
    ex_mem_next->takebranch = id_ex_curr->icode == I_JMP &&
	e_bcond;

    if (id_ex_curr->icode == I_JMP)
	sim_log("Execute: %s instruction, cc = %s, branch %staken\n",
		iname(HPACK(id_ex_curr->icode, id_ex_curr->ifun)),
		cc_name(cc),
		ex_mem_next->takebranch ? "" : "not ");
    
    /* Perform the ALU operation */
    ex_mem_next->vale = compute_alu(alufun, alua, alub);

    {
	byte_t instr = HPACK(id_ex_curr->icode, id_ex_curr->ifun);
	sim_log("Execute: Instruction %s\n",
		iname(instr));
    }

    if (setcc) {
	cc_in = compute_cc(alufun, alua, alub);
	sim_log("Execute: CC cc = %s\n", cc_name(cc_in));
    }

    ex_mem_next->icode = id_ex_curr->icode;
    ex_mem_next->ifun = id_ex_curr->ifun;
    ex_mem_next->vala = gen_new_M_valA();
    ex_mem_next->deste = id_ex_curr->deste;
    ex_mem_next->destm = id_ex_curr->destm;
    ex_mem_next->srca = id_ex_curr->srca;
    ex_mem_next->exception = id_ex_curr->exception;
    ex_mem_next->stage_pc = id_ex_curr->stage_pc;
}

/* Functions defined using HCL */
int gen_mem_addr();
int gen_mem_read();
int gen_mem_write();

void do_mem_stage()
{
    bool_t read = gen_mem_read();
    bool_t mem_ok = TRUE;
    word_t valm = 0;

    mem_addr = gen_mem_addr();
    mem_data = ex_mem_curr->vala;
    mem_write = gen_mem_write();

    if (read) {
	mem_ok = get_word_val(mem, mem_addr, &valm);
	sim_log("Memory: Read 0x%x from 0x%x, instruction = %s\n",
		valm, mem_addr,
		iname(HPACK(ex_mem_curr->icode, ex_mem_curr->ifun)));
    }
    if (mem_write) {
	word_t sink;
	/* Do a read of address just to check validity */
	mem_ok = get_word_val(mem, mem_addr, &sink);
    }
    mem_wb_next->icode = ex_mem_curr->icode;
    mem_wb_next->ifun = ex_mem_curr->ifun;
    mem_wb_next->vale = ex_mem_curr->vale;
    mem_wb_next->valm = valm;
    mem_wb_next->deste = ex_mem_curr->deste;
    mem_wb_next->destm = ex_mem_curr->destm;
    mem_wb_next->exception = mem_ok ? ex_mem_curr->exception : EXC_ADDR;
    mem_wb_next->stage_pc = ex_mem_curr->stage_pc;
}

/* Set stalling conditions for different stages */

int gen_F_stall(), gen_F_bubble();
int gen_D_stall(), gen_D_bubble();
int gen_E_stall(), gen_E_bubble();
int gen_M_stall(), gen_M_bubble();

p_status_t pipe_cntl(char *name, int stall, int bubble)
{
    if (stall) {
	if (bubble) {
	    sim_log("%s: Conflicting control signals for pipe register\n",
		    name);
	    return P_ERROR;
	} else 
	    return P_STALL;
    } else {
	return bubble ? P_BUBBLE : P_LOAD;
    }
}

void do_stall_check()
{
    pc_state->op = pipe_cntl("PC", gen_F_stall(), gen_F_bubble());
    if_id_state->op = pipe_cntl("ID", gen_D_stall(), gen_D_bubble());
    id_ex_state->op = pipe_cntl("EX", gen_E_stall(), gen_E_bubble());
    ex_mem_state->op = pipe_cntl("MEM", gen_M_stall(), gen_M_bubble());
}

