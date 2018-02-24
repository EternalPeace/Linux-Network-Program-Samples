/* Machine-dependent hooks for the unix child process stratum.  This
   code is for the HP PA-RISC cpu.

   Copyright 1986, 1987, 1989, 1990, 1991, 1992 Free Software Foundation, Inc.

   Contributed by the Center for Software Science at the
   University of Utah (pa-gdb-bugs@cs.utah.edu).

This file is part of GDB.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

#include "defs.h"
#include "inferior.h"

#ifndef PT_ATTACH
#define PT_ATTACH PTRACE_ATTACH
#endif
#ifndef PT_DETACH
#define PT_DETACH PTRACE_DETACH
#endif

/* This function simply calls ptrace with the given arguments.  
   It exists so that all calls to ptrace are isolated in this 
   machine-dependent file. */
#ifdef WANT_NATIVE_TARGET
int
call_ptrace (request, pid, addr, data)
     int request, pid;
     PTRACE_ARG3_TYPE addr;
     int data;
{
  return ptrace (request, pid, addr, data);
}
#endif /* WANT_NATIVE_TARGET */

#ifdef DEBUG_PTRACE
/* For the rest of the file, use an extra level of indirection */
/* This lets us breakpoint usefully on call_ptrace. */
#define ptrace call_ptrace
#endif

void
kill_inferior ()
{
  if (inferior_pid == 0)
    return;
  ptrace (PT_KILL, inferior_pid, (PTRACE_ARG3_TYPE) 0, 0);
  wait ((int *)0);
  target_mourn_inferior ();
}

#ifdef ATTACH_DETACH
/* Nonzero if we are debugging an attached process rather than
   an inferior.  */
extern int attach_flag;

/* Start debugging the process whose number is PID.  */
int
attach (pid)
     int pid;
{
  errno = 0;
  ptrace (PT_ATTACH, pid, (PTRACE_ARG3_TYPE) 0, 0);
  if (errno)
    perror_with_name ("ptrace");
  attach_flag = 1;
  return pid;
}

/* Stop debugging the process whose number is PID
   and continue it with signal number SIGNAL.
   SIGNAL = 0 means just continue it.  */

void
detach (signal)
     int signal;
{
  errno = 0;
  ptrace (PT_DETACH, inferior_pid, (PTRACE_ARG3_TYPE) 1, signal);
  if (errno)
    perror_with_name ("ptrace");
  attach_flag = 0;
}
#endif /* ATTACH_DETACH */



#if !defined (FETCH_INFERIOR_REGISTERS)

/* KERNEL_U_ADDR is the amount to subtract from u.u_ar0
   to get the offset in the core file of the register values.  */
#if defined (KERNEL_U_ADDR_BSD)
/* Get kernel_u_addr using BSD-style nlist().  */
CORE_ADDR kernel_u_addr;

#include <a.out.gnu.h>		/* For struct nlist */

void
_initialize_kernel_u_addr ()
{
  struct nlist names[2];

  names[0].n_un.n_name = "_u";
  names[1].n_un.n_name = NULL;
  if (nlist ("/vmunix", names) == 0)
    kernel_u_addr = names[0].n_value;
  else
    fatal ("Unable to get kernel u area address.");
}
#endif /* KERNEL_U_ADDR_BSD.  */

#if defined (KERNEL_U_ADDR_HPUX)
/* Get kernel_u_addr using HPUX-style nlist().  */
CORE_ADDR kernel_u_addr;

struct hpnlist {      
        char *          n_name;
        long            n_value;  
        unsigned char   n_type;   
        unsigned char   n_length;  
        short           n_almod;   
        short           n_unused;
};
static struct hpnlist nl[] = {{ "_u", -1, }, { (char *) 0, }};

/* read the value of the u area from the hp-ux kernel */
void _initialize_kernel_u_addr ()
{
    struct user u;
    nlist ("/hp-ux", &nl);
    kernel_u_addr = nl[0].n_value;
}
#endif /* KERNEL_U_ADDR_HPUX.  */

