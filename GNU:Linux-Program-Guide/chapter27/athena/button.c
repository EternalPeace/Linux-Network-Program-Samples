#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

#include <X11/Xaw/Command.h>	

String app_resources[] = { 
  "*Command.Label: Click left mouse button", NULL,
};

XrmOptionDescRec options[] = {
  {"-label", "*Command.label", XrmoptionSepArg, NULL}
};

void do_button_clicked(Widget w, XtPointer client_data, XtPointer call_data) {
    printf("left button clicked\n");
}

void main(int argc, char **argv) {

    XtAppContext application_context;
    Widget top_level, command_button;

    top_level = XtAppInitialize(&application_context, "Xcommand",
			       options, XtNumber(options),
			       &argc, argv, app_resources, 
				NULL, 0);

    command_button = XtCreateManagedWidget("command", commandWidgetClass,
					     top_level, NULL, 0);

   XtAddCallback(command_button, XtNcallback, do_button_clicked, NULL);

   XtRealizeWidget(top_level);
   XtAppMainLoop(application_context);
}



