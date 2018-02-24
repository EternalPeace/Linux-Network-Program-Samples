/* Definitions of target machine for GNU compiler.  DECstation (ultrix) version.
   Copyright (C) 1991 Free Software Foundation, Inc.

This file is part of GNU CC.

GNU CC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GNU CC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU CC; see the file COPYING.  If not, write to
the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.  */

#define DECSTATION

#ifndef CPP_PREDEFINES
#define CPP_PREDEFINES "-D__ANSI_COMPAT \
-DMIPSEL -DR3000 -DSYSTYPE_BSD -D_SYSTYPE_BSD -Dbsd4_4 -Dhost_mips -Dmips -Dunix"
#endif

#ifndef ASM_SPEC
#define ASM_SPEC "%{G*}"
#endif

#ifndef CPP_SPEC
#define CPP_SPEC "\
%{.S:	-D__LANGUAGE_ASSEMBLY__ -D__LANGUAGE_ASSEMBLY %{!ansi:-DLANGUAGE_ASSEMBLY}} \
%{.cc:	-D__LANGUAGE_C_PLUS_PLUS__ -D__LANGUAGE_C_PLUS_PLUS} \
%{.cxx:	-D__LANGUAGE_C_PLUS_PLUS__ -D__LANGUAGE_C_PLUS_PLUS} \
%{.C:	-D__LANGUAGE_C_PLUS_PLUS__ -D__LANGUAGE_C_PLUS_PLUS} \
%{.m:	-D__LANGUAGE_OBJECTIVE_C__ -D__LANGUAGE_OBJECTIVE_C} \
%{!.S:	-D__LANGUAGE_C__  -D__LANGUAGE_C %{!ansi:-DLANGUAGE_C}}"
#endif

#ifndef LINK_SPEC
#define LINK_SPEC "%{G*}"
#endif

#define LIB_SPEC ""
#define STARTFILE_SPEC ""

/* For compatibility with types.h.  */
#ifndef SIZE_TYPE
#define SIZE_TYPE "unsigned int"
#endif

#ifndef MACHINE_TYPE
#define MACHINE_TYPE "DECstation running BSD 4.4"
#endif

#define TARGET_DEFAULT MASK_GAS
#define PREFERRED_DEBUGGING_TYPE DBX_DEBUG

#include "mips.h"

/* Since gas and gld are standard on 4.4 BSD, we don't need these */
#undef MD_EXEC_PREFIX
#undef MD_STARTFILE_PREFIX
#undef ASM_FINAL_SPEC
#undef LIB_SPEC
#undef STARTFILE_SPEC
