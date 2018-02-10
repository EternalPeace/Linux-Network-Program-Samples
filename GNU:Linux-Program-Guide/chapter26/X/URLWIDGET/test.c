// test.c
//
// Note: run this program as ./test
//

#include <stdio.h>
#include <X11/StringDefs.h>
#include <X11/Intrinsic.h>  
#include "URL.h"

main(int argc, char *argv[]) {
  Widget top_level, url;
  Arg args[5];
  top_level = XtInitialize(argv[0], "urltest", NULL, 0, &argc, argv);
  XtSetArg(args[0], XtNwidth, 520);
  XtSetArg(args[1], XtNheight, 580);
  XtSetArg(args[2], XtNURLResource, "www.knowledgebooks.com");
  url = XtCreateManagedWidget("url", urlWidgetClass, top_level, args, 3);
  XtRealizeWidget(top_level);
  XtMainLoop();
}

