/* Parse Tree representation of Expressions */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "node.h"

void yyerror(const char *str);
void yyserror(const char *str, char *other);

/* For error reporting */
static char* show_expr(node_ptr expr);

/* The symbol table */
#define SYM_LIM 100
static node_ptr sym_tab[2][SYM_LIM];
static int sym_count = 0;

extern FILE *outfile;

static void add_symbol(node_ptr name, node_ptr val)
{
    if (sym_count >= SYM_LIM) {
	yyerror("Symbol table limit exceeded");
	return;
    }
    sym_tab[0][sym_count] = name;
    sym_tab[1][sym_count] = val;
    sym_count++;
}

/* Initialization */
void init_node()
{
}

static char *node_names[] =
  {"quote", "var", "num", "and", "or", "not", "comp", "ele", "case"};

static void show_node(node_ptr node)
{
    printf("Node type: %s, Boolean ? %c, String value: %s\n",
	   node_names[node->type], node->isbool ? 'Y':'N', node->sval);
}


void finish_node(int check_ref)
{
    if (check_ref) {
	int i;
	for (i = 0; i < sym_count; i++)
	    if (!sym_tab[0][i]->ref) {
		fprintf(stderr, "Warning, argument '%s' not referenced\n",
			sym_tab[0][i]->sval);
	    }
    }
}

static node_ptr find_symbol(char *name)
{
    int i;
    for (i = 0; i < sym_count; i++) {
	if (strcmp(name, sym_tab[0][i]->sval) == 0) {
	    node_ptr result = sym_tab[1][i];
	    sym_tab[0][i]->ref++;
	    return result;
	}
    }
    yyserror("Symbol %s not found", name);
    return NULL;
}

static node_ptr new_node(node_type_t t, int isbool,
			 char *s, node_ptr a1, node_ptr a2)
{
    node_ptr result = malloc(sizeof(node_rec));
    result->type = t;
    result->isbool = isbool;
    result->sval = s;
    result->arg1 = a1;
    result->arg2 = a2;
    result->ref = 0;
    result->next = NULL;
    return result;
}

/* Concatenate two lists */
node_ptr concat(node_ptr n1, node_ptr n2)
{
    node_ptr tail = n1;
    if (!n1)
	return n2;
    while (tail->next)
	tail = tail->next;
    tail->next = n2;
    return n1;
}

static void free_node(node_ptr n)
{
    free(n->sval);
    free(n);
}

node_ptr make_quote(char *qstring)
{

    /* Quoted string still has quotes around it */
    int len = strlen(qstring)-2;
    char *sname = malloc(len+1);
    strncpy(sname, qstring+1, len);
    sname[len] = '\0';
    return new_node(N_QUOTE, 0, sname, NULL, NULL);
}

node_ptr make_var(char *name)
{
    char *sname = malloc(strlen(name)+1);
    strcpy(sname, name);
    /* Initially assume var is not Boolean */
    return new_node(N_VAR, 0, sname, NULL, NULL);
}

node_ptr make_num(char *name)
{
    char *sname = malloc(strlen(name)+1);
    strcpy(sname, name);
    return new_node(N_NUM, 0, sname, NULL, NULL);
}

void set_bool(node_ptr varnode)
{
    if (!varnode)
	yyerror("Null node encountered");
    varnode->isbool = 1;
}

/* Make sure argument is OK */
static int check_arg(node_ptr arg, int wantbool)
{
    if (!arg) {
	yyerror("Null node encountered");
	return 0;
    }
    if (arg->type == N_VAR) {
	node_ptr qval = find_symbol(arg->sval);
	if (!qval) {
	    yyserror("Variable '%s' not found", arg->sval);
	    return 0;
	}
	if (wantbool != qval->isbool) {
	    if (wantbool)
		yyserror("Variable '%s' not Boolean", arg->sval);
	    else
		yyserror("Variable '%s' not integer", arg->sval);
	    return 0;
	}
	return 1;
    }
    if (arg->type == N_NUM) {
        if (wantbool && strcmp(arg->sval,"0") != 0 &&
	    strcmp(arg->sval,"1") != 0) {
	    yyserror("Value '%s' not Boolean", arg->sval);
	    return 0;
        }
	return 1;
    }
    if (wantbool && !arg->isbool)
	yyserror("Non Boolean argument '%s'", show_expr(arg));
    if (!wantbool && arg->isbool)
	yyserror("Non integer argument '%s'", show_expr(arg));
    return (wantbool == arg->isbool);
}

node_ptr make_not(node_ptr arg)
{
    check_arg(arg, 1);
    return new_node(N_NOT, 1, "!", arg, NULL);
}

node_ptr make_and(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 1);
    return new_node(N_AND, 1, "&", arg1, arg2);
}

node_ptr make_or(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 1);
    return new_node(N_OR, 1, "|", arg1, arg2);
}

node_ptr make_comp(node_ptr op, node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 0);
    check_arg(arg2, 0);
    return new_node(N_COMP, 1, op->sval, arg1, arg2);
}

