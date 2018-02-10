#include <Xm/Xm.h>
#include <Xm/Label.h>

main(int argc, char **argv) {
   Widget   top_level, label;
   XmString motif_string;
   Arg      arg[1];
   top_level = XtInitialize(argv[0], "test", NULL, 0, &argc, argv);
   motif_string =
     XmStringCreateSimple("Yes! we are testing the Motif Label Widget!");
   XtSetArg(arg[0], XmNlabelString, motif_string);
   label = XmCreateLabel(top_level, "label", arg, 1);
   XtManageChild(label);
   XtRealizeWidget(top_level);
   XtMainLoop();
}
