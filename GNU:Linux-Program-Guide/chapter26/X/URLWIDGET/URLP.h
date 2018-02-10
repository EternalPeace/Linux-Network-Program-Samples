// URLP.h
//
// Private header file for the URLWidget
//
// Note: derived from TemplateP.h example from the X Consortium.
//

/* XConsortium: TemplateP.h,v 1.2 88/10/25 17:31:47 swick Exp $ */
/* Copyright Massachusetts Institute of Technology 1987, 1988 */

#ifndef _URLP_h
#define _URLP_h

#include "URL.h"
// Include superclass private header file:
#include <X11/CoreP.h>

// Define unique representation types not found in <X11/StringDefs.h>:

#define XtRURLResource  "URLResource"

typedef struct {
  int empty;
} URLClassPart;

typedef struct _URLClassRec {
  CoreClassPart core_class;
  URLClassPart  URL_class;
} URLClassRec;

extern URLClassRec urlClassRec;

typedef struct {
  /* resources */
  char* name;
  /* private state */
  char *data;
  GC gc;
} URLPart;

typedef struct _URLRec {
  CorePart    core;
  URLPart          url;
} URLRec;

#endif  _URLP_h
