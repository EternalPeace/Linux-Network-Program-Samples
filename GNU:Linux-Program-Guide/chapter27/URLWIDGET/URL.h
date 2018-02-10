// URL.h
//
// Public header file for the URLWidget
//
// Note: derived from Template.h example from the X Consortium.
//

/* XConsortium: Template.h,v 1.2 88/10/25 17:40:25 swick Exp $ */
/* Copyright Massachusetts Institute of Technology 1987, 1988 */

#ifndef _URL_h
#define _URL_h

// Define resource names:

#define XtNURLResource        "urlResource"
#define XtCURLResource        "URLResource"

// Declare specific URLWidget class and instance datatypes:
typedef struct _URLRec*       URLWidget;

// Declare the class constant:

extern WidgetClass urlWidgetClass;

#endif  _URL_h
