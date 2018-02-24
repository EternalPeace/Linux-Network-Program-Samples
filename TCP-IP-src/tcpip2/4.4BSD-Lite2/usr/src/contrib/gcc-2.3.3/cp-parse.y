/* YACC parser for C++ syntax.
   Copyright (C) 1988, 1989 Free Software Foundation, Inc.
   Hacked by Michael Tiemann (tiemann@cygnus.com)

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


/* This grammar is based on the GNU CC grammar.  */

/* Note: Bison automatically applies a default action of "$$ = $1" for
   all derivations; this is applied before the explicit action, if one
   is given.  Keep this in mind when reading the actions.  */

/* Also note: this version contains experimental exception
   handling features.  They could break, change, disappear,
   or otherwise exhibit volatile behavior.  Don't depend on
   me (Michael Tiemann) to protect you from any negative impact
   this may have on your professional, personal, or spiritual life.

   NEWS FLASH:  This version now supports the exception handling
   syntax of Stroustrup's 2nd edition, if -fansi-exceptions is given.
   THIS IS WORK IN PROGRESS!!!  The type of the 'throw' and the
   'catch' much match EXACTLY (no inheritance support or coercions).
   Also, throw-specifications of functions don't work.
   Destructors aren't called correctly.  Etc, etc.  --Per Bothner.
  */

%{
#if defined(GATHER_STATISTICS) || defined(SPEW_DEBUG)
#undef YYDEBUG
#define YYDEBUG 1
#endif

#include "config.h"

#include <stdio.h>
#include <errno.h>

#include "tree.h"
#include "input.h"
#include "flags.h"
#include "cp-lex.h"
#include "cp-tree.h"

extern tree void_list_node;
extern struct obstack permanent_obstack;

#ifndef errno
extern int errno;
#endif

extern int end_of_file;

void yyerror ();

/* Like YYERROR but do call yyerror.  */
#define YYERROR1 { yyerror ("syntax error"); YYERROR; }

static void position_after_white_space ();

/* Contains error message to give if user tries to declare
   a variable where one does not belong.  */
static char *stmt_decl_msg = 0;

/* Nonzero if we have an `extern "C"' acting as an extern specifier.  */
int have_extern_spec;
int used_extern_spec;

void yyhook ();

/* Cons up an empty parameter list.  */
#ifdef __GNUC__
__inline
#endif
static tree
empty_parms ()
{
  tree parms;

  if (strict_prototype)
    parms = void_list_node;
  else
    parms = NULL_TREE;
  return parms;
}
%}

%start program

%union {long itype; tree ttype; char *strtype; enum tree_code code; }

/* All identifiers that are not reserved words
   and are not declared typedefs in the current block */
%token IDENTIFIER

/* All identifiers that are declared typedefs in the current block.
   In some contexts, they are treated just like IDENTIFIER,
   but they can also serve as typespecs in declarations.  */
%token TYPENAME

/* Qualified identifiers that end in a TYPENAME.  */
%token SCOPED_TYPENAME

/* Reserved words that specify storage class.
   yylval contains an IDENTIFIER_NODE which indicates which one.  */
%token SCSPEC

/* Reserved words that specify type.
   yylval contains an IDENTIFIER_NODE which indicates which one.  */
%token TYPESPEC

/* Reserved words that qualify type: "const" or "volatile".
   yylval contains an IDENTIFIER_NODE which indicates which one.  */
%token TYPE_QUAL

/* Character or numeric constants.
   yylval is the node for the constant.  */
%token CONSTANT

/* String constants in raw form.
   yylval is a STRING_CST node.  */
%token STRING

/* "...", used for functions with variable arglists.  */
%token ELLIPSIS

/* the reserved words */
/* SCO include files test "ASM", so use something else. */
%token SIZEOF ENUM /* STRUCT UNION */ IF ELSE WHILE DO FOR SWITCH CASE DEFAULT
%token BREAK CONTINUE RETURN GOTO ASM_KEYWORD TYPEOF ALIGNOF HEADOF CLASSOF
%token ATTRIBUTE EXTENSION LABEL

/* the reserved words... C++ extensions */
%token <ttype> AGGR
%token <itype> VISSPEC
%token DELETE NEW OVERLOAD THIS OPERATOR
%token DYNAMIC POINTSAT_LEFT_RIGHT LEFT_RIGHT TEMPLATE
%token <itype> SCOPE

/* Special token created by the lexer to separate TYPENAME
   from an ABSDCL.  This allows us to parse `foo (*pf)()'.  */

%token START_DECLARATOR

/* Define the operator tokens and their precedences.
   The value is an integer because, if used, it is the tree code
   to use in the expression made from the operator.  */

%left EMPTY			/* used to resolve s/r with epsilon */

/* Add precedence rules to solve dangling else s/r conflict */
%nonassoc IF
%nonassoc ELSE

%left IDENTIFIER TYPENAME TYPENAME_COLON SCSPEC TYPESPEC TYPE_QUAL ENUM AGGR

%left '{' ','

%right <code> ASSIGN '='
%right <code> '?' ':' RANGE
%left <code> OROR
%left <code> ANDAND
%left <code> '|'
%left <code> '^'
%left <code> '&'
%left <code> MIN_MAX
%left <code> EQCOMPARE
%left <code> ARITHCOMPARE '<' '>'
%left <code> LSHIFT RSHIFT
%left <code> '+' '-'
%left <code> '*' '/' '%'
%right <code> UNARY PLUSPLUS MINUSMINUS
%left HYPERUNARY
%left <ttype> PAREN_STAR_PAREN LEFT_RIGHT
%left <code> POINTSAT POINTSAT_STAR '.' DOT_STAR '(' '['

%right SCOPE			/* C++ extension */
%nonassoc NEW DELETE RAISE RAISES RERAISE TRY EXCEPT CATCH THROW
%nonassoc ANSI_TRY ANSI_THROW
%right DYNAMIC

%type <code> unop

%type <ttype> identifier IDENTIFIER TYPENAME CONSTANT expr nonnull_exprlist
%type <ttype> optional_identifier
%type <ttype> expr_no_commas cast_expr unary_expr primary string STRING
%type <ttype> typed_declspecs reserved_declspecs
%type <ttype> typed_typespecs reserved_typespecquals
%type <ttype> declmods typespec typespecqual_reserved
%type <ttype> SCSPEC TYPESPEC TYPE_QUAL nonempty_type_quals maybe_type_qual
%type <itype> initdecls notype_initdecls initdcl	/* C++ modification */
%type <ttype> init initlist maybeasm
%type <ttype> asm_operands nonnull_asm_operands asm_operand asm_clobbers
%type <ttype> maybe_attribute attribute_list attrib
%type <ttype> abs_member_declarator after_type_member_declarator

%type <ttype> compstmt except_stmts ansi_except_stmts

%type <ttype> declarator notype_declarator after_type_declarator

%type <ttype> structsp opt.component_decl_list component_decl_list component_decl components component_declarator
%type <ttype> enumlist enumerator
%type <ttype> typename absdcl absdcl1 type_quals abs_or_notype_decl
%type <ttype> xexpr see_typename parmlist parms parm bad_parm
%type <ttype> identifiers_or_typenames

/* C++ extensions */
%type <ttype> typename_scope
%token <ttype> TYPENAME_COLON TYPENAME_ELLIPSIS
%token <ttype> PTYPENAME SCOPED_TYPENAME
%token <ttype> PRE_PARSED_FUNCTION_DECL EXTERN_LANG_STRING ALL
%token <ttype> PRE_PARSED_CLASS_DECL
%type <ttype> fn.def1 /* Not really! */
%type <ttype> fn.def2 return_id
%type <ttype> named_class_head named_class_head_sans_basetype
%type <ttype> unnamed_class_head
%type <ttype> class_head base_class_list
%type <itype> base_class_visibility_list
%type <ttype> base_class maybe_base_class_list base_class.1
%type <ttype> after_type_declarator_no_typename
%type <ttype> maybe_raises raise_identifier raise_identifiers ansi_raise_identifier ansi_raise_identifiers
%type <ttype> component_declarator0 scoped_id scoped_typename scoped_base_class
%type <ttype> forhead.1 identifier_or_opname operator_name
%type <ttype> new delete object object_star aggr
/* %type <ttype> primary_no_id */
%type <ttype> nonmomentary_expr
%type <itype> forhead.2 initdcl0 notype_initdcl0 member_init_list
%type <itype> .scope try ansi_try
%type <ttype> template_header template_parm_list template_parm
%type <ttype> template_type template_arg_list template_arg
%type <ttype> template_instantiation template_type_name tmpl.1 tmpl.2
%type <ttype> template_instantiate_once template_instantiate_some
%type <itype> fn_tmpl_end
/* %type <itype> try_for_typename */

/* in order to recognize aggr tags as defining and thus shadowing. */
%token TYPENAME_DEFN IDENTIFIER_DEFN PTYPENAME_DEFN
%type <ttype> named_class_head_sans_basetype_defn 
%type <ttype> identifier_defn IDENTIFIER_DEFN TYPENAME_DEFN PTYPENAME_DEFN

%type <strtype> .pushlevel

/* cp-spew.c depends on this being the last token.  Define
   any new tokens before this one!  */
%token END_OF_SAVED_INPUT

%{
/* List of types and structure classes of the current declaration.  */
static tree current_declspecs;

/* When defining an aggregate, this is the most recent one being defined.  */
static tree current_aggr;

/* 1 if we explained undeclared var errors.  */
int undeclared_variable_notice;

/* Tell yyparse how to print a token's value, if yydebug is set.  */

#define YYPRINT(FILE,YYCHAR,YYLVAL) yyprint(FILE,YYCHAR,YYLVAL)
extern void yyprint ();
%}

%%
program: /* empty */
	| extdefs
		{ finish_file (); }
	;

/* the reason for the strange actions in this rule
 is so that notype_initdecls when reached via datadef
 can find a valid list of type and sc specs in $0. */

extdefs:
	  { $<ttype>$ = NULL_TREE; } extdef
		{$<ttype>$ = NULL_TREE; }
	| extdefs extdef
		{$<ttype>$ = NULL_TREE; }
	;

.hush_warning:
		{ have_extern_spec = 1;
		  used_extern_spec = 0;
		  $<ttype>$ = NULL_TREE; }
	;
.warning_ok:
		{ have_extern_spec = 0; }
	;

extdef:
	  fndef
		{ if (pending_inlines) do_pending_inlines (); }
	| datadef
		{ if (pending_inlines) do_pending_inlines (); }
	| template_def
		{ if (pending_inlines) do_pending_inlines (); }
	| overloaddef
	| ASM_KEYWORD '(' string ')' ';'
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids use of `asm' keyword");
		  if (TREE_CHAIN ($3)) $3 = combine_strings ($3);
		  assemble_asm ($3); }
	| extern_lang_string '{' extdefs '}'
		{ pop_lang_context (); }
	| extern_lang_string '{' '}'
		{ pop_lang_context (); }
	| extern_lang_string .hush_warning fndef .warning_ok
		{ if (pending_inlines) do_pending_inlines ();
		  pop_lang_context (); }
	| extern_lang_string .hush_warning datadef .warning_ok
		{ if (pending_inlines) do_pending_inlines ();
		  pop_lang_context (); }
	;

extern_lang_string:
	  EXTERN_LANG_STRING
		{ push_lang_context ($1); }
	;

template_header:
	  TEMPLATE '<'
		{ begin_template_parm_list (); }
	  template_parm_list '>'
		{ $$ = end_template_parm_list ($4); }
	;

template_parm_list:
	  template_parm
		{ $$ = process_template_parm (0, $1); }
	| template_parm_list ',' template_parm
		{ $$ = process_template_parm ($1, $3); }
	;

template_parm:
	/* The following rules introduce a new reduce/reduce
	   conflict: they are valid prefixes for a `structsp',
	   which means they could match a nameless parameter.
	   By putting them before the `parm' rule, we get
	   their match before considering them nameless parameter
	   declarations.  */
	  aggr identifier
		{
		  if ($1 != class_type_node)
		    error ("template type parameter must use keyword `class'");
		  $$ = build_tree_list ($2, NULL_TREE);
		}
	| aggr identifier_defn ':' base_class.1
		{
		  if ($1 != class_type_node)
		    error ("template type parameter must use keyword `class'");
		  warning ("restricted template type parameters not yet implemented");
		  $$ = build_tree_list ($2, $4);
		}
	| aggr TYPENAME_COLON base_class.1
		{
		  if ($1 != class_type_node)
		    error ("template type parameter must use keyword `class'");
		  warning ("restricted template type parameters not yet implemented");
		  $$ = build_tree_list ($2, $3);
		}
	| parm
	;

overloaddef:
	  OVERLOAD ov_identifiers ';'

ov_identifiers: IDENTIFIER
		{ declare_overloaded ($1); }
	| ov_identifiers ',' IDENTIFIER
		{ declare_overloaded ($3); }
	;
	  
template_def:
	/* Class template declarations go here; they aren't normal class
	   declarations, because we can't process the bodies yet.  */
	  template_header named_class_head_sans_basetype '{'
		{ yychar = '{'; goto template1; }
	 ';'
	| template_header named_class_head_sans_basetype_defn '{'
		{ yychar = '{'; goto template1; }
	 ';'
	| template_header named_class_head_sans_basetype ':'
		{ yychar = ':'; goto template1; }
	 ';'
	| template_header named_class_head_sans_basetype_defn ':'
		{
		  yychar = ':';
		template1:
		  if (current_aggr == exception_type_node)
		    error ("template type must define an aggregate or union");
		  /* Maybe pedantic warning for union?
		     How about an enum? :-)  */
		  end_template_decl ($1, $2, current_aggr);
		  reinit_parse_for_template (yychar, $1, $2);
		  yychar = YYEMPTY;
		}
	  ';'
	| template_header named_class_head_sans_basetype ';'
		{
		  end_template_decl ($1, $2, current_aggr);
		  /* declare $2 as template name with $1 parm list */
		}
	| template_header named_class_head_sans_basetype_defn ';'
		{
		  end_template_decl ($1, $2, current_aggr);
		  /* declare $2 as template name with $1 parm list */
		}
	| template_header /* notype_initdcl0 ';' */
	  notype_declarator maybe_raises maybeasm maybe_attribute
	  fn_tmpl_end
		{
		  tree d;
		  int momentary;
		  momentary = suspend_momentary ();
		  d = start_decl ($2, /*current_declspecs*/0, 0, $3);
		  cplus_decl_attributes (d, $5);
		  finish_decl (d, NULL_TREE, $4, 0);
		  end_template_decl ($1, d, 0);
		  if ($6 != ';')
		    reinit_parse_for_template ($6, $1, d);
		  resume_momentary (momentary);
		}
	| template_header typed_declspecs /*initdcl0*/
	  declarator maybe_raises maybeasm maybe_attribute
	  fn_tmpl_end
		{
		  tree d;
		  int momentary;

		  current_declspecs = $2;
		  momentary = suspend_momentary ();
		  d = start_decl ($3, current_declspecs, 0, $4);
		  cplus_decl_attributes (d, $6);
		  finish_decl (d, NULL_TREE, $5, 0);
		  end_exception_decls ();
		  end_template_decl ($1, d, 0);
		  if ($7 != ';')
		    {
		      reinit_parse_for_template ($7, $1, d);
		      yychar = YYEMPTY;
		    }
		  note_list_got_semicolon ($<ttype>2);
		  resume_momentary (momentary);
		}
	| template_header declmods declarator fn_tmpl_end
		{
		  tree d = start_decl ($3, $<ttype>2, 0, NULL_TREE);
		  finish_decl (d, NULL_TREE, NULL_TREE, 0);
		  end_template_decl ($1, d, 0);
		  if ($4 != ';')
		    reinit_parse_for_template ($4, $1, d);
		}
	/* Try to recover from syntax errors in templates.  */
	| template_header error '}'	{ end_template_decl ($1, 0, 0); }
	| template_header error ';'	{ end_template_decl ($1, 0, 0); }
	;

fn_tmpl_end: '{'		{ $$ = '{'; }
	| ':'			{ $$ = ':'; }
	| ';'			{ $$ = ';'; }
	| '='			{ $$ = '='; }
	| RETURN		{ $$ = RETURN; }
	;