#if !defined (offsetof)
#define offsetof(TYPE, MEMBER) ((unsigned long) &((TYPE *)0)->MEMBER)
#endif

/* U_REGS_OFFSET is the offset of the registers within the u area.  */
#if !defined (U_REGS_OFFSET)
#define U_REGS_OFFSET \
  ptrace (PT_READ_U, inferior_pid, \
          (PTRACE_ARG3_TYPE) (offsetof (struct user, u_ar0)), 0) \
    - KERNEL_U_ADDR
#endif

/* Registers we shouldn't try to fetch.  */
#if !defined (CANNOT_FETCH_REGISTER)
#define CANNOT_FETCH_REGISTER(regno) 0
#endif

/* Fetch one register.  */

static void
fetch_register (regno)
     int regno;
{
  register unsigned int regaddr;
  char buf[MAX_REGISTER_RAW_SIZE];
  char mess[128];				/* For messages */
  register int i;

  /* Offset of registers within the u area.  */
  unsigned int offset;

  if (CANNOT_FETCH_REGISTER (regno))
    {
      bzero (buf, REGISTER_RAW_SIZE (regno));	/* Supply zeroes */
      supply_register (regno, buf);
      return;
    }

  offset = U_REGS_OFFSET;

  regaddr = register_addr (regno, offset);
  for (i = 0; i < REGISTER_RAW_SIZE (regno); i += sizeof (int))
    {
      errno = 0;
      *(int *) &buf[i] = ptrace (PT_RUREGS, inferior_pid,
				 (PTRACE_ARG3_TYPE) regaddr, 0);
      regaddr += sizeof (int);
      if (errno != 0)
	{
	  sprintf (mess, "reading register %s (#%d)", reg_names[regno], regno);
	  perror_with_name (mess);
	}
    }
  supply_register (regno, buf);
}

#endif /* !defined (FETCH_INFERIOR_REGISTERS).  */
/* Fetch all registers, or just one, from the child process.  */

#ifndef FETCH_INFERIOR_REGISTERS
void
fetch_inferior_registers (regno)
     int regno;
{
  if (regno == -1)
    for (regno = 0; regno < NUM_REGS; regno++)
      fetch_register (regno);
  else
    fetch_register (regno);
}

/* Registers we shouldn't try to store.  */
#if !defined (CANNOT_STORE_REGISTER)
#define CANNOT_STORE_REGISTER(regno) 0
#endif

/* Store our register values back into the inferior.
   If REGNO is -1, do this for all registers.
   Otherwise, REGNO specifies which register (so we can save time).  */

void
store_inferior_registers (regno)
     int regno;
{
  register unsigned int regaddr;
  char buf[80];
  extern char registers[];
  register int i;

  unsigned int offset = U_REGS_OFFSET;

  if (regno >= 0)
    {
      regaddr = register_addr (regno, offset);
      for (i = 0; i < REGISTER_RAW_SIZE (regno); i += sizeof(int))
	{
	  errno = 0;
	  ptrace (PT_WRITE_U, inferior_pid, (PTRACE_ARG3_TYPE) regaddr,
		  *(int *) &registers[REGISTER_BYTE (regno) + i]);
	  if (errno != 0)
	    {
	      sprintf (buf, "writing register number %d(%d)", regno, i);
	      perror_with_name (buf);
	    }
	  regaddr += sizeof(int);
	}
    }
  else
    {
      for (regno = 0; regno < NUM_REGS; regno++)
	{
	  if (CANNOT_STORE_REGISTER (regno))
	    continue;
	  regaddr = register_addr (regno, offset);
	  for (i = 0; i < REGISTER_RAW_SIZE (regno); i += sizeof(int))
	    {
	      errno = 0;
	      ptrace (PT_WRITE_U, inferior_pid, (PTRACE_ARG3_TYPE) regaddr,
		      *(int *) &registers[REGISTER_BYTE (regno) + i]);
	      if (errno != 0)
		{
		  sprintf (buf, "writing register number %d(%d)", regno, i);
		  perror_with_name (buf);
		}
	      regaddr += sizeof(int);
	    }
	}
    }
  return;
}
#endif /* !defined(FETCH_INFERIOR_REGISTERS) */

