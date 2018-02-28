/* Example of Program for Profiling */
/* Create a dictionary of strings */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "options.h"

/* Some statistics */
int wcnt = 0; /* Number of words */
int ucnt = 0; /* Number of unique words */
int mcnt = 0; /* Count of Most frequent word */
char *mstring = ""; /* Most frequent word */
int llen = 0; /* Length of the longest word */
char *lstring = ""; /* A longest string */
int lcnt = 0; /* Number of words having maximum length */

/* Use function pointers to keep track of which options we are using */
typedef void (*lower_fun_t)(char *s);

/* Lower case conversion routines */

/* Convert string to lower case: slow */
void lower1(char *s)
{
    int i;

    for (i = 0; i < strlen(s); i++)
	if (s[i] >= 'A' && s[i] <= 'Z')
	    s[i] -= ('A' - 'a');
}

/* Convert string to lower case: faster */
void lower2(char *s)
{
    int i;
    int len = strlen(s);

    for (i = 0; i < len; i++)
	if (s[i] >= 'A' && s[i] <= 'Z')
	    s[i] -= ('A' - 'a');
}

/* Set of lower case functions */
#define LCNT 2
lower_fun_t lower_fun_set[LCNT] = {lower1, lower2};
char *lower_fun_names[LCNT] = {"lower1", "lower2"};

/* Implementation of library function strlen */
/* Compute length of string */
size_t strlen(const char *s)
{
    int length = 0;
    while (*s != '\0') {
	s++; 
	length++;
    }
    return length;
}

/* The hash table */

typedef struct HELE {
  char *word;
  int freq;
  struct HELE *next;
} h_rec, *h_ptr;

/* The hash table */
h_ptr *htable;
int tsize;

static void new_table(int size)
{
  tsize = size;
  htable = (h_ptr *) calloc(size, sizeof(h_ptr));
  if (!htable) {
    fprintf(stderr, "Couldn't allocate hash array, exiting\n");
    exit(1);
  }
}

static h_ptr new_ele(char *s)
{
  h_ptr result = (h_ptr) malloc(sizeof(h_rec));
  int wlen = strlen(s);
  if (wlen > llen) {
    lstring = s;
    llen = wlen;
    lcnt = 1;
  } else if (wlen == llen)
    lcnt++;
  if (!result) {
    fprintf(stderr, "Couldn't allocate hash element, exiting\n");
    exit(1);
  }

  result->word = s;
  result->freq = 1;
  return result;
}

/* Some hash functions */

/* Division hashing */

typedef unsigned (*hash_fun_t)(char *s);

unsigned h_mod(char *s)
{
  unsigned val = 0;
  int c;
  while ((c = *s++))
    val = (val * 128 + c) % tsize;
  return val;
}

/* Simply add characters together */
unsigned h_add(char *s)
{
  unsigned val = 0;
  int c;
  while ((c = *s++))
    val += c;
  return val % tsize;
}

/* Combine with Xors */
unsigned h_xor(char *s)
{
  unsigned val = 0;
  int c;
  while ((c = *s++))
    val = ((val ^ c)<<4) | ((val >> 28) & 0xF);
  return val % tsize;
}

#define HCNT 3
hash_fun_t hash_fun_set[HCNT] = {h_mod, h_add, h_xor};
char *hash_fun_names[HCNT] = {"h_mod", "h_add", "h_xor"};

char *save_string(char *s)
{
  char *result = (char *) malloc(strlen(s)+1);
  if (!result) {
    fprintf(stderr, "Couldn't allocate space for string, exiting\n");
    exit(1);
  }
  strcpy(result,s);
  return result;
}
  
/* Recursively find string in list.  Add to end if not found */
h_ptr find_ele_rec(h_ptr ls, char *s)
{
  if (!ls) {
    /* Come to end of list.  Insert this one */
    ucnt++;
    return new_ele(save_string(s));
  }
  if (strcmp(s,ls->word) == 0) {
    ls->freq++;
    if (ls->freq > mcnt) {
      mcnt = ls->freq;
      mstring = ls->word;
    }
    return ls;
  }
  ls->next = find_ele_rec(ls->next, s);
  return ls;
}

/* Iteratively find string in list.  Add to front if not found */
h_ptr find_ele_iter_f(h_ptr ls, char *s)
{
  h_ptr ele = ls;
  for (ele = ls; ele; ele = ele->next) {
    char *word = ele->word;
    if (strcmp(s, word) == 0) {
      int freq = ++ele->freq;
      if (freq > mcnt) {
	mcnt = freq;
	mstring = word;
      }
      return ls;
    }
  }
  ele = new_ele(save_string(s));
  ucnt++;
  ele->next = ls;
  return ele;
}

/* Iteratively find string in list.  Add to end if not found */
h_ptr find_ele_iter_r(h_ptr ls, char *s)
{
  h_ptr ele = ls;
  h_ptr last = NULL;
  for (ele = ls; ele; ele = ele->next) {
    char *word = ele->word;
    if (strcmp(s, word) == 0) {
      int freq = ++ele->freq;
      if (freq > mcnt) {
	mcnt = freq;
	mstring = word;
      }
      return ls;
    }
    last = ele;
  }
  ele = new_ele(save_string(s));
  ucnt++;
  ele->next = NULL;
  if (last) {
    last->next = ele;
    return ls;
  } else
    return ele;
}