datadef:
	  notype_initdecls ';'
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids data definition with no type or storage class");
  		  else if (! flag_traditional && ! have_extern_spec)
  		    warning ("data definition has no type or storage class"); }
	| declmods notype_initdecls ';'
		{}
	/* Normal case to make fast: "int i;".  */
	| declmods declarator ';'
		{ tree d;
		  d = start_decl ($2, $<ttype>$, 0, NULL_TREE);
		  finish_decl (d, NULL_TREE, NULL_TREE, 0);
		}
	| typed_declspecs initdecls ';'
		{
		  end_exception_decls ();
		  note_list_got_semicolon ($<ttype>$);
		}
	/* Normal case: make this fast.  */
	| typed_declspecs declarator ';'
		{ tree d;
		  d = start_decl ($2, $<ttype>$, 0, NULL_TREE);
		  finish_decl (d, NULL_TREE, NULL_TREE, 0);
		  end_exception_decls ();
		  note_list_got_semicolon ($<ttype>$);
		}
        | declmods ';'
	  { pedwarn ("empty declaration"); }
	| typed_declspecs ';'
	  {
	    tree t = $<ttype>$;
	    shadow_tag (t);
	    if (TREE_CODE (t) == TREE_LIST
		&& TREE_PURPOSE (t) == NULL_TREE)
	      {
		t = TREE_VALUE (t);
		if (TREE_CODE (t) == RECORD_TYPE)
		  {
		    if (CLASSTYPE_USE_TEMPLATE (t) == 0)
		      CLASSTYPE_USE_TEMPLATE (t) = 2;
		    else if (CLASSTYPE_USE_TEMPLATE (t) == 1)
		      error ("override declaration for already-expanded template");
		  }
	      }
	    note_list_got_semicolon ($<ttype>$);
	  }
	| error ';'
	| error '}'
	| ';'
	;

fndef:
	  fn.def1 base_init compstmt_or_error
		{
		  finish_function (lineno, 1);
		  /* finish_function performs these three statements:

		     expand_end_bindings (getdecls (), 1, 0);
		     poplevel (1, 1, 0);

		     expand_end_bindings (0, 0, 0);
		     poplevel (0, 0, 1);
		     */
		  if ($<ttype>$) process_next_inline ($<ttype>$);
		}
	| fn.def1 return_init base_init compstmt_or_error
		{
		  finish_function (lineno, 1);
		  /* finish_function performs these three statements:

		     expand_end_bindings (getdecls (), 1, 0);
		     poplevel (1, 1, 0);

		     expand_end_bindings (0, 0, 0);
		     poplevel (0, 0, 1);
		     */
		  if ($<ttype>$) process_next_inline ($<ttype>$);
		}
	| fn.def1 nodecls compstmt_or_error
		{ finish_function (lineno, 0);
		  if ($<ttype>$) process_next_inline ($<ttype>$); }
	| fn.def1 return_init ';' nodecls compstmt_or_error
		{ finish_function (lineno, 0);
		  if ($<ttype>$) process_next_inline ($<ttype>$); }
	| fn.def1 return_init nodecls compstmt_or_error
		{ finish_function (lineno, 0);
		  if ($<ttype>$) process_next_inline ($<ttype>$); }
	| typed_declspecs declarator error
		{}
	| declmods notype_declarator error
		{}
	| notype_declarator error
		{}
	;

