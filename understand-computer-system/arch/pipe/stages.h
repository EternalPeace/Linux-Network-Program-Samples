/* stages.h: Defines the layout of the pipe registers
   Declares the functions that implement the pipeline stages
*/


/********** Pipeline register contents **************/

/* Program Counter */
typedef struct {
    word_t pc;
    exc_t exception;
} pc_ele, *pc_ptr;

/* IF/ID Pipe Register */
typedef struct {
    byte_t icode;  /* Single byte instruction code */
    byte_t ifun;    /* ALU/JMP qualifier */
    byte_t ra; /* Register ra ID */
    byte_t rb; /* Register rb ID */
    word_t valc;  /* Instruction word encoding immediate data */
    word_t valp; /* Incremented program counter */
    exc_t exception;
    /* The following is included for debugging */
    word_t stage_pc;
} if_id_ele, *if_id_ptr;

/* ID/EX Pipe Register */
typedef struct {
    byte_t icode;        /* Instruction code */
    byte_t ifun;          /* ALU/JMP qualifier */
    word_t valc;          /* Immediate data */
    word_t vala;        /* Va */
    word_t valb;        /* Vb */
    byte_t srca; /* Source Reg ID for Va */
    byte_t srcb; /* Source Reg ID for Vb */
    byte_t deste; /* Destination register for Ve */
    byte_t destm; /* Destination register for Vm */
    exc_t exception;
    /* The following is included for debugging */
    word_t stage_pc;
} id_ex_ele, *id_ex_ptr;

/* EX/MEM Pipe Register */
typedef struct {
    byte_t icode;        /* Instruction code */
    byte_t ifun;          /* ALU/JMP qualifier */
    bool_t takebranch;  /* Taken branch signal */
    word_t vale;        /* Ve */
    word_t vala;        /* Va */
    byte_t deste; /* Destination register for Ve */
    byte_t destm; /* Destination register for Vm */
    byte_t srca;  /* Source register for Va */
    exc_t exception;
    /* The following is included for debugging */
    word_t stage_pc;
} ex_mem_ele, *ex_mem_ptr;

/* Mem/WB Pipe Register */
typedef struct {
    byte_t icode;        /* Instruction code */
    byte_t ifun;          /* ALU/JMP qualifier */
    word_t vale;         /* Ve */
    word_t valm;         /* Vm */
    byte_t deste; /* Destination register for Ve */
    byte_t destm; /* Destination register for Vm */
    exc_t exception;
    /* The following is included for debugging */
    word_t stage_pc;
} mem_wb_ele, *mem_wb_ptr;

/************ Global Declarations ********************/

extern pc_ele bubble_pc;
extern if_id_ele bubble_if_id;
extern id_ex_ele bubble_id_ex;
extern ex_mem_ele bubble_ex_mem;
extern mem_wb_ele bubble_mem_wb;

/************ Function declarations *******************/

/* Stage functions */
void do_if_stage();
void do_id_wb_stages();  /* Both ID and WB */
void do_ex_stage();
void do_mem_stage();

/* Set stalling conditions for different stages */
void do_stall_check();


