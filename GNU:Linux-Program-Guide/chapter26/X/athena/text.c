#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

#include <X11/Xaw/Paned.h>
#include <X11/Xaw/AsciiText.h>
#include <X11/Xaw/Command.h>

void do_display_widget_text(Widget w, XtPointer text_ptr, XtPointer unused) {
  Widget text = (Widget) text_ptr;
  String str;
  XtVaGetValues(text,
                XtNstring, &str,
                NULL);
  printf("Widget Text is:\n%s\n", str);
}

void do_erase_text_widget(Widget w, XtPointer text_ptr, XtPointer unused) {
  Widget text = (Widget) text_ptr;
  XtVaSetValues(text,
                XtNstring, "",
                NULL);
}

XtAppContext application_context;

void do_quit(Widget w, XtPointer unused1, XtPointer unused2) {
  XtDestroyApplicationContext(application_context); 
  exit(0);
}

String app_resources[] = { 
  "*Text*editType: edit",
  "*Text*autoFill: on",
  "*Text*scrollVertical: whenNeeded",
  "*Text*scrollHorizontal: whenNeeded",
  "*erase*label: Erase the text widget",
  "*display*label: Display the text from the text widget",
  "*Text*preferredPaneSize: 300", 
  NULL,
};

int main(int argc, char **argv) {

  Widget top_level, paned, text, erase, display, quit;
  char *initial_text= "Try typing\n\nsome text here!\n\n";

  top_level = XtAppInitialize(&application_context, "textexample", NULL, 0,
                              &argc, argv, app_resources, 
                              NULL, 0);

  paned = XtVaCreateManagedWidget("paned", panedWidgetClass, top_level, 
                                  NULL);

  text = XtVaCreateManagedWidget("text", asciiTextWidgetClass, paned, 
                                 XtNtype, XawAsciiString,
                                 XtNstring, initial_text,
                                 NULL);

  erase = XtVaCreateManagedWidget("erase", commandWidgetClass, paned, 
                                  NULL);

  display = XtVaCreateManagedWidget("display", commandWidgetClass, paned, 
                                    NULL);

  quit = XtVaCreateManagedWidget("quit", commandWidgetClass, paned, 
                                 NULL);


  XtAddCallback(erase, XtNcallback, do_erase_text_widget, (XtPointer) text);
  XtAddCallback(display, XtNcallback, do_display_widget_text, (XtPointer) text);
  XtAddCallback(quit, XtNcallback, do_quit, (XtPointer) text);

  XtRealizeWidget(top_level);
  XtAppMainLoop(application_context);

  return 0;
}