fn.def1:
	  typed_declspecs declarator maybe_raises
		{ if (! start_function ($$, $2, $3, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| declmods notype_declarator maybe_raises
		{ if (! start_function ($$, $2, $3, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| notype_declarator maybe_raises
		{ if (! start_function (NULL_TREE, $$, $2, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| TYPENAME '(' parmlist ')' type_quals maybe_raises
		{ if (! start_function (NULL_TREE, build_parse_node (CALL_EXPR, $$, $3, $5), $6, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| scoped_typename '(' parmlist ')' type_quals maybe_raises
		{ if (! start_function (NULL_TREE, build_parse_node (CALL_EXPR, $$, $3, $5), $6, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| TYPENAME LEFT_RIGHT type_quals maybe_raises
		{ if (! start_function (NULL_TREE, build_parse_node (CALL_EXPR, $$, empty_parms (), $3), $4, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| scoped_typename LEFT_RIGHT type_quals maybe_raises
		{ if (! start_function (NULL_TREE, build_parse_node (CALL_EXPR, $$, empty_parms (), $3), $4, 0))
		    YYERROR1;
		  reinit_parse_for_function ();
		  $$ = NULL_TREE; }
	| PRE_PARSED_FUNCTION_DECL
		{ start_function (NULL_TREE, TREE_VALUE ($$), NULL_TREE, 1);
		  reinit_parse_for_function (); }
	;

/* more C++ complexity */
fn.def2:
	  typed_declspecs '(' parmlist ')' type_quals maybe_raises
		{
		  tree decl = build_parse_node (CALL_EXPR, TREE_VALUE ($$), $3, $5);
		  $$ = start_method (TREE_CHAIN ($$), decl, $6);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| typed_declspecs LEFT_RIGHT type_quals maybe_raises
		{
		  tree decl = build_parse_node (CALL_EXPR, TREE_VALUE ($$), empty_parms (), $3);
		  $$ = start_method (TREE_CHAIN ($$), decl, $4);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| typed_declspecs declarator maybe_raises
		{ $$ = start_method ($$, $2, $3);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| declmods '(' parmlist ')' type_quals maybe_raises
		{
		  tree decl = build_parse_node (CALL_EXPR, TREE_VALUE ($$), $3, $5);
		  $$ = start_method (TREE_CHAIN ($$), decl, $6);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| declmods LEFT_RIGHT type_quals maybe_raises
		{
		  tree decl = build_parse_node (CALL_EXPR, TREE_VALUE ($$), empty_parms (), $3);
		  $$ = start_method (TREE_CHAIN ($$), decl, $4);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| declmods declarator maybe_raises
		{ $$ = start_method ($$, $2, $3);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	| notype_declarator maybe_raises
		{ $$ = start_method (NULL_TREE, $$, $2);
		  if (! $$)
		    YYERROR1;
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  reinit_parse_for_method (yychar, $$); }
	;

return_id: RETURN IDENTIFIER
		{
		  if (! current_function_parms_stored)
		    store_parm_decls ();
		  $$ = $2;
		}
	;

return_init: return_id
		{ store_return_init ($<ttype>$, NULL_TREE); }
	| return_id '=' init
		{ store_return_init ($<ttype>$, $3); }
	| return_id '(' nonnull_exprlist ')'
		{ store_return_init ($<ttype>$, $3); }
	| return_id LEFT_RIGHT
		{ store_return_init ($<ttype>$, NULL_TREE); }
	;

base_init:
	  ':' .set_base_init member_init_list
		{
		  if ($3 == 0)
		    error ("no base initializers given following ':'");
		  setup_vtbl_ptr ();
		}
	;

.set_base_init:
	/* empty */
		{
		  if (! current_function_parms_stored)
		    store_parm_decls ();

		  /* Flag that we are processing base and member initializers.  */
		  current_vtable_decl = error_mark_node;

		  if (DECL_CONSTRUCTOR_P (current_function_decl))
		    {
		      /* Make a contour for the initializer list.  */
		      pushlevel (0);
		      clear_last_expr ();
		      expand_start_bindings (0);
		    }
		  else if (current_class_type == NULL_TREE)
		    error ("base initializers not allowed for non-member functions");
		  else if (! DECL_CONSTRUCTOR_P (current_function_decl))
		    error ("only constructors take base initializers");
		}
	;

member_init_list:
	  /* empty */
		{ $$ = 0; }
	| member_init
		{ $$ = 1; }
	| member_init_list ',' member_init
	| member_init_list error
	;

member_init: '(' nonnull_exprlist ')'
		{
		  if (current_class_name && !flag_traditional)
		    pedwarn ("ANSI C++ forbids old style base class initialization",
			     IDENTIFIER_POINTER (current_class_name));
		  expand_member_init (C_C_D, NULL_TREE, $2);
		}
	| LEFT_RIGHT
		{
		  if (current_class_name && !flag_traditional)
		    pedwarn ("ANSI C++ forbids old style base class initialization",
			     IDENTIFIER_POINTER (current_class_name));
		  expand_member_init (C_C_D, NULL_TREE, void_type_node);
		}
	| identifier '(' nonnull_exprlist ')'
		{
		  expand_member_init (C_C_D, $<ttype>$, $3);
		}
	| identifier LEFT_RIGHT
		{ expand_member_init (C_C_D, $<ttype>$, void_type_node); }
	| template_type_name '(' nonnull_exprlist ')'
		{ expand_member_init (C_C_D, $<ttype>$, $3); }
	| template_type_name LEFT_RIGHT
		{ expand_member_init (C_C_D, $<ttype>$, void_type_node); }
	| scoped_typename '(' nonnull_exprlist ')'
		{ expand_member_init (C_C_D, $<ttype>$, $3); }
	| scoped_typename LEFT_RIGHT
		{ expand_member_init (C_C_D, $<ttype>$, void_type_node); }
	| scoped_id identifier '(' nonnull_exprlist ')'
		{
		  do_member_init ($<ttype>$, $2, $4);
		}
	| scoped_id identifier LEFT_RIGHT
		{
		  do_member_init ($<ttype>$, $2, void_type_node);
		}
	;

identifier:
	  IDENTIFIER
	| TYPENAME
	| PTYPENAME
	;

identifier_defn:
	  IDENTIFIER_DEFN
	| TYPENAME_DEFN
	| PTYPENAME_DEFN
	;

identifier_or_opname:
	  IDENTIFIER
	| TYPENAME
	| PTYPENAME
/*	| '~' TYPENAME
		{ $$ = build_parse_node (BIT_NOT_EXPR, $2); }*/
	/* get rid of the next line, replace it with the above */
	| '~' identifier { $$ = build_parse_node (BIT_NOT_EXPR,$2);}
	| operator_name
	;

template_type:
	  template_type_name tmpl.1 template_instantiation
		{
  		  extern tree template_type_seen_before_scope;

		  if ($3) 
		    $$ = $3;
		  else if ($$ != error_mark_node)
		    $$ = IDENTIFIER_TYPE_VALUE ($$);
		  /* This is a kludge: In order to detect nested types inside
		   * template classes, we have to tell the lexer that it should
		   * try to replace a following SCOPE token with the correct
		   * SCOPED_TYPENAME for the nested type.  This SCOPED_TYPENAME
		   * token will be handled in the rule "scoped_typename".
		   * - niklas@appli.se */
		  if (yychar == SCOPE) {
		    template_type_seen_before_scope = TYPE_IDENTIFIER ($$);
		    yychar = YYLEX;
		  }
		}
	;

template_type_name:
	  PTYPENAME '<' template_arg_list '>'
		{ $$ = lookup_template_class ($$, $3); }
	| TYPENAME  '<' template_arg_list '>'
		{ $$ = lookup_template_class ($$, $3); }
	;

tmpl.1:
	/* Expansion of template may be required, unless we're followed by
	   a class definition.  */
	  '{'	{ yyungetc ('{', 1); $$ = 0; }
	| ':'	{ yyungetc (':', 1); $$ = 0; }
	| /* empty */ %prec EMPTY
                { $$ = instantiate_class_template ($<ttype>0, 1); }
	;

tmpl.2:
	/* Always do expansion if it hasn't been done already. */
		{ $$ = instantiate_class_template ($<ttype>0, 1); }
	;

template_arg_list:
	  template_arg
		{ $$ = build_tree_list (NULL_TREE, $$); }
	| template_arg_list ',' template_arg
		{ $$ = chainon ($$, build_tree_list (NULL_TREE, $3)); }
	;

template_arg:
	  typename
		{ $$ = groktypename ($$); }
	| expr_no_commas  %prec UNARY
	;

template_instantiate_once:
	  PRE_PARSED_CLASS_DECL maybe_base_class_list
		{
		  tree t, decl, id, tmpl;

		  id = TREE_VALUE ($1);
		  tmpl = TREE_PURPOSE (IDENTIFIER_TEMPLATE (id));
		  t = xref_tag (DECL_TEMPLATE_INFO (tmpl)->aggr, id, $2);
		  set_current_level_tags_transparency (1);
		  my_friendly_assert (TREE_CODE (t) == RECORD_TYPE, 257);
		  $<ttype>$ = t;

		  /* Now, put a copy of the decl in global scope, to avoid
		     recursive expansion.  */
		  decl = IDENTIFIER_LOCAL_VALUE (id);
		  if (!decl)
		    decl = IDENTIFIER_CLASS_VALUE (id);
		  /* Now, put a copy of the decl in global scope, to avoid
		     recursive expansion.  */
                  if (decl)
                    {
		      /* Need to copy it to clear the chain pointer,
			 and need to get it into permanent storage.  */
                      my_friendly_assert (TREE_CODE (decl) == TYPE_DECL, 258);
		      push_obstacks (&permanent_obstack, &permanent_obstack);
                      decl = copy_node (decl);
		      if (DECL_LANG_SPECIFIC (decl))
			copy_lang_decl (decl);
		      pop_obstacks ();
		      pushdecl_top_level (decl);
		    }
		}
	  left_curly opt.component_decl_list '}'
		{
		  extern void end_template_instantiation ();
		  int old_interface = interface_unknown;

		  interface_unknown = 1;
		  $$ = finish_struct ($<ttype>3, $5, 0, 0);

		  pop_obstacks ();
		  end_template_instantiation ($1, $<ttype>3);

                  /* Now go after the methods & class data.  */
		  old_interface = interface_unknown;
		  interface_unknown = 1;
                  instantiate_member_templates ($1);
		  interface_unknown = old_interface;
		  CLASSTYPE_GOT_SEMICOLON ($$) = 1;
		}
	;

template_instantiation:
          /* empty */
                { $$ = NULL_TREE; }
        | template_instantiate_once
                { $$ = $1; }
        ;

template_instantiate_some:
          /* empty */
                { $$ = NULL_TREE; /* never used from here... */}
        | template_instantiate_once template_instantiate_some
                { $$ = $1; /*???*/ }
        ;

unop:     '-'
		{ $$ = NEGATE_EXPR; }
	| '+'
		{ $$ = CONVERT_EXPR; }
	| PLUSPLUS
		{ $$ = PREINCREMENT_EXPR; }
	| MINUSMINUS
		{ $$ = PREDECREMENT_EXPR; }
	| '!'
		{ $$ = TRUTH_NOT_EXPR; }
	;

expr:	  nonnull_exprlist
		{ $$ = build_x_compound_expr ($$); }
	/* Ugly, but faster.  */
	| expr_no_commas
	;

nonnull_exprlist:
	  expr_no_commas
		{ $$ = build_tree_list (NULL_TREE, $$); }
	| nonnull_exprlist ',' expr_no_commas
		{ chainon ($$, build_tree_list (NULL_TREE, $3)); }
	| nonnull_exprlist ',' error
		{ chainon ($$, build_tree_list (NULL_TREE, error_mark_node)); }
	;

unary_expr:
	  primary %prec UNARY
		{
		  if (TREE_CODE ($$) == TYPE_EXPR)
		    $$ = build_component_type_expr (C_C_D, $$, NULL_TREE, 1);
		}
	/* __extension__ turns off -pedantic for following primary.  */
	| EXTENSION
		{ $<itype>1 = pedantic;
		  pedantic = 0; }
	  cast_expr	  %prec UNARY
		{ $$ = $3;
		  pedantic = $<itype>1; }
	| '*' cast_expr   %prec UNARY
		{ $$ = build_x_indirect_ref ($2, "unary *"); }
	| '&' cast_expr   %prec UNARY
		{ $$ = build_x_unary_op (ADDR_EXPR, $2); }
	| '~' cast_expr   %prec UNARY
		{ $$ = build_x_unary_op (BIT_NOT_EXPR, $2); }
	| unop cast_expr  %prec UNARY
		{ $$ = build_x_unary_op ($$, $2);
		  if ($1 == NEGATE_EXPR && TREE_CODE ($2) == INTEGER_CST)
		    TREE_NEGATED_INT ($$) = 1;
		}
	/* Refer to the address of a label as a pointer.  */
	| ANDAND identifier
		{ tree label = lookup_label ($2);
		  TREE_USED (label) = 1;
		  $$ = build1 (ADDR_EXPR, ptr_type_node, label);
		  TREE_CONSTANT ($$) = 1; }
	| SIZEOF unary_expr  %prec UNARY
		{ if (TREE_CODE ($2) == COMPONENT_REF
		      && DECL_BIT_FIELD (TREE_OPERAND ($2, 1)))
		    error ("sizeof applied to a bit-field");
		  /* ANSI says arrays and functions are converted inside comma.
		     But we can't really convert them in build_compound_expr
		     because that would break commas in lvalues.
		     So do the conversion here if operand was a comma.  */
		  if (TREE_CODE ($2) == COMPOUND_EXPR
		      && (TREE_CODE (TREE_TYPE ($2)) == ARRAY_TYPE
			  || TREE_CODE (TREE_TYPE ($2)) == FUNCTION_TYPE))
		    $2 = default_conversion ($2);
		  $$ = c_sizeof (TREE_TYPE ($2)); }
	| SIZEOF '(' typename ')'  %prec HYPERUNARY
		{ $$ = c_sizeof (groktypename ($3)); }
	| ALIGNOF unary_expr  %prec UNARY
		{ if (TREE_CODE ($2) == COMPONENT_REF
		      && DECL_BIT_FIELD (TREE_OPERAND ($2, 1)))
		    error ("`__alignof' applied to a bit-field");
		  if (TREE_CODE ($2) == INDIRECT_REF)
		    {
		      tree t = TREE_OPERAND ($2, 0);
		      tree best = t;
		      int bestalign = TYPE_ALIGN (TREE_TYPE (TREE_TYPE (t)));
		      while (TREE_CODE (t) == NOP_EXPR
			     && TREE_CODE (TREE_TYPE (TREE_OPERAND (t, 0))) == POINTER_TYPE)
			{
			  int thisalign;
			  t = TREE_OPERAND (t, 0);
			  thisalign = TYPE_ALIGN (TREE_TYPE (TREE_TYPE (t)));
			  if (thisalign > bestalign)
			    best = t, bestalign = thisalign;
			}
		      $$ = c_alignof (TREE_TYPE (TREE_TYPE (best)));
		    }
		  else
		    {
		      /* ANSI says arrays and fns are converted inside comma.
			 But we can't convert them in build_compound_expr
			 because that would break commas in lvalues.
			 So do the conversion here if operand was a comma.  */
		      if (TREE_CODE ($2) == COMPOUND_EXPR
			  && (TREE_CODE (TREE_TYPE ($2)) == ARRAY_TYPE
			      || TREE_CODE (TREE_TYPE ($2)) == FUNCTION_TYPE))
			$2 = default_conversion ($2);
		      $$ = c_alignof (TREE_TYPE ($2));
		    }
		}
	| ALIGNOF '(' typename ')'  %prec HYPERUNARY
		{ $$ = c_alignof (groktypename ($3)); }

	| .scope new typename %prec '='
		{ $$ = build_new ($2, $3, NULL_TREE, $$); }
	| .scope new '(' nonnull_exprlist ')' typename %prec '='
		{ $$ = build_new ($4, $6, NULL_TREE, $$); }
	| .scope new typespec '(' nonnull_exprlist ')'
		{ $$ = build_new ($2, $3, $5, $$); }
	| .scope new '(' nonnull_exprlist ')' typespec '(' nonnull_exprlist ')'
		{ $$ = build_new ($4, $6, $8, $$); }
	| .scope new typespec LEFT_RIGHT
		{ $$ = build_new ($2, $3, NULL_TREE, $$); }
	| .scope new '(' nonnull_exprlist ')' typespec LEFT_RIGHT
		{ $$ = build_new ($4, $6, NULL_TREE, $$); }
	| .scope new typename '=' init %prec '='
		{ $$ = build_new ($2, $3, $5, $$); }
	| .scope new '(' nonnull_exprlist ')' typename '=' init %prec '='
		{ $$ = build_new ($4, $6, $8, $$); }

	/* I am not going to add placement syntax to the below complex rules
	   because Ken says the syntax is illegal. (mrs) */
	/* I'm not sure why this is disallowed.  But since it is, and it
	   doesn't seem difficult to catch it, let's give a message, so
	   the programmer can fix it.  --Ken Raeburn  */
	| .scope new '(' typed_typespecs absdcl ')' '[' nonmomentary_expr ']'
		{
		  tree absdcl, typename;

		illegal_new_array:
		  absdcl = build_parse_node (ARRAY_REF, $5, $8);
		  typename = build_decl_list ($4, absdcl);
		  pedwarn ("ANSI C++ forbids array dimensions with parenthesized type");
		  $$ = build_new ($2, typename, NULL_TREE, $$);
		}
	| .scope new '(' nonempty_type_quals absdcl ')' '[' nonmomentary_expr ']'
		{ goto illegal_new_array; }

	| .scope new '(' typed_typespecs absdcl ')'
		{ $$ = build_new ($2, build_decl_list ($4, $5), NULL_TREE, $$); }
	| .scope new '(' nonnull_exprlist ')' '(' typed_typespecs absdcl ')'
		{ $$ = build_new ($4, build_decl_list ($7, $8), NULL_TREE, $$); }
	| .scope new '(' nonempty_type_quals absdcl ')'
		{ $$ = build_new ($2, build_decl_list ($4, $5), NULL_TREE, $$); }
	| .scope new '(' nonnull_exprlist ')' '(' nonempty_type_quals absdcl ')'
		{ $$ = build_new ($4, build_decl_list ($7, $8), NULL_TREE, $$); }
	/* Unswallow a ':' which is probably meant for ?: expression.  */
	| .scope new TYPENAME_COLON
		{ yyungetc (':', 1); $$ = build_new ($2, $3, NULL_TREE, $$); }
	| .scope new '(' nonnull_exprlist ')' TYPENAME_COLON
		{ yyungetc (':', 1); $$ = build_new ($4, $6, NULL_TREE, $$); }

	| delete cast_expr  %prec UNARY
		{ tree expr = stabilize_reference (convert_from_reference ($2));
		  tree type = TREE_TYPE (expr);

		  if (TREE_CODE (type) != POINTER_TYPE)
		    {
		      error ("non-pointer type to `delete'");
		      $$ = error_mark_node;
		      break;
		    }
		  else if (integer_zerop (expr))
		    {
		      /* ANSI C++ June 5 1992 WP 5.3.4.  Deleting a pointer
			 with the value zero is legal and has no effect.  */
		      $$ = build1 (NOP_EXPR, void_type_node, expr);
		      break;
		    }
		  else if (TREE_READONLY (TREE_TYPE (type)))
		    {
		      error ("`const *' cannot be deleted");
		      $$ = error_mark_node;
		      break;
		    }
		  $$ = build_delete (type, expr, integer_three_node,
				     LOOKUP_NORMAL|LOOKUP_HAS_IN_CHARGE,
				     TYPE_HAS_DESTRUCTOR (TREE_TYPE (type)),
				     0);
		}
	| delete '[' ']' cast_expr  %prec UNARY
		{
		  tree exp = stabilize_reference (convert_from_reference ($4));
		  tree type = TREE_TYPE (exp);
		  tree elt_size = c_sizeof (type);

		  if (yychar == YYEMPTY)
		    yychar = YYLEX;

		  if (TREE_CODE (type) == POINTER_TYPE
		      && TREE_READONLY (TREE_TYPE (type)))
		    {
		      error ("`const *' cannot be deleted");
		      $$ = error_mark_node;
		      break;
		    }
		  $$ = build_vec_delete (exp, NULL_TREE, elt_size, NULL_TREE,
					 integer_one_node, integer_two_node);
		}
	| delete '[' expr ']' cast_expr %prec UNARY
		{
		  tree maxindex = build_binary_op (MINUS_EXPR, $3,
						   integer_one_node);
		  tree exp = stabilize_reference (convert_from_reference ($5));
		  tree type = TREE_TYPE (exp);
		  tree elt_size = c_sizeof (type);

		  if (yychar == YYEMPTY)
		    yychar = YYLEX;

		  if (! flag_traditional)
		    pedwarn ("ANSI C++ forbids array size in vector delete");
		  if (TREE_CODE (type) == POINTER_TYPE
		      && TREE_READONLY (TREE_TYPE (type)))
		    {
		      error ("`const *' cannot be deleted");
		      $$ = error_mark_node;
		      break;
		    }
		  $$ = build_vec_delete (exp, maxindex, elt_size, NULL_TREE,
					 integer_one_node, integer_two_node);
		}
	;

cast_expr:
	  unary_expr
	| '(' typename ')' expr_no_commas  %prec UNARY
		{ tree type = groktypename ($2);
		  $$ = build_c_cast (type, $4); }
	| '(' typename ')' '{' initlist maybecomma '}'  %prec UNARY
		{ tree type = groktypename ($2);
		  tree init = build_nt (CONSTRUCTOR, NULL_TREE, nreverse ($5));
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids constructor-expressions");
		  /* Indicate that this was a GNU C constructor expression.  */
		  TREE_HAS_CONSTRUCTOR (init) = 1;
		  $$ = digest_init (type, init, 0);
		  if (TREE_CODE (type) == ARRAY_TYPE && TYPE_SIZE (type) == 0)
		    {
		      int failure = complete_array_type (type, $$, 1);
		      if (failure)
			my_friendly_abort (78);
		    }
		}
	| HEADOF '(' expr ')'
		{ $$ = build_headof ($3); }
	| CLASSOF '(' expr ')'
		{ $$ = build_classof ($3); }
	| CLASSOF '(' TYPENAME ')'
		{ if (is_aggr_typedef ($3, 1))
		    {
		      tree type = IDENTIFIER_TYPE_VALUE ($3);
		      $$ = CLASSTYPE_DOSSIER (type);
		    }
		  else
		    $$ = error_mark_node;
		}
	;

expr_no_commas:
	  cast_expr
	| expr_no_commas '+' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '-' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '*' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '/' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '%' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas LSHIFT expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas RSHIFT expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas ARITHCOMPARE expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '<' expr_no_commas
		{ $$ = build_x_binary_op (LT_EXPR, $$, $3); }
	| expr_no_commas '>' expr_no_commas
		{ $$ = build_x_binary_op (GT_EXPR, $$, $3); }
	| expr_no_commas EQCOMPARE expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas MIN_MAX expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '&' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '|' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas '^' expr_no_commas
		{ $$ = build_x_binary_op ($2, $$, $3); }
	| expr_no_commas ANDAND expr_no_commas
		{ $$ = build_x_binary_op (TRUTH_ANDIF_EXPR, $$, $3); }
	| expr_no_commas OROR expr_no_commas
		{ $$ = build_x_binary_op (TRUTH_ORIF_EXPR, $$, $3); }
	| expr_no_commas '?' xexpr ':' expr_no_commas
		{ $$ = build_x_conditional_expr ($$, $3, $5); }
	| expr_no_commas '=' expr_no_commas
		{ $$ = build_modify_expr ($$, NOP_EXPR, $3); }
	| expr_no_commas ASSIGN expr_no_commas
		{ register tree rval;
		  if (rval = build_opfncall (MODIFY_EXPR, LOOKUP_NORMAL, $$, $3,
			make_node ($2)))
		    $$ = rval;
		  else
		    $$ = build_modify_expr ($$, $2, $3); }
	| primary DOT_STAR expr_no_commas %prec UNARY
		{ $$ = build_m_component_ref ($$, build_indirect_ref ($3, 0)); }
	/* Handle general members.  */
	| object_star expr_no_commas   %prec UNARY
		{ $$ = build_x_binary_op (MEMBER_REF, $$, $2); }
/* These extensions are not defined.
	| object '&' expr_no_commas   %prec UNARY
		{ $$ = build_m_component_ref ($$, build_x_unary_op (ADDR_EXPR, $3)); }
	| object unop expr_no_commas  %prec UNARY
		{ $$ = build_m_component_ref ($$, build_x_unary_op ($2, $3)); }
	| object '(' typename ')' expr_no_commas  %prec UNARY
		{ tree type = groktypename ($3);
		  $$ = build_m_component_ref ($$, build_c_cast (type, $5)); }
	| object primary_no_id  %prec UNARY
		{ $$ = build_m_component_ref ($$, $2); }
*/
	;

primary:
	IDENTIFIER
		{ $$ = do_identifier ($$); }
	| operator_name
		{
		  tree op = $$;
		  if (TREE_CODE (op) != IDENTIFIER_NODE)
		    $$ = op;
		  else
		    {
		      $$ = lookup_name (op, 0);
		      if ($$ == NULL_TREE)
			{
			  error ("operator %s not defined", operator_name_string (op));
			  $$ = error_mark_node;
			}
		    }
		}
	| CONSTANT
	| string
		{ $$ = combine_strings ($$); }
	| '(' expr ')'
		{ $$ = $2; }
	| '(' error ')'
		{ $$ = error_mark_node; }
	| '('
		{ if (current_function_decl == 0)
		    {
		      error ("braced-group within expression allowed only inside a function");
		      YYERROR;
		    }
		  keep_next_level ();
		  $<ttype>$ = expand_start_stmt_expr (); }
	  compstmt ')'
		{ tree rtl_exp;
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids braced-groups within expressions");
		  rtl_exp = expand_end_stmt_expr ($<ttype>2);
		  /* The statements have side effects, so the group does.  */
		  TREE_SIDE_EFFECTS (rtl_exp) = 1;
		  /* Make a BIND_EXPR for the BLOCK already made.  */
		  $$ = build (BIND_EXPR, TREE_TYPE (rtl_exp),
			      NULL_TREE, rtl_exp, $3);
		  /* Remove the block from the tree at this point.
		     It gets put back at the proper place
		     when the BIND_EXPR is expanded.  */
		  delete_block ($3);
		}
	| primary '(' nonnull_exprlist ')'
                { /* [eichin:19911016.1902EST] */
                  $<ttype>$ = build_x_function_call ($1, $3, current_class_decl); 
                  /* here we instantiate_class_template as needed... */
                  do_pending_templates ();
                } template_instantiate_some {
                  if (TREE_CODE ($<ttype>5) == CALL_EXPR
                      && TREE_TYPE ($<ttype>5) != void_type_node)
	            $$ = require_complete_type ($<ttype>5);
                  else
                    $$ = $<ttype>5;
                }
	| primary LEFT_RIGHT
                { 
		if ($$ != error_mark_node)
		  {
		    $$ = build_x_function_call ($$, NULL_TREE,
						current_class_decl);
		    if (TREE_CODE ($$) == CALL_EXPR
			&& TREE_TYPE ($$) != void_type_node)
		      $$ = require_complete_type ($$);
		  }
                }
	| primary '[' expr ']'
		{
		do_array:
		  {
		    tree array_expr = $$;
		    tree index_exp = $3;
		    tree type = TREE_TYPE (array_expr);
		    if (type == error_mark_node || index_exp == error_mark_node)
		      $$ = error_mark_node;
		    else if (type == NULL_TREE)
		      {
			/* Something has gone very wrong.  Assume we
			   are mistakenly reducing an expression
			   instead of a declaration.  */
			error ("parser may be lost: is there a '{' missing somewhere?");
			$$ = NULL_TREE;
		      }
		    else
		      {
			if (TREE_CODE (type) == OFFSET_TYPE)
			  type = TREE_TYPE (type);
			if (TREE_CODE (type) == REFERENCE_TYPE)
			  type = TREE_TYPE (type);

			if (TYPE_LANG_SPECIFIC (type)
			    && TYPE_OVERLOADS_ARRAY_REF (type))
			  $$ = build_opfncall (ARRAY_REF, LOOKUP_NORMAL, array_expr, index_exp);
			else if (TREE_CODE (type) == POINTER_TYPE
				 || TREE_CODE (type) == ARRAY_TYPE)
			  $$ = build_array_ref (array_expr, index_exp);
			else
			  {
			    type = TREE_TYPE (index_exp);
			    if (TREE_CODE (type) == OFFSET_TYPE)
			      type = TREE_TYPE (type);
			    if (TREE_CODE (type) == REFERENCE_TYPE)
			      type = TREE_TYPE (type);
			    
			    if (TYPE_LANG_SPECIFIC (type)
				&& TYPE_OVERLOADS_ARRAY_REF (type))
			      error ("array expression backwards");
			    else if (TREE_CODE (type) == POINTER_TYPE
				     || TREE_CODE (type) == ARRAY_TYPE)
			      $$ = build_array_ref (index_exp, array_expr);
			    else
			      error("[] applied to non-pointer type");
			  }
		      }
		  }
		}
	| object identifier_or_opname  %prec UNARY
		{ $$ = build_component_ref ($$, $2, NULL_TREE, 1); }
	| object scoped_id identifier_or_opname %prec UNARY
		{
		  tree basetype = $2;
		  if (is_aggr_typedef (basetype, 1))
		    {
		      basetype = IDENTIFIER_TYPE_VALUE (basetype);

		      if ($$ == error_mark_node)
			;
		      else if (binfo_or_else (basetype, TREE_TYPE ($$)))
			$$ = build_component_ref (build_scoped_ref ($$, $2), $3, NULL_TREE, 1);
		      else
			$$ = error_mark_node;
		    }
		  else $$ = error_mark_node;
		}
	| primary PLUSPLUS
		{ $$ = build_x_unary_op (POSTINCREMENT_EXPR, $$); }
	| primary MINUSMINUS
		{ $$ = build_x_unary_op (POSTDECREMENT_EXPR, $$); }

	/* C++ extensions */
	| THIS
		{ if (current_class_decl)
		    {
#ifdef WARNING_ABOUT_CCD
		      TREE_USED (current_class_decl) = 1;
#endif
		      $$ = current_class_decl;
		    }
		  else if (current_function_decl
			   && DECL_STATIC_FUNCTION_P (current_function_decl))
		    {
		      error ("`this' is unavailable for static member functions");
		      $$ = error_mark_node;
		    }
		  else
		    {
		      if (current_function_decl)
			error ("invalid use of `this' in non-member function");
		      else
			error ("invalid use of `this' at top level");
		      $$ = error_mark_node;
		    }
		}
	| TYPE_QUAL '(' nonnull_exprlist ')'
		{
		  tree type;
		  tree id = $$;

		  /* This is a C cast in C++'s `functional' notation.  */
		  if ($3 == error_mark_node)
		    {
		      $$ = error_mark_node;
		      break;
		    }
#if 0
		  if ($3 == NULL_TREE)
		    {
		      error ("cannot cast null list to type `%s'",
		             IDENTIFIER_POINTER (TYPE_NAME (id)));
		      $$ = error_mark_node;
		      break;
		    }
#endif
#if 0
		  /* type is not set! (mrs) */
		  if (type == error_mark_node)
		    $$ = error_mark_node;
		  else
#endif
		    {
		      if (id == ridpointers[(int) RID_CONST])
		        type = build_type_variant (integer_type_node, 1, 0);
		      else if (id == ridpointers[(int) RID_VOLATILE])
		        type = build_type_variant (integer_type_node, 0, 1);
#if 0
		      /* should not be able to get here (mrs) */
		      else if (id == ridpointers[(int) RID_FRIEND])
		        {
		          error ("cannot cast expression to `friend' type");
		          $$ = error_mark_node;
		          break;
		        }
#endif
		      else my_friendly_abort (79);
		      $$ = build_c_cast (type, build_compound_expr ($3));
		    }
		}
	| typespec '(' nonnull_exprlist ')'
		{ $$ = build_functional_cast ($$, $3); }
	| typespec LEFT_RIGHT
		{ $$ = build_functional_cast ($$, NULL_TREE); }
	| SCOPE typespec '(' nonnull_exprlist ')'
		{ $$ = build_functional_cast ($2, $4); }
	| SCOPE typespec LEFT_RIGHT
		{ $$ = build_functional_cast ($2, NULL_TREE); }
	| SCOPE IDENTIFIER
		{
		do_scoped_id:
		  $$ = IDENTIFIER_GLOBAL_VALUE ($2);
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  if (! $$)
		    {
		      if (yychar == '(' || yychar == LEFT_RIGHT)
			$$ = implicitly_declare ($2);
		      else
			{
			  if (IDENTIFIER_GLOBAL_VALUE ($2) != error_mark_node)
			    error ("undeclared variable `%s' (first use here)",
				   IDENTIFIER_POINTER ($2));
			  $$ = error_mark_node;
			  /* Prevent repeated error messages.  */
			  IDENTIFIER_GLOBAL_VALUE ($2) = error_mark_node;
			}
		    }
		  else
		    {
		      assemble_external ($$);
		      TREE_USED ($$) = 1;
		    }
		  if (TREE_CODE ($$) == CONST_DECL)
		    {
		      /* XXX CHS - should we set TREE_USED of the constant? */
		      $$ = DECL_INITIAL ($$);
		      /* This is to prevent an enum whose value is 0
			 from being considered a null pointer constant.  */
		      $$ = build1 (NOP_EXPR, TREE_TYPE ($$), $$);
		      TREE_CONSTANT ($$) = 1;
		    }

		}
	| SCOPE operator_name
		{
		  if (TREE_CODE ($2) == IDENTIFIER_NODE)
		    goto do_scoped_id;
		do_scoped_operator:
		  $$ = $2;
		}
	| scoped_id identifier_or_opname  %prec HYPERUNARY
		{ $$ = build_offset_ref ($$, $2); }
	| scoped_id identifier_or_opname '(' nonnull_exprlist ')'
		{ $$ = build_member_call ($$, $2, $4); }
	| scoped_id identifier_or_opname LEFT_RIGHT
		{ $$ = build_member_call ($$, $2, NULL_TREE); }
	| object identifier_or_opname '(' nonnull_exprlist ')'
		{ $$ = build_method_call ($$, $2, $4, NULL_TREE,
					  (LOOKUP_NORMAL|LOOKUP_AGGR)); }
	| object identifier_or_opname LEFT_RIGHT
		{ $$ = build_method_call ($$, $2, NULL_TREE, NULL_TREE,
					  (LOOKUP_NORMAL|LOOKUP_AGGR)); }
	| object scoped_id identifier_or_opname '(' nonnull_exprlist ')'
		{ $$ = build_scoped_method_call ($$, $2, $3, $5); }
	| object scoped_id identifier_or_opname LEFT_RIGHT
		{ $$ = build_scoped_method_call ($$, $2, $3, NULL_TREE); }
	;

/* Not needed for now.

primary_no_id:
	  '(' expr ')'
		{ $$ = $2; }
	| '(' error ')'
		{ $$ = error_mark_node; }
	| '('
		{ if (current_function_decl == 0)
		    {
		      error ("braced-group within expression allowed only inside a function");
		      YYERROR;
		    }
		  $<ttype>$ = expand_start_stmt_expr (); }
	  compstmt ')'
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids braced-groups within expressions");
		  $$ = expand_end_stmt_expr ($<ttype>2); }
	| primary_no_id '(' nonnull_exprlist ')'
		{ $$ = build_x_function_call ($$, $3, current_class_decl); }
	| primary_no_id LEFT_RIGHT
		{ $$ = build_x_function_call ($$, NULL_TREE, current_class_decl); }
	| primary_no_id '[' expr ']'
		{ goto do_array; }
	| primary_no_id PLUSPLUS
		{ $$ = build_x_unary_op (POSTINCREMENT_EXPR, $$); }
	| primary_no_id MINUSMINUS
		{ $$ = build_x_unary_op (POSTDECREMENT_EXPR, $$); }
	| SCOPE IDENTIFIER
		{ goto do_scoped_id; }
	| SCOPE operator_name
		{ if (TREE_CODE ($2) == IDENTIFIER_NODE)
		    goto do_scoped_id;
		  goto do_scoped_operator;
		}
	;
*/

new:	  NEW
		{ $$ = NULL_TREE; }
	| NEW '{' nonnull_exprlist '}'
		{
		  $$ = $3;
		  pedwarn ("old style placement syntax, use () instead");
		}
	| NEW DYNAMIC  %prec EMPTY
		{ $$ = void_type_node; }
	| NEW DYNAMIC '(' string ')'
		{ $$ = combine_strings ($4); }
	;

.scope:
	/* empty  */
		{ $$ = 0; }
	| SCOPE
		{ $$ = 1; }
	;

delete:	  DELETE
		{ $$ = NULL_TREE; }
	| SCOPE delete
		{ if ($2)
		    error ("extra `::' before `delete' ignored");
		  $$ = error_mark_node;
		}
	;

/* Produces a STRING_CST with perhaps more STRING_CSTs chained onto it.  */
string:
	  STRING
	| string STRING
		{ $$ = chainon ($$, $2); }
	;

nodecls:
	  /* empty */
		{
		  if (! current_function_parms_stored)
		    store_parm_decls ();
		  setup_vtbl_ptr ();
		}
	;

object:	  primary '.'
		{
		  if ($$ == error_mark_node)
		    ;
		  else
		    {
		      tree type = TREE_TYPE ($$);

		      if (! PROMOTES_TO_AGGR_TYPE (type, REFERENCE_TYPE))
			{
			  error ("object in '.' expression is not of aggregate type");
			  $$ = error_mark_node;
			}
		    }
		}
	| primary POINTSAT
		{
		  $$ = build_x_arrow ($$);
		}
	;

object_star: primary POINTSAT_STAR
	;

decl:
	  typed_declspecs initdecls ';'
		{
		  resume_momentary ($2);
		  note_list_got_semicolon ($<ttype>$);
		}
	/* Normal case: make this fast.  */
	| typed_declspecs declarator ';'
		{ tree d;
		  int yes = suspend_momentary ();
		  d = start_decl ($2, $<ttype>$, 0, NULL_TREE);
		  finish_decl (d, NULL_TREE, NULL_TREE, 0);
		  resume_momentary (yes);
		  note_list_got_semicolon ($<ttype>$);
		}
	| declmods notype_initdecls ';'
		{ resume_momentary ($2); }
	/* Normal case: make this fast.  */
	| declmods declarator ';'
		{ tree d;
		  int yes = suspend_momentary ();
		  d = start_decl ($2, $<ttype>$, 0, NULL_TREE);
		  finish_decl (d, NULL_TREE, NULL_TREE, 0);
		  resume_momentary (yes);
		}
	| typed_declspecs ';'
		{
		  shadow_tag ($<ttype>$);
		  note_list_got_semicolon ($<ttype>$);
		}
	| declmods ';'
		{ warning ("empty declaration"); }
	;

/* Any kind of declarator (thus, all declarators allowed
   after an explicit typespec).  */

declarator:
	  after_type_declarator
	| notype_declarator
	| START_DECLARATOR after_type_declarator
		{ $$ = $2; }
	| START_DECLARATOR notype_declarator
		{ $$ = $2; }
	;

/* Declspecs which contain at least one type specifier or typedef name.
   (Just `const' or `volatile' is not enough.)
   A typedef'd name following these is taken as a name to be declared.  */

typed_declspecs:
	  typespec	%prec HYPERUNARY
		{ $$ = list_hash_lookup_or_cons ($$); }
	| declmods typespec
		{ $$ = hash_tree_chain ($2, $$); }
	| typespec reserved_declspecs	%prec HYPERUNARY
		{ $$ = hash_tree_chain ($$, $2); }
	| declmods typespec reserved_declspecs
		{ $$ = hash_tree_chain ($2, hash_chainon ($3, $$)); }
	;

reserved_declspecs:  /* empty
		{ $$ = NULL_TREE; } */
	  typespecqual_reserved
		{ $$ = build_decl_list (NULL_TREE, $$); }
	| SCSPEC
		{ if (extra_warnings)
		    warning ("`%s' is not at beginning of declaration",
			     IDENTIFIER_POINTER ($$));
		  $$ = build_decl_list (NULL_TREE, $$); }
	| reserved_declspecs typespecqual_reserved
		{ $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	| reserved_declspecs SCSPEC
		{ if (extra_warnings)
		    warning ("`%s' is not at beginning of declaration",
			     IDENTIFIER_POINTER ($2));
		  $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	;

/* List of just storage classes and type modifiers.
   A declaration can start with just this, but then it cannot be used
   to redeclare a typedef-name.  */

declmods:
	  TYPE_QUAL
		{ $$ = IDENTIFIER_AS_LIST ($$);
		  TREE_STATIC ($$) = 1; }
	| SCSPEC
		{ $$ = IDENTIFIER_AS_LIST ($$); }
	| declmods TYPE_QUAL
		{ $$ = hash_tree_chain ($2, $$);
		  TREE_STATIC ($$) = 1; }
	| declmods SCSPEC
		{ if (extra_warnings && TREE_STATIC ($$))
		    warning ("`%s' is not at beginning of declaration",
			     IDENTIFIER_POINTER ($2));
		  $$ = hash_tree_chain ($2, $$);
		  TREE_STATIC ($$) = TREE_STATIC ($1); }
	;


/* Used instead of declspecs where storage classes are not allowed
   (that is, for typenames and structure components).

   C++ can takes storage classes for structure components.
   Don't accept a typedef-name if anything but a modifier precedes it.  */

typed_typespecs:
	  typespec  %prec EMPTY
		{ $$ = get_decl_list ($$); }
	| nonempty_type_quals typespec
		{ $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	| typespec reserved_typespecquals
		{ $$ = decl_tree_cons (NULL_TREE, $$, $2); }
	| nonempty_type_quals typespec reserved_typespecquals
		{ $$ = decl_tree_cons (NULL_TREE, $2, hash_chainon ($3, $$)); }
	;

reserved_typespecquals:
	  typespecqual_reserved
		{ $$ = get_decl_list ($$); }
	| reserved_typespecquals typespecqual_reserved
		{ $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	;

/* A typespec (but not a type qualifier).
   Once we have seen one of these in a declaration,
   if a typedef name appears then it is being redeclared.  */

typespec: structsp
	| TYPESPEC  %prec EMPTY
	| TYPENAME  %prec EMPTY
	| scoped_typename
	| TYPEOF '(' expr ')'
		{ $$ = TREE_TYPE ($3);
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids `typeof'"); }
	| TYPEOF '(' typename ')'
		{ $$ = groktypename ($3);
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids `typeof'"); }
	| template_type
	;

/* A typespec that is a reserved word, or a type qualifier.  */

typespecqual_reserved: TYPESPEC
	| TYPE_QUAL
	| structsp
	;

initdecls:
	  initdcl0
	| initdecls ',' initdcl
	;

notype_initdecls:
	  notype_initdcl0
	| notype_initdecls ',' initdcl
	;

maybeasm:
	  /* empty */
		{ $$ = NULL_TREE; }
	| ASM_KEYWORD '(' string ')'
		{ if (TREE_CHAIN ($3)) $3 = combine_strings ($3);
		  $$ = $3;
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids use of `asm' keyword");
		}
	;

initdcl0:
	  declarator maybe_raises maybeasm maybe_attribute '='
		{ current_declspecs = $<ttype>0;
		  $<itype>5 = suspend_momentary ();
		  $<ttype>$ = start_decl ($1, current_declspecs, 1, $2);
		  cplus_decl_attributes ($<ttype>$, $4); }
	  init
/* Note how the declaration of the variable is in effect while its init is parsed! */
		{ finish_decl ($<ttype>6, $7, $3, 0);
		  $$ = $<itype>5; }
	| declarator maybe_raises maybeasm maybe_attribute
		{ tree d;
		  current_declspecs = $<ttype>0;
		  $$ = suspend_momentary ();
		  d = start_decl ($1, current_declspecs, 0, $2);
		  cplus_decl_attributes (d, $4);
		  finish_decl (d, NULL_TREE, $3, 0); }
	;

initdcl:
	  declarator maybe_raises maybeasm maybe_attribute '='
		{ $<ttype>$ = start_decl ($1, current_declspecs, 1, $2);
		  cplus_decl_attributes ($<ttype>$, $4); }
	  init
/* Note how the declaration of the variable is in effect while its init is parsed! */
		{ finish_decl ($<ttype>6, $7, $3, 0); }
	| declarator maybe_raises maybeasm maybe_attribute
		{ tree d = start_decl ($$, current_declspecs, 0, $2);
		  cplus_decl_attributes ($<ttype>$, $4);
		  finish_decl (d, NULL_TREE, $3, 0); }
	;

notype_initdcl0:
	  notype_declarator maybe_raises maybeasm maybe_attribute '='
		{ current_declspecs = $<ttype>0;
		  $<itype>5 = suspend_momentary ();
		  $<ttype>$ = start_decl ($1, current_declspecs, 1, $2);
		  cplus_decl_attributes ($<ttype>$, $4); }
	  init
/* Note how the declaration of the variable is in effect while its init is parsed! */
		{ finish_decl ($<ttype>6, $7, $3, 0);
		  $$ = $<itype>5; }
	| notype_declarator maybe_raises maybeasm maybe_attribute
		{ tree d;
		  current_declspecs = $<ttype>0;
		  $$ = suspend_momentary ();
		  d = start_decl ($1, current_declspecs, 0, $2);
		  cplus_decl_attributes (d, $4);
		  finish_decl (d, NULL_TREE, $3, 0); }
	;

/* the * rules are dummies to accept the Apollo extended syntax
   so that the header files compile. */
maybe_attribute:
    /* empty */
	{ $$ = NULL_TREE; }
    | ATTRIBUTE '(' '(' attribute_list ')' ')'
        { $$ = $4; }
    ;

attribute_list
    : attrib
	{ $$ = tree_cons (NULL_TREE, $1, NULL_TREE); }
    | attribute_list ',' attrib
	{ $$ = tree_cons (NULL_TREE, $3, $1); }
    ;

attrib
    : IDENTIFIER
	{ if (strcmp (IDENTIFIER_POINTER ($1), "packed"))
	    warning ("`%s' attribute directive ignored",
		     IDENTIFIER_POINTER ($1));
	  $$ = $1; }
    | IDENTIFIER '(' CONSTANT ')'
	{ /* if not "aligned(n)", then issue warning */
	  if (strcmp (IDENTIFIER_POINTER ($1), "aligned") != 0
	      || TREE_CODE ($3) != INTEGER_CST)
	    {
	      warning ("`%s' attribute directive ignored",
		       IDENTIFIER_POINTER ($1));
	      $$ = $1;
	    }
	  else
	    $$ = tree_cons ($1, $3, NULL_TREE); }
    | IDENTIFIER '(' IDENTIFIER ',' CONSTANT ',' CONSTANT ')'
	{ /* if not "format(...)", then issue warning */
	  if (strcmp (IDENTIFIER_POINTER ($1), "format") != 0
	      || TREE_CODE ($5) != INTEGER_CST
	      || TREE_CODE ($7) != INTEGER_CST)
	    {
	      warning ("`%s' attribute directive ignored",
		       IDENTIFIER_POINTER ($1));
	      $$ = $1;
	    }
	  else
	    $$ = tree_cons ($1, tree_cons ($3, tree_cons ($5, $7, NULL_TREE), NULL_TREE), NULL_TREE); }
    ;

/* A nonempty list of identifiers, including typenames.  */
identifiers_or_typenames:
	identifier
		{ $$ = build_tree_list (NULL_TREE, $1); }
	| identifiers_or_typenames ',' identifier
		{ $$ = chainon ($1, build_tree_list (NULL_TREE, $3)); }
	;

init:
	  expr_no_commas %prec '='
	| '{' '}'
		{ $$ = build_nt (CONSTRUCTOR, NULL_TREE, NULL_TREE);
		  TREE_HAS_CONSTRUCTOR ($$) = 1;
		  if (pedantic)
		    pedwarn ("ANSI C++ forbids empty initializer braces"); }
	| '{' initlist '}'
		{ $$ = build_nt (CONSTRUCTOR, NULL_TREE, nreverse ($2));
		  TREE_HAS_CONSTRUCTOR ($$) = 1; }
	| '{' initlist ',' '}'
		{ $$ = build_nt (CONSTRUCTOR, NULL_TREE, nreverse ($2));
		  TREE_HAS_CONSTRUCTOR ($$) = 1; }
	| error
		{ $$ = NULL_TREE; }
	;

/* This chain is built in reverse order,
   and put in forward order where initlist is used.  */
initlist:
	  init
		{ $$ = build_tree_list (NULL_TREE, $$); }
	| initlist ',' init
		{ $$ = tree_cons (NULL_TREE, $3, $$); }
	/* These are for labeled elements.  */
	| '[' expr_no_commas ']' init
		{ $$ = build_tree_list ($2, $4); }
	| initlist ',' CASE expr_no_commas ':' init
		{ $$ = tree_cons ($4, $6, $$); }
	| identifier ':' init
		{ $$ = build_tree_list ($$, $3); }
	| initlist ',' identifier ':' init
		{ $$ = tree_cons ($3, $5, $$); }
	;

structsp:
	  ENUM identifier '{'
		{ $<itype>3 = suspend_momentary ();
		  $$ = start_enum ($2); }
	  enumlist maybecomma_warn '}'
		{ $$ = finish_enum ($<ttype>4, $5);
		  resume_momentary ($<itype>3);
		  check_for_missing_semicolon ($<ttype>4); }
	| ENUM identifier '{' '}'
		{ $$ = finish_enum (start_enum ($2), NULL_TREE);
		  check_for_missing_semicolon ($$); }
	| ENUM '{'
		{ $<itype>2 = suspend_momentary ();
		  $$ = start_enum (make_anon_name ()); }
	  enumlist maybecomma_warn '}'
		{ $$ = finish_enum ($<ttype>3, $4);
		  resume_momentary ($<itype>1);
		  check_for_missing_semicolon ($<ttype>3); }
	| ENUM '{' '}'
		{ $$ = finish_enum (start_enum (make_anon_name()), NULL_TREE);
		  check_for_missing_semicolon ($$); }
	| ENUM identifier
		{ $$ = xref_tag (enum_type_node, $2, NULL_TREE); }

	/* C++ extensions, merged with C to avoid shift/reduce conflicts */
	| class_head left_curly opt.component_decl_list '}'
		{
		  int semi;
		  tree id;

#if 0
		  /* Need to rework class nesting in the
		     presence of nested classes, etc.  */
		  shadow_tag (CLASSTYPE_AS_LIST ($$)); */
#endif
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  semi = yychar == ';';
		  /* finish_struct nukes this anyway; if
		     finish_exception does too, then it can go. */
		  if (semi)
		    note_got_semicolon ($$);

		  if (TREE_CODE ($$) == ENUMERAL_TYPE)
		    /* $$ = $1 from default rule.  */;
		  else if (CLASSTYPE_DECLARED_EXCEPTION ($$))
		    {
		      if (! semi)
			$$ = finish_exception ($$, $3);
		      else
			warning ("empty exception declaration\n");
		    }
		  else
		    {
		      $$ = finish_struct ($$, $3, semi, semi);
		      if (semi) note_got_semicolon ($$);
		    }

		  pop_obstacks ();

		  id = TYPE_IDENTIFIER ($$);
		  if (IDENTIFIER_TEMPLATE (id))
		    {
		      tree decl;

		      /* I don't know if the copying of this TYPE_DECL is
		       * really needed.  However, it's such a small per-
		       * formance penalty that the extra safety is a bargain.
		       * - niklas@appli.se
		       */
		      push_obstacks (&permanent_obstack, &permanent_obstack);
		      decl = copy_node (lookup_name (id));
		      if (DECL_LANG_SPECIFIC (decl))
			copy_lang_decl (decl);
		      pop_obstacks ();
		      undo_template_name_overload (id, 0);
		      pushdecl_top_level (decl);
		    }
		  if (! semi)
		    check_for_missing_semicolon ($$); }
	| class_head  %prec EMPTY
		{
#if 0
  /* It's no longer clear what the following error is supposed to
     accomplish.  If it turns out to be needed, add a comment why.  */
		  if (TYPE_BINFO_BASETYPES ($$) && !TYPE_SIZE ($$))
		    {
		      error ("incomplete definition of type `%s'",
			     TYPE_NAME_STRING ($$));
		      $$ = error_mark_node;
		    }
#endif
		}
	;

maybecomma:
	  /* empty */
	| ','
	;

maybecomma_warn:
	  /* empty */
	| ','
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids comma at end of enumerator list"); }
	;

aggr:	  AGGR
	| DYNAMIC AGGR
		{ $$ = build_tree_list (NULL_TREE, $2); }
	| DYNAMIC '(' string ')' AGGR
		{ $$ = build_tree_list ($3, $5); }
	| aggr SCSPEC
		{ error ("storage class specifier `%s' not allowed after struct or class", IDENTIFIER_POINTER ($2));
		}
	| aggr TYPESPEC
		{ error ("type specifier `%s' not allowed after struct or class", IDENTIFIER_POINTER ($2));
		}
	| aggr TYPE_QUAL
		{ error ("type qualifier `%s' not allowed after struct or class", IDENTIFIER_POINTER ($2));
		}
	| aggr AGGR
		{ error ("no body nor ';' separates two class, struct or union declarations");
		}
	;

named_class_head_sans_basetype:
	  aggr identifier
		{ aggr1: current_aggr = $$; $$ = $2; }
	| aggr template_type_name  %prec EMPTY
		{ current_aggr = $$; $$ = $2; }
	| aggr TYPENAME_COLON
		{ yyungetc (':', 1); goto aggr1; }
	| aggr template_type_name '{'
		{ yyungetc ('{', 1);
		aggr2:
		  current_aggr = $$;
		  $$ = $2;
		  overload_template_name ($$, 0); }
	| aggr template_type_name ':'
		{ yyungetc (':', 1); goto aggr2; }
	;

named_class_head_sans_basetype_defn:
	  aggr identifier_defn
		{ current_aggr = $$; $$ = $2; }
	;

named_class_head:
	  named_class_head_sans_basetype
		{
		  $<ttype>$ = xref_tag (current_aggr, $1, NULL_TREE);
		}
	  maybe_base_class_list %prec EMPTY
		{
		  if ($3)
		    $$ = xref_tag (current_aggr, $1, $3);
		  else
		    $$ = $<ttype>2;
		}
	|
	  named_class_head_sans_basetype_defn
		{
		  $<ttype>$ = xref_defn_tag (current_aggr, $1, NULL_TREE);
		}
	  maybe_base_class_list %prec EMPTY
		{
		  if ($3)
		    $$ = xref_defn_tag (current_aggr, $1, $3);
		  else
		    $$ = $<ttype>2;
		}
	;

unnamed_class_head: aggr '{'
		{ $$ = xref_tag ($$, make_anon_name (), NULL_TREE);
		  yyungetc ('{', 1); }
	;

class_head: unnamed_class_head | named_class_head ;

maybe_base_class_list:
	  /* empty */
		{ $$ = NULL_TREE; }
	| ':'  %prec EMPTY
		{ yyungetc(':', 1); $$ = NULL_TREE; }
	| ':' base_class_list  %prec EMPTY
		{ $$ = $2; }
	;

base_class_list:
	  base_class
	| base_class_list ',' base_class
		{ $$ = chainon ($$, $3); }
	;

base_class:
	  base_class.1
		{ if (! is_aggr_typedef ($$, 1))
		    $$ = NULL_TREE;
		  else $$ = build_tree_list ((tree)visibility_default, $$); }
	| scoped_base_class
		{ if (! is_aggr_typedef ($$, 1))
		    $$ = NULL_TREE;
		  else $$ = build_tree_list ((tree)visibility_default, $$); }
	| base_class_visibility_list base_class.1
		{ if (! is_aggr_typedef ($2, 1))
		    $$ = NULL_TREE;
		  else $$ = build_tree_list ((tree) $$, $2); }
	| base_class_visibility_list scoped_base_class
		{ if (! is_aggr_typedef ($2, 1))
		    $$ = NULL_TREE;
		  else $$ = build_tree_list ((tree) $$, $2); }
	;

scoped_base_class:
	  base_class.1 SCOPED_TYPENAME
		{
  		  /* Kludge!!! See rule "template_type" and the code
		   * dealing with "template_type_seen_before_scope" in
		   * yylex(). */
  		  $$ = $2;
		}
	;
base_class.1:
	  template_type_name tmpl.2 template_instantiation
		{
  		  extern tree template_type_seen_before_scope;
		  tree id = $3 ? TYPE_IDENTIFIER ($3) : $1;

  		  /* Check the rule template_type to get this... */
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  if (yychar == SCOPE) {
		    template_type_seen_before_scope = id;
		    yychar = YYLEX;
		  }
		}
	| identifier
	;

base_class_visibility_list:
	  VISSPEC
	| SCSPEC
		{ if ($<ttype>$ != ridpointers[(int)RID_VIRTUAL])
		    sorry ("non-virtual visibility");
		  $$ = visibility_default_virtual; }
	| base_class_visibility_list VISSPEC
		{ int err = 0;
		  if ($2 == visibility_protected)
		    {
		      warning ("`protected' visibility not implemented");
		      $2 = visibility_public;
		      err++;
		    }
		  else if ($2 == visibility_public)
		    {
		      if ($1 == visibility_private)
			{
			mixed:
			  error ("base class cannot be public and private");
			}
		      else if ($1 == visibility_default_virtual)
			$$ = visibility_public_virtual;
		    }
		  else /* $2 == visibility_private */
		    {
		      if ($1 == visibility_public)
			goto mixed;
		      else if ($1 == visibility_default_virtual)
			$$ = visibility_private_virtual;
		    }
		}
	| base_class_visibility_list SCSPEC
		{ if ($2 != ridpointers[(int)RID_VIRTUAL])
		    sorry ("non-virtual visibility");
		  if ($$ == visibility_public)
		    $$ = visibility_public_virtual;
		  else if ($$ == visibility_private)
		    $$ = visibility_private_virtual; }
	;

left_curly: '{'
		{ tree t;
		  push_obstacks_nochange ();
		  end_temporary_allocation ();

		  if (! IS_AGGR_TYPE ($<ttype>0))
		    {
		      $<ttype>0 = make_lang_type (RECORD_TYPE);
		      TYPE_NAME ($<ttype>0) = get_identifier ("erroneous type");
		    }
		  if (TYPE_SIZE ($<ttype>0))
		    duplicate_tag_error ($<ttype>0);
                  if (TYPE_SIZE ($<ttype>0) || TYPE_BEING_DEFINED ($<ttype>0))
                    {
                      t = make_lang_type (TREE_CODE ($<ttype>0));
                      pushtag (TYPE_IDENTIFIER ($<ttype>0), t);
                      $<ttype>0 = t;
                    }
		  pushclass ($<ttype>0, 0);
		  TYPE_BEING_DEFINED ($<ttype>0) = 1;
		  t = TYPE_IDENTIFIER ($<ttype>0);
		  if (IDENTIFIER_TEMPLATE (t))
		    overload_template_name (t, 1);
		}
	;

opt.component_decl_list:
	/* empty */
		{ $$ = NULL_TREE; }
	| component_decl_list
		{ $$ = build_tree_list ((tree)visibility_default, $$); }
	| opt.component_decl_list VISSPEC ':' component_decl_list
		{ $$ = chainon ($$, build_tree_list ((tree) $2, $4)); }
	| opt.component_decl_list VISSPEC ':'
	;

component_decl_list:
	  component_decl
		{ if ($$ == void_type_node) $$ = NULL_TREE; }
	| component_decl_list component_decl
		{ if ($2 != NULL_TREE && $2 != void_type_node)
		    $$ = chainon ($$, $2); }
	| component_decl_list ';'
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids extra semicolons here"); }
	;

component_decl:
	  typed_declspecs components ';'
		{
		do_components:
		  if ($2 == void_type_node)
		    /* We just got some friends.
		       They have been recorded elsewhere.  */
		    $$ = NULL_TREE;
		  else if ($2 == NULL_TREE)
		    {
		      tree t = groktypename (build_decl_list ($$, NULL_TREE));
		      if (t == NULL_TREE)
			{
			  error ("error in component specification");
			  $$ = NULL_TREE;
			}
		      else if (TREE_CODE (t) == UNION_TYPE)
			{
			  /* handle anonymous unions */
			  if (ANON_AGGRNAME_P (TYPE_IDENTIFIER (t)))
			    $$ = build_lang_field_decl (FIELD_DECL,
							NULL_TREE, t);
			  else
			    {
			      /* This is a local union decl with a name, but
				 no components, I think this is the right thing
				 to do.  (mrs)  */
#if 0
			      /* I copied this from below, it is probably
				 needed, but I cannot prove that to myself
				 right now, but if you find it is needed
				 please turn it on. (mrs)  */
			      if (TYPE_LANG_SPECIFIC (t)
				  && CLASSTYPE_DECLARED_EXCEPTION (t))
				shadow_tag ($$);
#endif
			      $$ = NULL_TREE;
			    }
			}
		      else if (TREE_CODE (t) == ENUMERAL_TYPE)
			$$ = grok_enum_decls (t, NULL_TREE);
		      else if (TREE_CODE (t) == RECORD_TYPE)
			{
			  if (TYPE_LANG_SPECIFIC (t)
			      && CLASSTYPE_DECLARED_EXCEPTION (t))
			    shadow_tag ($$);
			  $$ = NULL_TREE;
			}
		      else if (t != void_type_node)
			{
			  error ("empty component declaration");
			  $$ = NULL_TREE;
			}
		      else $$ = NULL_TREE;
		    }
		  else
		    {
		      tree t = TREE_TYPE ($2);
		      if (TREE_CODE (t) == ENUMERAL_TYPE && TREE_NONLOCAL_FLAG (t))
			$$ = grok_enum_decls (t, $2);
		      else
			$$ = $2;
		    }
		  end_exception_decls ();
		}
	| typed_declspecs '(' parmlist ')' ';'
		{ $$ = groktypefield ($$, $3); }
	| typed_declspecs '(' parmlist ')' '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = groktypefield ($$, $3); }
	| typed_declspecs LEFT_RIGHT ';'
		{ $$ = groktypefield ($$, empty_parms ()); }
	| typed_declspecs LEFT_RIGHT '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = groktypefield ($$, empty_parms ()); }
	| declmods components ';'
		{ goto do_components; }
	/* Normal case: make this fast.  */
	| declmods declarator ';'
		{ $$ = grokfield ($2, $$, 0, 0, 0, 0); }
	| declmods components '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  goto do_components; }
	| declmods '(' parmlist ')' ';'
		{ $$ = groktypefield ($$, $3); }
	| declmods '(' parmlist ')' '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = groktypefield ($$, $3); }
	| declmods LEFT_RIGHT ';'
		{ $$ = groktypefield ($$, empty_parms ()); }
	| declmods LEFT_RIGHT '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = groktypefield ($$, empty_parms ()); }
	| ':' expr_no_commas ';'
		{ $$ = grokbitfield (NULL_TREE, NULL_TREE, $2); }
	| ':' expr_no_commas '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = grokbitfield (NULL_TREE, NULL_TREE, $2); }
	| error
		{ $$ = NULL_TREE; }

	/* C++: handle constructors, destructors and inline functions */
	/* note that INLINE is like a TYPESPEC */
	| fn.def2 ':' /* base_init compstmt */
		{ $$ = finish_method ($$); }
	| fn.def2 '{' /* nodecls compstmt */
		{ $$ = finish_method ($$); }
	| notype_declarator maybe_raises ';'
		{ $$ = grokfield ($$, NULL_TREE, $2, NULL_TREE, NULL_TREE); }
	| notype_declarator maybe_raises '}'
		{ error ("missing ';' before right brace");
		  yyungetc ('}', 0);
		  $$ = grokfield ($$, NULL_TREE, $2, NULL_TREE, NULL_TREE); }
	;

components:
	  /* empty: possibly anonymous */
		{ $$ = NULL_TREE; }
	| component_declarator0
	| components ',' component_declarator
		{
		  /* In this context, void_type_node encodes
		     friends.  They have been recorded elsewhere.  */
		  if ($$ == void_type_node)
		    $$ = $3;
		  else
		    $$ = chainon ($$, $3);
		}
	;

component_declarator0:
	  declarator maybe_raises maybeasm maybe_attribute
		{ current_declspecs = $<ttype>0;
		  $$ = grokfield ($$, current_declspecs, $2, NULL_TREE, $3);
		  cplus_decl_attributes ($$, $4); }
	| declarator maybe_raises maybeasm maybe_attribute '=' init
		{ current_declspecs = $<ttype>0;
		  $$ = grokfield ($$, current_declspecs, $2, $6, $3);
		  cplus_decl_attributes ($$, $4); }
	| IDENTIFIER ':' expr_no_commas maybe_attribute
		{ current_declspecs = $<ttype>0;
		  $$ = grokbitfield ($$, current_declspecs, $3);
		  cplus_decl_attributes ($$, $4); }
	| TYPENAME_COLON expr_no_commas maybe_attribute
		{ current_declspecs = $<ttype>0;
		  $$ = grokbitfield ($$, current_declspecs, $2);
		  cplus_decl_attributes ($$, $3); }
	| ':' expr_no_commas
		{ current_declspecs = $<ttype>0;
		  $$ = grokbitfield (NULL_TREE, NULL_TREE, $2); }
	;

component_declarator:
	  declarator maybe_raises maybeasm maybe_attribute
		{ $$ = grokfield ($$, current_declspecs, $2, NULL_TREE, $3);
		  cplus_decl_attributes ($$, $4); }
	| declarator maybe_raises maybeasm maybe_attribute '=' init
		{ $$ = grokfield ($$, current_declspecs, $2, $6, $3);
		  cplus_decl_attributes ($$, $4); }
	| IDENTIFIER ':' expr_no_commas maybe_attribute
		{ $$ = grokbitfield ($$, current_declspecs, $3);
		  cplus_decl_attributes ($$, $4); }
	| TYPENAME_COLON expr_no_commas maybe_attribute
		{ $$ = grokbitfield ($$, current_declspecs, $2);
		  cplus_decl_attributes ($$, $3); }
	| ':' expr_no_commas
		{ $$ = grokbitfield (NULL_TREE, NULL_TREE, $2); }
	;

/* We chain the enumerators in reverse order.
   Because of the way enums are built, the order is
   insignificant.  Take advantage of this fact.  */

enumlist:
	  enumerator
	| enumlist ',' enumerator
		{ TREE_CHAIN ($3) = $$; $$ = $3; }
	;

enumerator:
	  identifier
		{ $$ = build_enumerator ($$, NULL_TREE); }
	| identifier '=' expr_no_commas
		{ $$ = build_enumerator ($$, $3); }
	;

typename:
	  typed_typespecs absdcl
		{ $$ = build_decl_list ($$, $2); }
	| nonempty_type_quals absdcl
		{ $$ = build_decl_list ($$, $2); }
	;

absdcl:   /* an abstract declarator */
	/* empty */ %prec EMPTY
		{ $$ = NULL_TREE; }
	| absdcl1  %prec EMPTY
	| START_DECLARATOR absdcl1  %prec EMPTY
		{ $$ = $2; }
	;

nonempty_type_quals:
	  TYPE_QUAL
		{ $$ = IDENTIFIER_AS_LIST ($$); }
	| nonempty_type_quals TYPE_QUAL
		{ $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	;

type_quals:
	  /* empty */
		{ $$ = NULL_TREE; }
	| type_quals TYPE_QUAL
		{ $$ = decl_tree_cons (NULL_TREE, $2, $$); }
	;

/* These rules must follow the rules for function declarations
   and component declarations.  That way, longer rules are preferred.  */

/* An expression which will not live on the momentary obstack.  */
nonmomentary_expr:
	{ $<itype>$ = suspend_momentary (); } expr
	{ resume_momentary ($<itype>1); $$ = $2; }

/* A declarator that is allowed only after an explicit typespec.  */
/* may all be followed by prec '.' */
after_type_declarator:
	  after_type_declarator '(' nonnull_exprlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| after_type_declarator '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| after_type_declarator LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, empty_parms (), $3); }
	| after_type_declarator '(' error ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, NULL_TREE, NULL_TREE); }
	| after_type_declarator '[' nonmomentary_expr ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, $3); }
	| after_type_declarator '[' ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, NULL_TREE); }
	| '(' after_type_declarator_no_typename ')'
		{ $$ = $2; }
	| '(' '*' type_quals after_type_declarator ')'
		{ $$ = make_pointer_declarator ($3, $4); }
	| PAREN_STAR_PAREN
		{ see_typename (); }
	| after_type_member_declarator
	| '(' '&' type_quals after_type_declarator ')'
		{ $$ = make_reference_declarator ($3, $4); }
	| '*' type_quals after_type_declarator  %prec UNARY
		{ $$ = make_pointer_declarator ($2, $3); }
	| '&' type_quals after_type_declarator  %prec UNARY
		{ $$ = make_reference_declarator ($2, $3); }
	| TYPENAME
	;

after_type_declarator_no_typename:
	  after_type_declarator_no_typename '(' nonnull_exprlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| after_type_declarator_no_typename '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| after_type_declarator_no_typename LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, empty_parms (), $3); }
	| after_type_declarator_no_typename '(' error ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, NULL_TREE, NULL_TREE); }
	| after_type_declarator_no_typename '[' nonmomentary_expr ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, $3); }
	| after_type_declarator_no_typename '[' ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, NULL_TREE); }
	| '(' after_type_declarator_no_typename ')'
		{ $$ = $2; }
	| PAREN_STAR_PAREN
		{ see_typename (); }
	| after_type_member_declarator
	| '*' type_quals after_type_declarator  %prec UNARY
		{ $$ = make_pointer_declarator ($2, $3); }
	| '&' type_quals after_type_declarator  %prec UNARY
		{ $$ = make_reference_declarator ($2, $3); }
	;

/* A declarator allowed whether or not there has been
   an explicit typespec.  These cannot redeclare a typedef-name.  */

notype_declarator:
	  notype_declarator '(' nonnull_exprlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| notype_declarator '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| notype_declarator LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, empty_parms (), $3); }
	| notype_declarator '(' error ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, NULL_TREE, NULL_TREE); }
	| '(' notype_declarator ')'
		{ $$ = $2; }
	| '*' type_quals notype_declarator  %prec UNARY
		{ $$ = make_pointer_declarator ($2, $3); }
	| '&' type_quals notype_declarator  %prec UNARY
		{ $$ = make_reference_declarator ($2, $3); }
	| notype_declarator '[' nonmomentary_expr ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, $3); }
	| notype_declarator '[' ']'
		{ $$ = build_parse_node (ARRAY_REF, $$, NULL_TREE); }
	| IDENTIFIER
		{ see_typename (); }

	/* C++ extensions.  */
	| operator_name
		{ see_typename (); }

	| '~' TYPENAME
		{
		destructor_name:
		  see_typename ();
		  $$ = build_parse_node (BIT_NOT_EXPR, $2);
		}
	| '~' IDENTIFIER
		{ goto destructor_name; }
        | '~' PTYPENAME
                { goto destructor_name; }
	| scoped_id see_typename notype_declarator  %prec '('
		{ see_typename ();
		  if (TREE_CODE ($$) != SCOPE_REF)
		    $$ = build_push_scope ($$, $3);
		  else if (TREE_OPERAND ($$, 1) == NULL_TREE)
		    TREE_OPERAND ($$, 1) = $3;
		  else
		    $$ = build_parse_node (SCOPE_REF, $$, $3);
		}
	| scoped_id see_typename TYPENAME  %prec '('
		{ $$ = build_push_scope ($$, $3); }
	| scoped_id see_typename TYPENAME '(' nonnull_exprlist ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, $5, $7)); }
	| scoped_id see_typename TYPENAME '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, $5, $7)); }
	| scoped_id see_typename TYPENAME LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, empty_parms (), $5)); }
	| scoped_id see_typename TYPENAME '(' error ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, NULL_TREE, NULL_TREE)); }
	/* For constructor templates.  */
	| scoped_id see_typename PTYPENAME  %prec '('
		{ $$ = build_push_scope ($$, $3); }
	| scoped_id see_typename PTYPENAME '(' nonnull_exprlist ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, $5, $7)); }
	| scoped_id see_typename PTYPENAME '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, $5, $7)); }
	| scoped_id see_typename PTYPENAME LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, empty_parms (), $5)); }
	| scoped_id see_typename PTYPENAME '(' error ')' type_quals  %prec '.'
		{ $$ = build_push_scope ($$, build_parse_node (CALL_EXPR, $3, NULL_TREE, NULL_TREE)); }
	| SCOPE see_typename notype_declarator
		{ $$ = build_parse_node (SCOPE_REF, NULL_TREE, $3); }
	;

