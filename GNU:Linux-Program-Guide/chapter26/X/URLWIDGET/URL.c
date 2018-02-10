// URL.c
//
// Implementation file for the URLWidget
//
// Note: derived from Template.c example from the X Consortium.
//

/* XConsortium: Template.c,v 1.2 88/10/25 17:40:25 swick Exp $ */
/* Copyright Massachusetts Institute of Technology 1987, 1988 */

#include <X11/IntrinsicP.h>
#include <X11/StringDefs.h>
#include "URLP.h"

static XtResource resources[] = {
#define offset(field) XtOffset(URLWidget, url.field)
  /* {name, class, type, size, offset, default_type, default_addr}, */
  { XtNURLResource, XtCURLResource, XtRURLResource, sizeof(char*),
    offset(name), XtRString, "default" },
#undef offset
};

static void Initialize();
static void ReDraw();

URLClassRec urlClassRec = {
  { /* core fields */
    /* superclass         */ (WidgetClass) &widgetClassRec,
    /* class_name         */ "URL",
    /* widget_size        */ sizeof(URLRec),
    /* class_initialize   */ NULL,
    /* class_part_initialize */      NULL,
    /* class_inited       */ FALSE,
    /* initialize         */ Initialize, // NULL,
    /* initialize_hook    */ NULL,
    /* realize  */        XtInheritRealize,
    /* actions  */        NULL, // actions,
    /* num_actions        */ 0, // XtNumber(actions),
    /* resources          */ resources,
    /* num_resources      */ XtNumber(resources),
    /* xrm_class          */ NULLQUARK,
    /* compress_motion    */ TRUE,
    /* compress_exposure  */ TRUE,
    /* compress_enterleave */        TRUE,
    /* visible_interest   */ FALSE,
    /* destroy  */        NULL,
    /* resize   */        NULL,
    /* expose   */        ReDraw,
    /* set_values         */ NULL,
    /* set_values_hook    */ NULL,
    /* set_values_almost  */ XtInheritSetValuesAlmost,
    /* get_values_hook    */ NULL,
    /* accept_focus       */ NULL,
    /* version  */        XtVersion,
    /* callback_private   */ NULL,
    /* tm_table */        NULL, // translations,
    /* query_geometry     */ XtInheritQueryGeometry,
    /* display_accelerator   */      XtInheritDisplayAccelerator,
    /* extension          */ NULL
  },
  { /* url fields */
    /* empty    */        0
  }
};

char * fetch_url(char *);

static void Initialize(URLWidget request, URLWidget new) {
  XtGCMask valueMask;
  XGCValues values;
  printf("name = %s\n", new->url.name);
  // Get the URL data here:
  new->url.data = fetch_url(new->url.name);
  valueMask = GCForeground | GCBackground;
  values.foreground = BlackPixel(XtDisplay(new), 0);
  values.background = WhitePixel(XtDisplay(new), 0);

  new->url.gc = XtGetGC((Widget)new, valueMask, &values);
}

static char buf[50000];
static char buf2[50000];

char * clean_text(char *dirty_text) {
  int i, count = 0;
  int len = strlen(dirty_text);
  for (i=0; i<len; i++) {
    if (dirty_text[i] > 30) buf2[count++] = dirty_text[i];
  }
  buf2[count] = 0;
  return &(buf2[0]);
}

static void ReDraw(URLWidget w, XEvent *event, Region region) {
  //printf("in ReDraw, text is:\n%s\n", w->url.data);
  char *sp1, *sp2, *sp3;
  int len, y = 20;
  sp1 = &(buf[0]);
  sprintf(sp1, "%s", w->url.data);
  len = strlen(sp1);
  while (1) {
    sp2 = strstr(sp1, "\n");
    if (sp2 != NULL) {
      // keep going...
      *sp2 = '\0';
      sp3 = clean_text(sp1);
      XDrawString(XtDisplay(w), XtWindow(w), w->url.gc, 10, y,
                  sp3, strlen(sp3));
      y += 12;
      sp1 = sp2 + 1;
    } else {
      // time to stop...
      sp3 = clean_text(sp1);
      XDrawString(XtDisplay(w), XtWindow(w), w->url.gc, 10, y,
                  sp3, strlen(sp3));
      break;
    }
    // check to avoid running past data:
    if (sp1 >= &(buf[0]) + len) break;
  }
}

WidgetClass urlWidgetClass = (WidgetClass)&urlClassRec;
