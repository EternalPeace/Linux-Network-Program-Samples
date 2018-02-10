// label.c

#include <stdio.h>
#include <X11/StringDefs.h>
#include <X11/Intrinsic.h>
#include <X11/Xaw/Label.h>

String app_resources[] = { "*Label.Label: Testing Athena Label Widget", NULL };

int main(int argc, char **argv) {

  XtAppContext application_context;
  Widget top_level, label;
  Dimension width, height;
  Arg args[2];

  top_level = XtAppInitialize(&application_context, "test", NULL, 0,
                              &argc, argv,
                              app_resources, // if no resources for class "test" 
                              NULL, 0);

  label = XtCreateManagedWidget("label", labelWidgetClass, top_level, 
				NULL, 0);

  XtSetArg(args[0], XtNwidth, &width);
  XtSetArg(args[1], XtNheight, &height);
  XtGetValues(label, args, 2);
  printf("Widget width=%d and height=%d\n", width, height);

  XtRealizeWidget(top_level); // create windows and make visible
  XtAppMainLoop(application_context); // main event loop

  return 0;
}