/* Resume execution of the inferior process.
   If STEP is nonzero, single-step it.
   If SIGNAL is nonzero, give it that signal.  */

void
child_resume (step, signal)
     int step;
     int signal;
{
  errno = 0;

  /* An address of (PTRACE_ARG3_TYPE) 1 tells ptrace to continue from where
     it was. (If GDB wanted it to start some other way, we have already
     written a new PC value to the child.)  */

  if (step)
    ptrace (PT_STEP, inferior_pid, (PTRACE_ARG3_TYPE) 1, signal);
  else
    ptrace (PT_CONTINUE, inferior_pid, (PTRACE_ARG3_TYPE) 1, signal);

  if (errno)
    perror_with_name ("ptrace");
}

/* NOTE! I tried using PTRACE_READDATA, etc., to read and write memory
   in the NEW_SUN_PTRACE case.
   It ought to be straightforward.  But it appears that writing did
   not write the data that I specified.  I cannot understand where
   it got the data that it actually did write.  */

/* Copy LEN bytes to or from inferior's memory starting at MEMADDR
   to debugger memory starting at MYADDR.   Copy to inferior if
   WRITE is nonzero.
  
   Returns the length copied, which is either the LEN argument or zero.
   This xfer function does not do partial moves, since child_ops
   doesn't allow memory operations to cross below us in the target stack
   anyway.  */

int
child_xfer_memory (memaddr, myaddr, len, write, target)
     CORE_ADDR memaddr;
     char *myaddr;
     int len;
     int write;
     struct target_ops *target;		/* ignored */
{
  register int i;
  /* Round starting address down to longword boundary.  */
  register CORE_ADDR addr = memaddr & - sizeof (int);
  /* Round ending address up; get number of longwords that makes.  */
  register int count
    = (((memaddr + len) - addr) + sizeof (int) - 1) / sizeof (int);
  /* Allocate buffer of that many longwords.  */
  register int *buffer = (int *) alloca (count * sizeof (int));

  if (write)
    {
      /* Fill start and end extra bytes of buffer with existing memory data.  */

      if (addr != memaddr || len < (int)sizeof (int)) {
	/* Need part of initial word -- fetch it.  */
        buffer[0] = ptrace (PT_READ_I, inferior_pid, (PTRACE_ARG3_TYPE) addr,
			    0);
      }

      if (count > 1)		/* FIXME, avoid if even boundary */
	{
	  buffer[count - 1]
	    = ptrace (PT_READ_I, inferior_pid,
		      (PTRACE_ARG3_TYPE) (addr + (count - 1) * sizeof (int)),
		      0);
	}

      /* Copy data to be written over corresponding part of buffer */

      bcopy (myaddr, (char *) buffer + (memaddr & (sizeof (int) - 1)), len);

      /* Write the entire buffer.  */

      for (i = 0; i < count; i++, addr += sizeof (int))
	{
	  errno = 0;
	  ptrace (PT_WRITE_D, inferior_pid, (PTRACE_ARG3_TYPE) addr,
		  buffer[i]);
	  if (errno)
	    {
	      /* Using the appropriate one (I or D) is necessary for
		 Gould NP1, at least.  */
	      errno = 0;
	      ptrace (PT_WRITE_I, inferior_pid, (PTRACE_ARG3_TYPE) addr,
		      buffer[i]);
	    }
	  if (errno)
	    return 0;
	}
    }
  else
    {
      /* Read all the longwords */
      for (i = 0; i < count; i++, addr += sizeof (int))
	{
	  errno = 0;
	  buffer[i] = ptrace (PT_READ_I, inferior_pid,
			      (PTRACE_ARG3_TYPE) addr, 0);
	  if (errno)
	    return 0;
	  QUIT;
	}

      /* Copy appropriate bytes out of the buffer.  */
      bcopy ((char *) buffer + (memaddr & (sizeof (int) - 1)), myaddr, len);
    }
  return len;
}