scoped_id:	typename_scope
		{ $$ = resolve_scope_to_name (NULL_TREE, $$);
		  if ($$ == NULL_TREE)
		    {
		      error ("undefined explicitly scoped type");
		      $$ = error_mark_node; 
		    }
		}
	| template_type SCOPE /* try_for_typename %prec EMPTY */
		{
                  if ($$ == error_mark_node)
                    /* leave it alone */;
                  else
		    {
		      $$ = resolve_scope_to_name (NULL_TREE, TYPE_IDENTIFIER ($$));
		      if ($$ == NULL_TREE)
			{
			  error ("undefined explicitly scoped type");
			  $$ = error_mark_node; 
			}
		    }
/*                  if ($3) popclass (1); */
		}
	;

typename_scope:
	TYPENAME SCOPE;

scoped_typename: SCOPED_TYPENAME
	| template_type SCOPED_TYPENAME
		{
  		  /* Kludge!!! See rule "template_type" and the code
		   * dealing with "template_type_seen_before_scope" in
		   * yylex(). */
		  $$ = $2;
		}
/*	| template_type SCOPE try_for_typename TYPENAME
		{
                  if ($$ == error_mark_node)
                    ;
		  else
		    {
                      $$ = build_parse_node (SCOPE_REF,
                                             TYPE_IDENTIFIER ($$),
                                             $4);
                    }
		  if ($3) popclass (1);
		} */
	;

