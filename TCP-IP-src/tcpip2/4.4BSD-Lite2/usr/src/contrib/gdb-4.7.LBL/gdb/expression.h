/* Definitions for expressions stored in reversed prefix form, for GDB.
   Copyright 1986, 1989, 1992 Free Software Foundation, Inc.

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

#if !defined (EXPRESSION_H)
#define EXPRESSION_H 1

/* Definitions for saved C expressions.  */

/* An expression is represented as a vector of union exp_element's.
   Each exp_element is an opcode, except that some opcodes cause
   the following exp_element to be treated as a long or double constant
   or as a variable.  The opcodes are obeyed, using a stack for temporaries.
   The value is left on the temporary stack at the end.  */

/* When it is necessary to include a string,
   it can occupy as many exp_elements as it needs.
   We find the length of the string using strlen,
   divide to find out how many exp_elements are used up,
   and skip that many.  Strings, like numbers, are indicated
   by the preceding opcode.  */

enum exp_opcode
{
  /* Used when it's necessary to pass an opcode which will be ignored,
     or to catch uninitialized values.  */
  OP_NULL,

/* BINOP_... operate on two values computed by following subexpressions,
   replacing them by one result value.  They take no immediate arguments.  */
  BINOP_ADD,		/* + */
  BINOP_SUB,		/* - */
  BINOP_MUL,		/* * */
  BINOP_DIV,		/* / */
  BINOP_REM,		/* % */
  BINOP_LSH,		/* << */
  BINOP_RSH,		/* >> */
  BINOP_AND,		/* && */
  BINOP_OR,		/* || */
  BINOP_LOGAND,		/* & */
  BINOP_LOGIOR,		/* | */
  BINOP_LOGXOR,		/* ^ */
  BINOP_EQUAL,		/* == */
  BINOP_NOTEQUAL,	/* != */
  BINOP_LESS,		/* < */
  BINOP_GTR,		/* > */
  BINOP_LEQ,		/* <= */
  BINOP_GEQ,		/* >= */
  BINOP_REPEAT,		/* @ */
  BINOP_ASSIGN,		/* = */
  BINOP_COMMA,		/* , */
  BINOP_SUBSCRIPT,	/* x[y] */
  BINOP_MULTI_SUBSCRIPT, /* Modula-2 x[a,b,...] */
  BINOP_EXP,		/* Exponentiation */

/* C++.  */
  BINOP_MIN,		/* <? */
  BINOP_MAX,		/* >? */
  BINOP_SCOPE,		/* :: */

  /* STRUCTOP_MEMBER is used for pointer-to-member constructs.
     X . * Y translates into X STRUCTOP_MEMBER Y.  */
  STRUCTOP_MEMBER,
  /* STRUCTOP_MPTR is used for pointer-to-member constructs
     when X is a pointer instead of an aggregate.  */
  STRUCTOP_MPTR,
/* end of C++.  */

  /* For Modula-2 integer division DIV */
  BINOP_INTDIV,

  BINOP_ASSIGN_MODIFY,	/* +=, -=, *=, and so on.
			   The following exp_element is another opcode,
			   a BINOP_, saying how to modify.
			   Then comes another BINOP_ASSIGN_MODIFY,
			   making three exp_elements in total.  */

  /* Modula-2 standard (binary) procedures*/
  BINOP_VAL,
  BINOP_INCL,
  BINOP_EXCL,

  /* This must be the highest BINOP_ value, for expprint.c.  */
  BINOP_END,

/* Operates on three values computed by following subexpressions.  */
  TERNOP_COND,		/* ?: */

/* The OP_... series take immediate following arguments.
   After the arguments come another OP_... (the same one)
   so that the grouping can be recognized from the end.  */

/* OP_LONG is followed by a type pointer in the next exp_element
   and the long constant value in the following exp_element.
   Then comes another OP_LONG.
   Thus, the operation occupies four exp_elements.  */