node_ptr make_ele(node_ptr arg1, node_ptr arg2)
{
    node_ptr ele;
    check_arg(arg1, 0);
    for (ele = arg1; ele; ele = ele->next)
	check_arg(ele, 0);
    return new_node(N_ELE, 1, "in", arg1, arg2);
}

node_ptr make_case(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 0);
    return new_node(N_CASE, 0, ":", arg1, arg2);
}

void insert_code(node_ptr qstring)
{
    if (!qstring)
	yyerror("Null node");
    else {
	fputs(qstring->sval, outfile);
	fputs("\n", outfile);
    }
}

void add_arg(node_ptr var, node_ptr qstring, int isbool)
{
    if (!var || !qstring) {
	yyerror("Null node");
	return;
    }
    add_symbol(var, qstring);
    if (isbool) {
	set_bool(var);
	set_bool(qstring);
    }
}

static char expr_buf[1024];
static int errlen = 0;
#define MAXERRLEN 80

/* Recursively display expression for error reporting */
static void show_expr_helper(node_ptr expr)
{
    switch(expr->type) {
	int len;
	node_ptr ele;
    case N_QUOTE:
	len = strlen(expr->sval) + 2;
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "'%s'", expr->sval);
	    errlen += len;
	}
	break;
    case N_VAR:
	len = strlen(expr->sval);
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, expr->sval);
	    errlen += len;
	}
	break;
    case N_NUM:
	len = strlen(expr->sval);
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, expr->sval);
	    errlen += len;
	}
	break;
    case N_AND:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " & ");
	    errlen+=3;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_OR:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " | ");
	    errlen+=3;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_NOT:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "!");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	}
	break;
    case N_COMP:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " %s ", expr->sval);
	    errlen+=4;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_ELE:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " in {");
	    errlen+=5;
	}
	for (ele = expr->arg2; ele; ele=ele->next) {
	    if (errlen < MAXERRLEN) {
		show_expr_helper(ele);
		if (ele->next) {
		    sprintf(expr_buf+errlen, ", ");
		    errlen+=2;
		}
	    }
	}
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "})");
	    errlen+=2;
	}
	break;
    case N_CASE:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "[ ");
	    errlen+=2;
	}
	for (ele = expr; errlen < MAXERRLEN && ele; ele=ele->next) {
	    show_expr_helper(ele->arg1);
	    sprintf(expr_buf+errlen, " : ");
	    errlen += 3;
	    show_expr_helper(ele->arg2);
	}
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, " ]");
	    errlen+=2;
	}
	break;
    default:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "??");
	    errlen+=2;
	}
	break;
    }
}

static char *show_expr(node_ptr expr)
{
    errlen = 0;
    show_expr_helper(expr);
    if (errlen >= MAXERRLEN)
	sprintf(expr_buf+errlen, "...");
    return expr_buf;
}

/* Recursively generate code for function */
static void gen_expr(node_ptr expr)
{
    node_ptr ele;
    switch(expr->type) {
    case N_QUOTE:
	yyserror("Unexpected quoted string", expr->sval);
	break;
    case N_VAR:
	{
	    node_ptr qstring = find_symbol(expr->sval);
	    if (qstring)
		fprintf(outfile, "(%s)", qstring->sval);
	    else
		yyserror("Invalid variable '%s'", expr->sval);
	}
	break;
    case N_NUM:
 	fputs(expr->sval, outfile);
	break;
    case N_AND:
	fprintf(outfile, "(");
	gen_expr(expr->arg1);
	fprintf(outfile, " & ");
	gen_expr(expr->arg2);
	fprintf(outfile, ")");
	break;
    case N_OR:
	fprintf(outfile, "(");
	gen_expr(expr->arg1);
	fprintf(outfile, " | ");
	gen_expr(expr->arg2);
	fprintf(outfile, ")");
	break;
    case N_NOT:
	fprintf(outfile, "!");
	gen_expr(expr->arg1);
	break;
    case N_COMP:
	fprintf(outfile, "(");
	gen_expr(expr->arg1);
	fprintf(outfile, " %s ", expr->sval);
	gen_expr(expr->arg2);
	fprintf(outfile, ")");
	break;
    case N_ELE:
	fprintf(outfile, "(");
	for (ele = expr->arg2; ele; ele=ele->next) {
	    gen_expr(expr->arg1);
	    fprintf(outfile, " == ");
	    gen_expr(ele);
	    if (ele->next)
		fprintf(outfile, "||");
	}
	fprintf(outfile, ")");
	break;
    case N_CASE:
	fprintf(outfile, "(");
	for (ele = expr; ele; ele=ele->next) {
	    gen_expr(ele->arg1);
	    fprintf(outfile, " ? ");
	    gen_expr(ele->arg2);
	    fprintf(outfile, " : ");
	}
	fprintf(outfile, "0)");
	break;
    default:
	yyerror("Unknown node type");
	break;
    }
}


/* Generate code defining function for var */
void gen_funct(node_ptr var, node_ptr expr, int isbool)
{
    if (!var || !expr) {
	yyerror("Null node");
	return;
    }
    check_arg(expr, isbool);
    /* Print function header */
    fprintf(outfile, "int gen_%s()\n{\n    return ", var->sval);
    gen_expr(expr);
    fprintf(outfile, ";\n}\n\n");
}