absdcl1:  /* a nonempty abstract declarator */
	  '(' absdcl1 ')'
		{ see_typename ();
		  $$ = $2; }
	  /* `(typedef)1' is `int'.  */
	| '*' type_quals absdcl1  %prec EMPTY
		{ $$ = make_pointer_declarator ($2, $3); }
	| '*' type_quals  %prec EMPTY
		{ $$ = make_pointer_declarator ($2, NULL_TREE); }
	| PAREN_STAR_PAREN
		{ see_typename (); }
	| '(' abs_member_declarator ')'
		{ $$ = $2; }
	| '&' type_quals absdcl1 %prec EMPTY
		{ $$ = make_reference_declarator ($2, $3); }
	| '&' type_quals %prec EMPTY
		{ $$ = make_reference_declarator ($2, NULL_TREE); }
	| absdcl1 '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, $3, $5); }
	| absdcl1 LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, $$, empty_parms (), $3); }
	| absdcl1 '[' nonmomentary_expr ']'  %prec '.'
		{ $$ = build_parse_node (ARRAY_REF, $$, $3); }
	| absdcl1 '[' ']'  %prec '.'
		{ $$ = build_parse_node (ARRAY_REF, $$, NULL_TREE); }
	| '(' parmlist ')' type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, NULL_TREE, $2, $4); }
	| LEFT_RIGHT type_quals  %prec '.'
		{ $$ = build_parse_node (CALL_EXPR, NULL_TREE, empty_parms (), $2); }
	| '[' nonmomentary_expr ']'  %prec '.'
		{ $$ = build_parse_node (ARRAY_REF, NULL_TREE, $2); }
	| '[' ']'  %prec '.'
		{ $$ = build_parse_node (ARRAY_REF, NULL_TREE, NULL_TREE); }
	;

