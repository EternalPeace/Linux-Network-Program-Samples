#include <Xm/Xm.h>
#include <Xm/Text.h>

void do_get_text(Widget widget, caddr_t client_data, caddr_t call_data) {
  Widget text = (Widget)client_data;
  char  *string = XmTextGetString(text);
  printf("The Motif example text widget contains:\n%s\n", string);
  XtFree(string);
}

void do_quit(Widget widget, caddr_t client_data, caddr_t call_data) {
  exit(0);
}

int main(int argc, char **argv) {
   Widget   top_level, pane, text, display_button, quit_button;
   Arg      arg[5];

   top_level = XtInitialize(argv[0], "test", NULL, 0, &argc, argv);
   pane = XmCreatePanedWindow(top_level, "pane", NULL, 0);

   XtSetArg(arg[0], XmNwidth, 400);
   XtSetArg(arg[1], XmNheight, 400);
   XtSetArg(arg[3], XmNwordWrap, TRUE);
   XtSetArg(arg[4], XmNeditMode, XmMULTI_LINE_EDIT);
   text = XmCreateText(pane, "text", arg, 5);

   display_button = XmCreatePushButton(pane, "Display", NULL, 0);
   quit_button = XmCreatePushButton(pane, "Quit", NULL, 0);

   XtAddCallback(display_button, XmNactivateCallback, (XtCallbackProc)do_get_text, text);
   XtAddCallback(quit_button, XmNactivateCallback, (XtCallbackProc)do_quit, NULL);

   XtManageChild(text);
   XtManageChild(display_button);
   XtManageChild(quit_button);
   XtManageChild(pane);
   XtRealizeWidget(top_level);
   XtMainLoop();

   return 0;
}