typedef h_ptr (*find_ele_fun_t)(h_ptr, char *);

#define FCNT 3
find_ele_fun_t find_ele_fun_set[FCNT] =
{find_ele_rec, find_ele_iter_f, find_ele_iter_r};
char *find_ele_fun_names[FCNT] = 
{"find_ele_rec", "find_ele_iter_f", "find_ele_iter_r"};

/* Comparision function for sorting */
int compare_ele(const void *vele1, const void *vele2) {
  h_ptr ele1 = *(h_ptr *) vele1;
  h_ptr ele2 = *(h_ptr *) vele2;
  return ele2->freq - ele1->freq;
}


/* Sort hash table elements by frequency */
h_ptr sort_words(int quick)
{
  h_ptr ls = NULL;
  h_ptr ele;
  h_ptr *array = calloc(ucnt, sizeof(h_ptr));
  int i, j;
  int cnt = 0;
  for (i = 0; i < tsize; i++)
    for (ele = htable[i]; ele; ele = ele->next) {
      if (quick)
	array[cnt] = ele;
      else {
	for (j = cnt; j > 0 && ele->freq > array[j-1]->freq; j--)
	  array[j] = array[j-1];
	array[j] = ele;
      }
      cnt++;
    }
  if (quick) {
    qsort((void *) array, cnt, sizeof(h_ptr), compare_ele);
  }
  ls = array[0];
  for (j = 0; j < cnt-1; j++)
    array[j]->next = array[j+1];
  array[cnt-1]->next = NULL;
  free ((void *) array);
  return ls;
}


void insert_string(char *s,
		     hash_fun_t hash_fun, lower_fun_t lower_fun,
		     find_ele_fun_t find_ele_fun)
{
  int index;
  lower_fun(s);
  index = hash_fun(s);
  htable[index] = find_ele_fun(htable[index], s);  
}

/* Extract word from file */
#define BSIZE 1024
char buf[BSIZE];
int bufvalid = 0;
FILE *infile;

void init_token(FILE *in) {
  bufvalid = 0;
  infile = in;
}

static char *skipchar = " \t\n\r.,:;()[]{}?!\"-";

/* Keep getting tokens.  Return NULL when no more */
char *get_token()
{
  char *s = NULL;
  while (1) {
    if (bufvalid) {
      s = strtok(NULL, skipchar);
      if (s)
	break;
    }
    if (!fgets(buf, BSIZE, infile))
      return NULL;
    bufvalid = 1;
    s = strtok(buf, skipchar);
    if (s)
      break;
  }
  wcnt++;
  return s;
}



/* Find statistics of word frequency in document */
void word_freq(FILE *src, int verbose, int size, int quick,
	       hash_fun_t hash_fun, lower_fun_t lower_fun,
	       find_ele_fun_t find_ele_fun)
{
  char *s;
  h_ptr ls;

  init_token(src);
  new_table(size);

  while ((s = get_token())) {
    insert_string(s, hash_fun, lower_fun, find_ele_fun);
  }
  if (verbose > 0) {
    ls = sort_words(quick);
    while (ls && verbose--) {
      printf("%d\t'%s'\n", ls->freq, ls->word);
      ls = ls->next;
    }
  }
  printf("%d words, %d unique.  Most common (%d) = '%s'.  Longest (%d have length %d) = '%s'\n",
	 wcnt, ucnt, mcnt, mstring, lcnt, llen, lstring);
}

int main(int argc, char *argv[])
{
  int verbose = 0;
  int size = 1024;
  int hash_fun_index = 0;
  int lower_fun_index = 0;
  int find_fun_index = 0;
  int quick = 0;
  char *fname = NULL;
  FILE *infile = stdin;
  add_int_option("verbose", &verbose);
  add_int_option("size", &size);
  add_int_option("hash", &hash_fun_index);
  add_int_option("lower", &lower_fun_index);
  add_int_option("find", &find_fun_index);
  add_int_option("quicksort", &quick);
  add_string_option("file", &fname);
  parse_options(argc, argv, NULL);
  show_options(stdout);
  printf("Lower case function %s\n", lower_fun_names[lower_fun_index]);
  printf("Hash function %s\n", hash_fun_names[hash_fun_index]);
  printf("Find element function %s\n", find_ele_fun_names[find_fun_index]);
  if ((unsigned) hash_fun_index >= HCNT) {
    fprintf(stderr, "Invalid hash function index %d\n", hash_fun_index);
    exit(1);
  }
  if ((unsigned) lower_fun_index >= LCNT) {
    fprintf(stderr, "Invalid lower function index %d\n", lower_fun_index);
    exit(1);
  }
  if ((unsigned) find_fun_index >= FCNT) {
    fprintf(stderr, "Invalid find function index %d\n", find_fun_index);
    exit(1);
  }
  if (fname) {
    infile = fopen(fname, "r");
    if (!infile) {
      fprintf(stderr, "Couldn't open file '%s'\n", fname);
      exit(1);
    }
  }
  word_freq(infile, verbose, size, quick,
	    hash_fun_set[hash_fun_index],
	    lower_fun_set[lower_fun_index],
	    find_ele_fun_set[find_fun_index]);
  printf("Total time = %f seconds\n", (double) clock() / CLOCKS_PER_SEC);
  fclose(infile);
  return 0;
}