abs_member_declarator:
	  scoped_id '*' type_quals
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (INDIRECT_REF, 0);
		}
	| scoped_id '*' type_quals absdcl1
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (INDIRECT_REF, $4);
		}
	| scoped_id '&' type_quals
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (ADDR_EXPR, 0);
		}
	| scoped_id '&' type_quals absdcl1
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (ADDR_EXPR, $4);
		}
	;

after_type_member_declarator:
	  scoped_id see_typename '*' type_quals after_type_declarator
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (INDIRECT_REF, $5);
		}
	| scoped_id see_typename '&' type_quals after_type_declarator
		{ tree t;
		  t = $$;
		  while (TREE_OPERAND (t, 1))
		    t = TREE_OPERAND (t, 1);
		  TREE_OPERAND (t, 1) = build_parse_node (ADDR_EXPR, $5);
		}
	;

/* For C++, decls and stmts can be intermixed, so we don't need to
   have a special rule that won't start parsing the stmt section
   until we have a stmt that parses without errors.  */

stmts:
	  stmt
	| errstmt
	| stmts stmt
	| stmts errstmt
	;

errstmt:  error ';'
	;

/* build the LET_STMT node before parsing its contents,
  so that any LET_STMTs within the context can have their display pointers
  set up to point at this one.  */

.pushlevel:  /* empty */
		{ emit_line_note (input_filename, lineno);
		  pushlevel (0);
		  clear_last_expr ();
		  push_momentary ();
		  expand_start_bindings (0);
		  $$ = stmt_decl_msg;
		  stmt_decl_msg = 0; }
	;

/* Read zero or more forward-declarations for labels
   that nested functions can jump to.  */
maybe_label_decls:
	  /* empty */
	| label_decls
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids label declarations"); }
	;

label_decls:
	  label_decl
	| label_decls label_decl
	;

label_decl:
	  LABEL identifiers_or_typenames ';'
		{ tree link;
		  for (link = $2; link; link = TREE_CHAIN (link))
		    {
		      tree label = shadow_label (TREE_VALUE (link));
		      C_DECLARED_LABEL_FLAG (label) = 1;
		      declare_nonlocal_label (label);
		    }
		}
	;

/* This is the body of a function definition.
   It causes syntax errors to ignore to the next openbrace.  */
compstmt_or_error:
	  compstmt
		{}
	| error compstmt
	;

compstmt: '{' '}'
		{ $$ = convert (void_type_node, integer_zero_node); }
	| '{' .pushlevel maybe_label_decls stmts '}'
		{ pop_implicit_try_blocks (NULL_TREE);
		  stmt_decl_msg = $2;
		  expand_end_bindings (getdecls (), kept_level_p (), 1);
		  $$ = poplevel (kept_level_p (), 1, 0);
		  pop_momentary (); }
	| '{' .pushlevel maybe_label_decls error '}'
		{ pop_implicit_try_blocks (NULL_TREE);
		  stmt_decl_msg = $2;
		  expand_end_bindings (getdecls (), kept_level_p (), 1);
		  $$ = poplevel (kept_level_p (), 0, 0);
		  pop_momentary (); }
	;

simple_if:
	  IF '(' expr ')'
		{ emit_line_note (input_filename, lineno);
		  expand_start_cond (truthvalue_conversion ($3), 0);
		  stmt_decl_msg = "if"; }
	  stmt
		{ stmt_decl_msg = 0; }
	;