  OP_LONG,
/* OP_DOUBLE is similar but takes a double constant instead of a long one.  */
  OP_DOUBLE,
/* OP_VAR_VALUE takes one struct symbol * in the following exp_element,
   followed by another OP_VAR_VALUE, making three exp_elements.  */
  OP_VAR_VALUE,
/* OP_LAST is followed by an integer in the next exp_element.
   The integer is zero for the last value printed,
   or it is the absolute number of a history element.
   With another OP_LAST at the end, this makes three exp_elements.  */
  OP_LAST,
/* OP_REGISTER is followed by an integer in the next exp_element.
   This is the number of a register to fetch (as an int).
   With another OP_REGISTER at the end, this makes three exp_elements.  */
  OP_REGISTER,
/* OP_INTERNALVAR is followed by an internalvar ptr in the next exp_element.
   With another OP_INTERNALVAR at the end, this makes three exp_elements.  */
  OP_INTERNALVAR,
/* OP_FUNCALL is followed by an integer in the next exp_element.
   The integer is the number of args to the function call.
   That many plus one values from following subexpressions
   are used, the first one being the function.
   The integer is followed by a repeat of OP_FUNCALL,
   making three exp_elements.  */
  OP_FUNCALL,
/* OP_STRING represents a string constant.
   Its format is the same as that of a STRUCTOP, but the string
   data is just made into a string constant when the operation
   is executed.  */
  OP_STRING,

/* UNOP_CAST is followed by a type pointer in the next exp_element.
   With another UNOP_CAST at the end, this makes three exp_elements.
   It casts the value of the following subexpression.  */
  UNOP_CAST,
/* UNOP_MEMVAL is followed by a type pointer in the next exp_element
   With another UNOP_MEMVAL at the end, this makes three exp_elements.
   It casts the contents of the word addressed by the value of the
   following subexpression.  */
  UNOP_MEMVAL,
/* UNOP_... operate on one value from a following subexpression
   and replace it with a result.  They take no immediate arguments.  */
  UNOP_NEG,		/* Unary - */
  UNOP_ZEROP,		/* Unary ! */
  UNOP_LOGNOT,		/* Unary ~ */
  UNOP_IND,		/* Unary * */
  UNOP_ADDR,		/* Unary & */
  UNOP_PREINCREMENT,	/* ++ before an expression */
  UNOP_POSTINCREMENT,	/* ++ after an expression */
  UNOP_PREDECREMENT,	/* -- before an expression */
  UNOP_POSTDECREMENT,	/* -- after an expression */
  UNOP_SIZEOF,		/* Unary sizeof (followed by expression) */

  UNOP_PLUS,		/* Unary plus */

  UNOP_CAP,		/* Modula-2 standard (unary) procedures */
  UNOP_CHR,
  UNOP_ORD,
  UNOP_ABS,
  UNOP_FLOAT,
  UNOP_HIGH,
  UNOP_MAX,
  UNOP_MIN,
  UNOP_ODD,
  UNOP_TRUNC,

  OP_BOOL,		/* Modula-2 builtin BOOLEAN type */
  OP_M2_STRING,		/* Modula-2 string constants */

/* STRUCTOP_... operate on a value from a following subexpression
   by extracting a structure component specified by a string
   that appears in the following exp_elements (as many as needed).
   STRUCTOP_STRUCT is used for "." and STRUCTOP_PTR for "->".
   They differ only in the error message given in case the value is
   not suitable or the structure component specified is not found.

   The length of the string follows in the next exp_element,
   (after the string), followed by another STRUCTOP_... code.  */
  STRUCTOP_STRUCT,
  STRUCTOP_PTR,

/* C++ */
  /* OP_THIS is just a placeholder for the class instance variable.
     It just comes in a tight (OP_THIS, OP_THIS) pair.  */
  OP_THIS,

  /* OP_SCOPE surrounds a type name and a field name.  The type
     name is encoded as one element, but the field name stays as
     a string, which, of course, is variable length.  */
  OP_SCOPE,

  /* OP_TYPE is for parsing types, and used with the "ptype" command
     so we can look up types that are qualified by scope, either with
     the GDB "::" operator, or the Modula-2 '.' operator. */
  OP_TYPE
};

union exp_element
{
  enum exp_opcode opcode;
  struct symbol *symbol;
  LONGEST longconst;
  double doubleconst;
  char string;
  struct type *type;
  struct internalvar *internalvar;
};

struct expression
{
  const struct language_defn *language_defn;  /* language it was entered in */
  int nelts;
  union exp_element elts[1];
};

/* From parse.c */

extern struct expression *
parse_expression PARAMS ((char *));

extern struct expression *
parse_exp_1 PARAMS ((char **, struct block *, int));

/* The innermost context required by the stack and register variables
   we've encountered so far.  To use this, set it to NULL, then call
   parse_<whatever>, then look at it.  */
extern struct block *innermost_block;

/* From expprint.c */

extern void
print_expression PARAMS ((struct expression *, FILE *));

extern char *
op_string PARAMS ((enum exp_opcode));

#endif	/* !defined (EXPRESSION_H) */