stmt:
	  compstmt
		{ finish_stmt (); }
	| decl
		{ if (stmt_decl_msg)
		    error ("declaration after %s invalid", stmt_decl_msg);
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| expr ';'
		{
  		  tree expr = $1;
		  emit_line_note (input_filename, lineno);
		  /* Do default conversion if safe and possibly important,
		     in case within ({...}).  */
		  if ((TREE_CODE (TREE_TYPE (expr)) == ARRAY_TYPE
		       && lvalue_p (expr))
		      || TREE_CODE (TREE_TYPE (expr)) == FUNCTION_TYPE)
		    expr = default_conversion (expr);
		  cplus_expand_expr_stmt (expr);
		  clear_momentary ();
		  finish_stmt (); }
	| simple_if ELSE
		{ expand_start_else ();
		  stmt_decl_msg = "else"; }
	  stmt
		{ expand_end_cond ();
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| simple_if %prec IF
		{ expand_end_cond ();
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| WHILE
		{ emit_nop ();
		  emit_line_note (input_filename, lineno);
		  expand_start_loop (1); }
	  '(' expr ')'
		{ expand_exit_loop_if_false (0, truthvalue_conversion ($4));
		  stmt_decl_msg = "while"; }
	  stmt
		{ 
		  expand_end_loop ();
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| DO
		{ emit_nop ();
		  emit_line_note (input_filename, lineno);
		  expand_start_loop_continue_elsewhere (1);
		  stmt_decl_msg = "do"; }
	  stmt WHILE
		{ stmt_decl_msg = 0;
		  expand_loop_continue_here (); }
	  '(' expr ')' ';'
		{ emit_line_note (input_filename, lineno);
		  expand_exit_loop_if_false (0, truthvalue_conversion ($7));
		  expand_end_loop ();
		  clear_momentary ();
		  finish_stmt (); }
	| forhead.1
		{ emit_nop ();
		  emit_line_note (input_filename, lineno);
		  if ($1) cplus_expand_expr_stmt ($1);
		  expand_start_loop_continue_elsewhere (1); }
	  xexpr ';'
		{ emit_line_note (input_filename, lineno);
		  if ($3) expand_exit_loop_if_false (0, truthvalue_conversion ($3)); }
	  xexpr ')'
		/* Don't let the tree nodes for $6 be discarded
		   by clear_momentary during the parsing of the next stmt.  */
		{ push_momentary ();
		  stmt_decl_msg = "for"; }
	  stmt
		{ emit_line_note (input_filename, lineno);
		  expand_loop_continue_here ();
		  if ($6) cplus_expand_expr_stmt ($6);
		  pop_momentary ();
		  expand_end_loop ();
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| forhead.2
		{ emit_nop ();
		  emit_line_note (input_filename, lineno);
		  expand_start_loop_continue_elsewhere (1); }
	  xexpr ';'
		{ emit_line_note (input_filename, lineno);
		  if ($3) expand_exit_loop_if_false (0, truthvalue_conversion ($3)); }
	  xexpr ')'
		/* Don't let the tree nodes for $6 be discarded
		   by clear_momentary during the parsing of the next stmt.  */
		{ push_momentary ();
		  stmt_decl_msg = "for";
		  $<itype>7 = lineno; }
	  stmt
		{ emit_line_note (input_filename, $<itype>7);
		  expand_loop_continue_here ();
		  if ($6) cplus_expand_expr_stmt ($6);
		  pop_momentary ();
		  expand_end_loop ();
		  pop_implicit_try_blocks (NULL_TREE);
		  if ($1)
		    {
		      register int keep = $1 > 0;
		      if (keep) expand_end_bindings (0, keep, 1);
		      poplevel (keep, 1, 0);
		      pop_momentary ();
		    }
		  stmt_decl_msg = 0;
		  finish_stmt ();
		}
	| SWITCH '(' expr ')'
		{ emit_line_note (input_filename, lineno);
		  c_expand_start_case ($3);
		  /* Don't let the tree nodes for $3 be discarded by
		     clear_momentary during the parsing of the next stmt.  */
		  push_momentary ();
		  stmt_decl_msg = "switch"; }
	  stmt
		{ expand_end_case ($3);
		  pop_momentary ();
		  stmt_decl_msg = 0;
		  finish_stmt (); }
	| CASE expr ':'
		{ register tree value = $2;
		  register tree label
		    = build_decl (LABEL_DECL, NULL_TREE, NULL_TREE);

		  /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
		     Strip such NOP_EXPRs.  */
		  if (TREE_CODE (value) == NOP_EXPR
		      && TREE_TYPE (value) == TREE_TYPE (TREE_OPERAND (value, 0)))
		    value = TREE_OPERAND (value, 0);

		  if (TREE_READONLY_DECL_P (value))
		    {
		      value = decl_constant_value (value);
		      /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
			 Strip such NOP_EXPRs.  */
		      if (TREE_CODE (value) == NOP_EXPR
			  && TREE_TYPE (value) == TREE_TYPE (TREE_OPERAND (value, 0)))
			value = TREE_OPERAND (value, 0);
		    }
		  value = fold (value);

		  if (TREE_CODE (value) != INTEGER_CST
		      && value != error_mark_node)
		    {
		      error ("case label does not reduce to an integer constant");
		      value = error_mark_node;
		    }
		  else
		    /* Promote char or short to int.  */
		    value = default_conversion (value);
		  if (value != error_mark_node)
		    {
		      tree duplicate;
		      int success = pushcase (value, label, &duplicate);
		      if (success == 1)
			error ("case label not within a switch statement");
		      else if (success == 2)
			{
			  error ("duplicate case value");
			  error_with_decl (duplicate, "this is the first entry for that value");
			}
		      else if (success == 3)
			warning ("case value out of range");
		      else if (success == 5)
			error ("case label within scope of cleanup or variable array");
		    }
		  define_case_label (label);
		}
	  stmt
	| CASE expr RANGE expr ':'
		{ register tree value1 = $2;
		  register tree value2 = $4;
		  register tree label
		    = build_decl (LABEL_DECL, NULL_TREE, NULL_TREE);

		  if (pedantic)
		    pedwarn ("ANSI C++ forbids range expressions in switch statement");

		  /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
		     Strip such NOP_EXPRs.  */
		  if (TREE_CODE (value1) == NOP_EXPR
		      && TREE_TYPE (value1) == TREE_TYPE (TREE_OPERAND (value1, 0)))
		    value1 = TREE_OPERAND (value1, 0);

		  if (TREE_READONLY_DECL_P (value1))
		    {
		      value1 = decl_constant_value (value1);
		      /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
			 Strip such NOP_EXPRs.  */
		      if (TREE_CODE (value1) == NOP_EXPR
			  && TREE_TYPE (value1) == TREE_TYPE (TREE_OPERAND (value1, 0)))
			value1 = TREE_OPERAND (value1, 0);
		    }
		  value1 = fold (value1);

		  /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
		     Strip such NOP_EXPRs.  */
		  if (TREE_CODE (value2) == NOP_EXPR
		      && TREE_TYPE (value2) == TREE_TYPE (TREE_OPERAND (value2, 0)))
		    value2 = TREE_OPERAND (value2, 0);

		  if (TREE_READONLY_DECL_P (value2))
		    {
		      value2 = decl_constant_value (value2);
		      /* build_c_cast puts on a NOP_EXPR to make a non-lvalue.
			 Strip such NOP_EXPRs.  */
		      if (TREE_CODE (value2) == NOP_EXPR
			  && TREE_TYPE (value2) == TREE_TYPE (TREE_OPERAND (value2, 0)))
			value2 = TREE_OPERAND (value2, 0);
		    }
		  value2 = fold (value2);


		  if (TREE_CODE (value1) != INTEGER_CST
		      && value1 != error_mark_node)
		    {
		      error ("case label does not reduce to an integer constant");
		      value1 = error_mark_node;
		    }
		  if (TREE_CODE (value2) != INTEGER_CST
		      && value2 != error_mark_node)
		    {
		      error ("case label does not reduce to an integer constant");
		      value2 = error_mark_node;
		    }
		  if (value1 != error_mark_node
		      && value2 != error_mark_node)
		    {
		      tree duplicate;
		      int success = pushcase_range (value1, value2, label,
						    &duplicate);
		      if (success == 1)
			error ("case label not within a switch statement");
		      else if (success == 2)
			{
			  error ("duplicate (or overlapping) case value");
			  error_with_decl (duplicate, "this is the first entry overlapping that value");
			}
		      else if (success == 3)
			warning ("case value out of range");
		      else if (success == 4)
			warning ("empty range specified");
		      else if (success == 5)
			error ("case label within scope of cleanup or variable array");
		    }
		  define_case_label (label);
		}
	  stmt
	| DEFAULT ':'
		{
		  tree duplicate;
		  register tree label
		    = build_decl (LABEL_DECL, NULL_TREE, NULL_TREE);
		  int success = pushcase (NULL_TREE, label, &duplicate);
		  if (success == 1)
		    error ("default label not within a switch statement");
		  else if (success == 2)
		    {
		      error ("multiple default labels in one switch");
		      error_with_decl (duplicate, "this is the first default label");
		    }
		  define_case_label (NULL_TREE);
		}
	  stmt
	| BREAK ';'
		{ emit_line_note (input_filename, lineno);
		  if ( ! expand_exit_something ())
		    error ("break statement not within loop or switch"); }
	| CONTINUE ';'
		{ emit_line_note (input_filename, lineno);
		  if (! expand_continue_loop (0))
		    error ("continue statement not within a loop"); }
	| RETURN ';'
		{ emit_line_note (input_filename, lineno);
		  c_expand_return (NULL_TREE); }
	| RETURN expr ';'
		{ emit_line_note (input_filename, lineno);
		  c_expand_return ($2);
		  finish_stmt ();
		}
	| ASM_KEYWORD maybe_type_qual '(' string ')' ';'
		{ if (TREE_CHAIN ($4)) $4 = combine_strings ($4);
		  emit_line_note (input_filename, lineno);
		  expand_asm ($4);
		  finish_stmt ();
		}
	/* This is the case with just output operands.  */
	| ASM_KEYWORD maybe_type_qual '(' string ':' asm_operands ')' ';'
		{ if (TREE_CHAIN ($4)) $4 = combine_strings ($4);
		  emit_line_note (input_filename, lineno);
		  c_expand_asm_operands ($4, $6, NULL_TREE, NULL_TREE,
					 $2 == ridpointers[(int)RID_VOLATILE],
					 input_filename, lineno);
		  finish_stmt ();
		}
	/* This is the case with input operands as well.  */
	| ASM_KEYWORD maybe_type_qual '(' string ':' asm_operands ':' asm_operands ')' ';'
		{ if (TREE_CHAIN ($4)) $4 = combine_strings ($4);
		  emit_line_note (input_filename, lineno);
		  c_expand_asm_operands ($4, $6, $8, NULL_TREE,
					 $2 == ridpointers[(int)RID_VOLATILE],
					 input_filename, lineno);
		  finish_stmt ();
		}
	/* This is the case with clobbered registers as well.  */
	| ASM_KEYWORD maybe_type_qual '(' string ':' asm_operands ':'
  	  asm_operands ':' asm_clobbers ')' ';'
		{ if (TREE_CHAIN ($4)) $4 = combine_strings ($4);
		  emit_line_note (input_filename, lineno);
		  c_expand_asm_operands ($4, $6, $8, $10,
					 $2 == ridpointers[(int)RID_VOLATILE],
					 input_filename, lineno);
		  finish_stmt ();
		}
	| GOTO '*' expr ';'
		{ emit_line_note (input_filename, lineno);
		  expand_computed_goto ($3); }
	| GOTO identifier ';'
		{ tree decl;
		  emit_line_note (input_filename, lineno);
		  decl = lookup_label ($2);
		  TREE_USED (decl) = 1;
		  expand_goto (decl); }
	| label_colon stmt
		{ finish_stmt (); }
	| label_colon '}'
		{ error ("label must be followed by statement");
		  yyungetc ('}', 0);
		  finish_stmt (); }
	| ';'
		{ finish_stmt (); }

	/* Exception handling extensions.  */
	| ANSI_THROW ';' { cplus_expand_throw (NULL_TREE); }
	| ANSI_THROW expr ';' { cplus_expand_throw ($2); }
	| THROW raise_identifier '(' nonnull_exprlist ')' ';'
		{ cplus_expand_raise ($2, $4, NULL_TREE, 0);
		  finish_stmt (); }
	| THROW raise_identifier LEFT_RIGHT ';'
		{ cplus_expand_raise ($2, NULL_TREE, NULL_TREE, 0);
		  finish_stmt (); }
	| RAISE raise_identifier '(' nonnull_exprlist ')' ';'
		{ cplus_expand_raise ($2, $4, NULL_TREE, 0);
		  finish_stmt (); }
	| RAISE raise_identifier LEFT_RIGHT ';'
		{ cplus_expand_raise ($2, NULL_TREE, NULL_TREE, 0);
		  finish_stmt (); }
	| RAISE identifier ';'
		{ cplus_expand_reraise ($2);
		  finish_stmt (); }
	| try EXCEPT identifier '{'
		{
		  tree decl = cplus_expand_end_try ($1);
		  $<ttype>2 = current_exception_type;
		  $<ttype>4 = current_exception_decl;
		  $<ttype>$ = current_exception_object;
		  cplus_expand_start_except ($3, decl);
		  pushlevel (0);
		  clear_last_expr ();
		  push_momentary ();
		  expand_start_bindings (0);
		  stmt_decl_msg = 0;
		}
	  except_stmts '}'
		{
		  tree decls = getdecls ();
		  /* If there is a default exception to handle,
		     handle it here.  */
		  if ($6)
		    {
		      tree decl = build_decl (CPLUS_CATCH_DECL, NULL_TREE, 0);
		      tree block;

		      pushlevel (1);
		      expand_start_bindings (0);
		      expand_expr ($6, 0, 0, 0);
		      expand_end_bindings (0, 1, 0);
		      block = poplevel (1, 0, 0);

		      /* This is a catch block.  */
		      TREE_LANG_FLAG_2 (block) = 1;
		      BLOCK_VARS (block) = decl;
		    }

		  expand_end_bindings (decls, decls != 0, 1);
		  poplevel (decls != 0, 1, 0);
		  pop_momentary ();
		  current_exception_type = $<ttype>2;
		  current_exception_decl = $<ttype>4;
		  current_exception_object = $<ttype>5;
		  cplus_expand_end_except ($6);
		}
	| try error
		{
		  cplus_expand_end_try ($1);
		  /* These are the important actions of
		     `cplus_expand_end_except' which we must emulate.  */
		  if (expand_escape_except ())
		    expand_end_except ();
		  expand_end_bindings (0, 0, 1);
		  poplevel (0, 0, 0);
		}
	| ansi_try ansi_dummy ansi_dummy
		{
		  tree decl = cplus_expand_end_try ($1);
		  $<ttype>2 = current_exception_type;
		  $<ttype>3 = current_exception_decl;
		  $<ttype>$ = current_exception_object;
		  cplus_expand_start_except (NULL, decl);
		  pushlevel (0);
		  clear_last_expr ();
		  push_momentary ();
		  expand_start_bindings (0);
		  stmt_decl_msg = 0;
		}
	  ansi_except_stmts
		{
		  tree decls = getdecls ();
		  /* If there is a default exception to handle,
		     handle it here.  */
		  if ($5)
		    {
		      tree decl = build_decl (CPLUS_CATCH_DECL, NULL_TREE, 0);
		      tree block;

		      pushlevel (1);
		      expand_start_bindings (0);
		      expand_expr ($5, 0, 0, 0);
		      expand_end_bindings (0, 1, 0);
		      block = poplevel (1, 0, 0);

		      /* This is a catch block.  */
		      TREE_LANG_FLAG_2 (block) = 1;
		      BLOCK_VARS (block) = decl;
		    }

		  expand_end_bindings (decls, decls != 0, 1);
		  poplevel (decls != 0, 1, 0);
		  pop_momentary ();
		  current_exception_type = $<ttype>2;
		  current_exception_decl = $<ttype>3;
		  current_exception_object = $<ttype>4;
		  cplus_expand_end_except ($5);
		}
	| try RERAISE raise_identifiers /* ';' checked for at bottom.  */
		{ tree name = get_identifier ("(compiler error)");
		  tree orig_ex_type = current_exception_type;
		  tree orig_ex_decl = current_exception_decl;
		  tree orig_ex_obj = current_exception_object;
		  tree decl = cplus_expand_end_try ($1), decls;

		  /* Start hidden EXCEPT.  */
		  cplus_expand_start_except (name, decl);
		  pushlevel (0);
		  clear_last_expr ();
		  push_momentary ();
		  expand_start_bindings (0);
		  stmt_decl_msg = 0;

		  /* This sets up the reraise.  */
		  cplus_expand_reraise ($3);

		  decls = getdecls ();
		  expand_end_bindings (decls, decls != 0, 1);
		  poplevel (decls != 0, 1, 0);
		  pop_momentary ();
		  current_exception_type = orig_ex_type;
		  current_exception_decl = orig_ex_decl;
		  current_exception_object = orig_ex_obj;
		  /* This will reraise for us.  */
		  cplus_expand_end_except (error_mark_node);
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  if (yychar != ';')
		    error ("missing ';' after reraise statement");
		}
	| try  %prec EMPTY
		{ yyerror ("`except' missing after `try' statement");
		  /* Terminate the binding contour started by special
		     code in `.pushlevel'.  Automagically pops off
		     the conditional we started for `try' stmt.  */
		  cplus_expand_end_try ($1);
		  expand_end_bindings (0, 0, 1);
		  poplevel (0, 0, 0);
		  pop_momentary ();
		  YYERROR; }
	;

try:	  try_head '}'
		/* An empty try block is degenerate, but it's better to
		   do extra work here than to do all the special-case work
		   everywhere else.  */
		{
		  $$ = 1;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	| try_head stmts '}'
		{
		  $$ = 1;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	| try_head error '}'
		{
		  $$ = 0;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	;

label_colon:
	  IDENTIFIER ':'
		{ tree label;
		do_label:
		  label = define_label (input_filename, lineno, $1);
		  if (label)
		    expand_label (label);
		}
	| PTYPENAME ':'
		{ goto do_label; }
	| TYPENAME_COLON
		{ tree label = define_label (input_filename, lineno, $1);
		  if (label)
		    expand_label (label);
		}
	;

try_head: TRY '{' { cplus_expand_start_try (0); } .pushlevel

ansi_try:	  ansi_try_head '}'
		/* An empty try block is degenerate, but it's better to
		   do extra work here than to do all the special-case work
		   everywhere else.  */
		{
		  $$ = 1;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	| ansi_try_head stmts '}'
		{
		  $$ = 1;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	| ansi_try_head error '}'
		{
		  $$ = 0;
		  pop_implicit_try_blocks (NULL_TREE);
		}
	;

ansi_dummy: ; /* Temporary place-holder. */
ansi_try_head: ANSI_TRY '{' { cplus_expand_start_try (0); } .pushlevel

except_stmts:
	  /* empty */
		{ $$ = NULL_TREE; }
	| except_stmts raise_identifier
		{
		  tree type = lookup_exception_type (current_class_type, current_class_name, $2);
		  if (type == NULL_TREE)
		    {
		      error ("`%s' is not an exception type",
			     IDENTIFIER_POINTER (TREE_VALUE ($2)));
		      current_exception_type = NULL_TREE;
		      TREE_TYPE (current_exception_object) = error_mark_node;
		    }
		  else
		    {
		      current_exception_type = type;
		      /* In-place union.  */
		      TREE_TYPE (current_exception_object) = type;
		    }
		  $2 = cplus_expand_start_catch ($2);
		  pushlevel (1);
		  expand_start_bindings (0);
		}
	  compstmt
		{
		  expand_end_bindings (0, 1, 0);
		  $4 = poplevel (1, 0, 0);

		  cplus_expand_end_catch (0);

		  /* Mark this as a catch block.  */
		  TREE_LANG_FLAG_2 ($4) = 1;
		  if ($2 != error_mark_node)
		    {
		      tree decl = build_decl (CPLUS_CATCH_DECL, DECL_NAME ($2), 0);
		      DECL_RTL (decl) = DECL_RTL ($2);
		      TREE_CHAIN (decl) = BLOCK_VARS ($4);
		      BLOCK_VARS ($4) = decl;
		    }
		}
	| except_stmts DEFAULT
		{
		  if ($1)
		    error ("duplicate default in exception handler");
		  current_exception_type = NULL_TREE;
		  /* Takes it right out of scope.  */
		  TREE_TYPE (current_exception_object) = error_mark_node;

		  if (! expand_catch_default ())
		    compiler_error ("default catch botch");

		  /* The default exception is handled as the
		     last in the chain of exceptions handled.  */
		  do_pending_stack_adjust ();
		  start_sequence ();
		  $1 = make_node (RTL_EXPR);
		  TREE_TYPE ($1) = void_type_node;
		}
	  compstmt
		{
		  extern struct rtx_def *get_insns ();
		  do_pending_stack_adjust ();
		  if (! expand_catch (NULL_TREE))
		    compiler_error ("except nesting botch");
		  if (! expand_end_catch ())
		    compiler_error ("except nesting botch");
		  RTL_EXPR_SEQUENCE ($1) = get_insns ();
		  if ($4)
		    {
		      /* Mark this block as the default catch block.  */
		      TREE_LANG_FLAG_1 ($4) = 1;
		      TREE_LANG_FLAG_2 ($4) = 1;
		    }
		  end_sequence ();
		}
	;

optional_identifier:
	  /* empty */
		{ $$ = NULL_TREE; }
	| identifier ;

ansi_except_stmts:
	  /* empty */
		{ $$ = NULL_TREE; }
	| ansi_except_stmts CATCH '(' typename optional_identifier ')'
		{
		  extern tree ansi_expand_start_catch ();
		  extern tree cplus_exception_name ();
		  tree type = groktypename ($4);
		  current_exception_type = type;
		  /* In-place union.  */
		  if ($5)
		    {
		      tree tmp;
		      tmp = pushdecl (build_decl (VAR_DECL, $5, type));
		      current_exception_object =
		          build1 (INDIRECT_REF, type, tmp);
		     }
		  $4 = ansi_expand_start_catch(type);
		  pushlevel (1);
		  expand_start_bindings (0);
		}
	  compstmt
		{
		  expand_end_bindings (0, 1, 0);
		  $8 = poplevel (1, 0, 0);

		  cplus_expand_end_catch (0);

		  /* Mark this as a catch block.  */
		  TREE_LANG_FLAG_2 ($8) = 1;
		  if ($4 != error_mark_node)
		    {
		      tree decl = build_decl (CPLUS_CATCH_DECL, DECL_NAME ($4), 0);
		      DECL_RTL (decl) = DECL_RTL ($4);
		      TREE_CHAIN (decl) = BLOCK_VARS ($8);
		      BLOCK_VARS ($8) = decl;
		    }
		}
	;

forhead.1:
	  FOR '(' ';'
		{ $$ = NULL_TREE; }
	| FOR '(' expr ';'
		{ $$ = $3; }
	| FOR '(' '{' '}'
		{ $$ = NULL_TREE; }
	;

forhead.2:
	  FOR '(' decl
		{ $$ = 0; }
	| FOR '(' error ';'
		{ $$ = 0; }
	| FOR '(' '{' .pushlevel stmts '}'
		{ $$ = 1; }
	| FOR '(' '{' .pushlevel error '}'
		{ $$ = -1; }
	;

/* Either a type-qualifier or nothing.  First thing in an `asm' statement.  */

maybe_type_qual:
	/* empty */
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids use of `asm' keyword");
		  emit_line_note (input_filename, lineno); }
	| TYPE_QUAL
		{ if (pedantic)
		    pedwarn ("ANSI C++ forbids use of `asm' keyword");
		  emit_line_note (input_filename, lineno); }
	;

xexpr:
	/* empty */
		{ $$ = NULL_TREE; }
	| expr
	| error
		{ $$ = NULL_TREE; }
	;

/* These are the operands other than the first string and colon
   in  asm ("addextend %2,%1": "=dm" (x), "0" (y), "g" (*x))  */
asm_operands: /* empty */
		{ $$ = NULL_TREE; }
	| nonnull_asm_operands
	;

nonnull_asm_operands:
	  asm_operand
	| nonnull_asm_operands ',' asm_operand
		{ $$ = chainon ($$, $3); }
	;

asm_operand:
	  STRING '(' expr ')'
		{ $$ = build_tree_list ($$, $3); }
	;

asm_clobbers:
	  STRING
		{ $$ = tree_cons (NULL_TREE, $$, NULL_TREE); }
	| asm_clobbers ',' STRING
		{ $$ = tree_cons (NULL_TREE, $3, $$); }
	;

/* This is what appears inside the parens in a function declarator.
   Its value is represented in the format that grokdeclarator expects.

   In C++, declaring a function with no parameters
   means that that function takes *no* parameters.  */
parmlist:  /* empty */
		{
		  if (strict_prototype)
		    $$ = void_list_node;
		  else
		    $$ = NULL_TREE;
		}
	| parms
  		{
		  $$ = chainon ($$, void_list_node);
		  TREE_PARMLIST ($$) = 1;
		}
	| parms ',' ELLIPSIS
		{
		  TREE_PARMLIST ($$) = 1;
		}
	/* C++ allows an ellipsis without a separating ',' */
	| parms ELLIPSIS
		{
		  TREE_PARMLIST ($$) = 1;
		}
	| ELLIPSIS
		{
		  /* ARM $8.2.5 has this as a boxed-off comment.  */
		  if (pedantic)
		    warning ("use of `...' without a first argument is non-portable");
		  $$ = NULL_TREE;
		}
	| TYPENAME_ELLIPSIS
		{
		  TREE_PARMLIST ($$) = 1;
		}
	| parms TYPENAME_ELLIPSIS
		{
		  TREE_PARMLIST ($$) = 1;
		}
	| parms ':'
		{
		  /* This helps us recover from really nasty
		     parse errors, for example, a missing right
		     parenthesis.  */
		  yyerror ("possibly missing ')'");
		  $$ = chainon ($$, void_list_node);
		  TREE_PARMLIST ($$) = 1;
		  yyungetc (':', 0);
		  yychar = ')';
		}
	;

/* A nonempty list of parameter declarations or type names.  */
parms:
	  parm
		{ $$ = build_tree_list (NULL_TREE, $$); }
	| parm '=' init
		{ $$ = build_tree_list ($3, $$); }
	| parms ',' parm
		{ $$ = chainon ($$, build_tree_list (NULL_TREE, $3)); }
	| parms ',' parm '=' init
		{ $$ = chainon ($$, build_tree_list ($5, $3)); }
	| parms ',' bad_parm
		{ $$ = chainon ($$, build_tree_list (NULL_TREE, $3)); }
	| parms ',' bad_parm '=' init
		{ $$ = chainon ($$, build_tree_list ($5, $3)); }
	;

/* A single parameter declaration or parameter type name,
   as found in a parmlist.  The first four cases make up for 10%
   of the time spent parsing C++.  We cannot use them because
   of `int id[]' which won't get parsed properly.  */
parm:
/*
	  typed_declspecs dont_see_typename '*' IDENTIFIER
		{ $$ = build_tree_list ($$, build_parse_node (INDIRECT_REF, $4));
		  see_typename (); }
	| typed_declspecs dont_see_typename '&' IDENTIFIER
		{ $$ = build_tree_list ($$, build_parse_node (ADDR_EXPR, $4));
		  see_typename (); }
	| TYPENAME IDENTIFIER
		{ $$ = build_tree_list (list_hash_lookup_or_cons ($$), $2);  }
	| TYPESPEC IDENTIFIER
		{ $$ = build_tree_list (list_hash_lookup_or_cons ($$), $2); }
	| */
	  typed_declspecs dont_see_typename abs_or_notype_decl
		{ $$ = build_tree_list ($$, $3);
		  see_typename (); }
	| declmods dont_see_typename abs_or_notype_decl
		{ $$ = build_tree_list ($$, $3);
		  see_typename (); }
	;

abs_or_notype_decl: absdcl
	| notype_declarator
	| START_DECLARATOR notype_declarator
		{ $$ = $2; }
	;

see_typename: type_quals
	{ see_typename (); }
	;

dont_see_typename: /* empty */
	{ dont_see_typename (); }
	;

/*
try_for_typename:
        {
	  if ($<ttype>-1 == error_mark_node)
            $$ = 0;
          else
            {
              $$ = 1;
              pushclass ($<ttype>-1, 1);
            }
        }
	;
*/

bad_parm:
	  abs_or_notype_decl
		{
		  warning ("type specifier omitted for parameter");
		  $$ = build_tree_list (TREE_PURPOSE (TREE_VALUE ($<ttype>-1)), $$);
		}
	;

maybe_raises:
	  /* empty */
		{ $$ = NULL_TREE; }
	| RAISES raise_identifiers  %prec EMPTY
		{ $$ = $2; }
	| ANSI_THROW '(' ansi_raise_identifiers  ')' %prec EMPTY
		{ $$ = $3; }
	;

raise_identifier:
	  ALL
		{ $$ = void_list_node; }
	| IDENTIFIER
		{ $$ = build_decl_list (NULL_TREE, $$); }
	| TYPENAME
		{ $$ = build_decl_list (NULL_TREE, $$); }
	| SCOPE IDENTIFIER
		{ $$ = build_decl_list (void_type_node, $2); }
	| SCOPE TYPENAME
		{ $$ = build_decl_list (void_type_node, $2); }
	| scoped_id IDENTIFIER
		{ $$ = build_decl_list ($$, $2); }
	| scoped_typename
	;

ansi_raise_identifier:
	  typename
		{ $$ = build_decl_list (NULL_TREE, $$); }
	;

raise_identifiers:
	  raise_identifier
	| raise_identifiers ',' raise_identifier
		{
  		  TREE_CHAIN ($3) = $$;
		  $$ = $3;
		}
	;

ansi_raise_identifiers:
	  ansi_raise_identifier
	| ansi_raise_identifiers ',' ansi_raise_identifier
		{
  		  TREE_CHAIN ($3) = $$;
		  $$ = $3;
		}
	;

operator_name:
	  OPERATOR '*'
		{ $$ = ansi_opname[MULT_EXPR]; }
	| OPERATOR '/'
		{ $$ = ansi_opname[TRUNC_DIV_EXPR]; }
	| OPERATOR '%'
		{ $$ = ansi_opname[TRUNC_MOD_EXPR]; }
	| OPERATOR '+'
		{ $$ = ansi_opname[PLUS_EXPR]; }
	| OPERATOR '-'
		{ $$ = ansi_opname[MINUS_EXPR]; }
	| OPERATOR '&'
		{ $$ = ansi_opname[BIT_AND_EXPR]; }
	| OPERATOR '|'
		{ $$ = ansi_opname[BIT_IOR_EXPR]; }
	| OPERATOR '^'
		{ $$ = ansi_opname[BIT_XOR_EXPR]; }
	| OPERATOR '~'
		{ $$ = ansi_opname[BIT_NOT_EXPR]; }
	| OPERATOR ','
		{ $$ = ansi_opname[COMPOUND_EXPR]; }
	| OPERATOR ARITHCOMPARE
		{ $$ = ansi_opname[$2]; }
	| OPERATOR '<'
		{ $$ = ansi_opname[LT_EXPR]; }
	| OPERATOR '>'
		{ $$ = ansi_opname[GT_EXPR]; }
	| OPERATOR EQCOMPARE
		{ $$ = ansi_opname[$2]; }
	| OPERATOR ASSIGN
		{ $$ = ansi_assopname[$2]; }
	| OPERATOR '='
		{
		  $$ = ansi_opname [MODIFY_EXPR];
		  if (current_class_type)
		    {
		      TYPE_HAS_ASSIGNMENT (current_class_type) = 1;
		      TYPE_GETS_ASSIGNMENT (current_class_type) = 1;
		    }
		}
	| OPERATOR LSHIFT
		{ $$ = ansi_opname[$2]; }
	| OPERATOR RSHIFT
		{ $$ = ansi_opname[$2]; }
	| OPERATOR PLUSPLUS
		{ $$ = ansi_opname[POSTINCREMENT_EXPR]; }
	| OPERATOR MINUSMINUS
		{ $$ = ansi_opname[PREDECREMENT_EXPR]; }
	| OPERATOR ANDAND
		{ $$ = ansi_opname[TRUTH_ANDIF_EXPR]; }
	| OPERATOR OROR
		{ $$ = ansi_opname[TRUTH_ORIF_EXPR]; }
	| OPERATOR '!'
		{ $$ = ansi_opname[TRUTH_NOT_EXPR]; }
	| OPERATOR '?' ':'
		{ $$ = ansi_opname[COND_EXPR]; }
	| OPERATOR MIN_MAX
		{ $$ = ansi_opname[$2]; }
	| OPERATOR POINTSAT  %prec EMPTY
		{ $$ = ansi_opname[COMPONENT_REF];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TYPE_OVERLOADS_ARROW (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}
	| OPERATOR POINTSAT_STAR  %prec EMPTY
		{ $$ = ansi_opname[MEMBER_REF];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TYPE_OVERLOADS_ARROW (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}
	| OPERATOR POINTSAT_LEFT_RIGHT type_quals  %prec '.'
		{
		  if (yychar == YYEMPTY)
		    yychar = YYLEX;
		  if (yychar == '(' || yychar == LEFT_RIGHT)
		    {
		      $$ = ansi_opname[METHOD_CALL_EXPR];
		      if (current_class_type)
			{
			  tree t = current_class_type;
			  while (t)
			    {
			      TYPE_OVERLOADS_METHOD_CALL_EXPR (t) = 1;
			      t = TYPE_NEXT_VARIANT (t);
			    }
			}
		    }
		  else
		    {
		      $$ = build_parse_node (CALL_EXPR, ansi_opname[COMPONENT_REF], void_list_node, $3);
		      if (current_class_type)
			{
			  tree t = current_class_type;
			  while (t)
			    {
			      TYPE_OVERLOADS_ARROW (t) = 1;
			      t = TYPE_NEXT_VARIANT (t);
			    }
			}
		    }
		}
	| OPERATOR LEFT_RIGHT
		{ $$ = ansi_opname[CALL_EXPR];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TYPE_OVERLOADS_CALL_EXPR (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}
	| OPERATOR '[' ']'
		{ $$ = ansi_opname[ARRAY_REF];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TYPE_OVERLOADS_ARRAY_REF (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}
	| OPERATOR NEW
		{
		  $$ = ansi_opname[NEW_EXPR];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TREE_GETS_NEW (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}
	| OPERATOR DELETE
		{
		  $$ = ansi_opname[DELETE_EXPR];
		  if (current_class_type)
		    {
		      tree t = current_class_type;
		      while (t)
			{
			  TREE_GETS_DELETE (t) = 1;
			  t = TYPE_NEXT_VARIANT (t);
			}
		    }
		}

	/* These should do `groktypename' and set up TREE_HAS_X_CONVERSION
	   here, rather than doing it in class.c .  */
	| OPERATOR typed_typespecs absdcl
		{ $$ = build1 (TYPE_EXPR, $2, $3); }
	| OPERATOR error
		{ $$ = ansi_opname[ERROR_MARK]; }
	;

%%

tree
get_current_declspecs ()
{
  return current_declspecs;
}
