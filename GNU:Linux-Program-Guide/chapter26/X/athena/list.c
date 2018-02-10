#include <X11/Intrinsic.h>

// To define the constant 'XtNcallback':
#include <X11/StringDefs.h>

// Definition of the Athena List Widget:
#include <X11/Xaw/List.h>

void do_list_item_selected(Widget w, XtPointer unused, XtPointer data) {
  XawListReturnStruct *list_item = (XawListReturnStruct*)data;
  printf("Selected item (%d) text is '%s'\n",
         list_item->list_index, list_item->string );
}

int main(int argc, char **argv) {

  Widget top_level, list;
  XtAppContext application_context;
  String items[] = {
    "1", "2", "3", "4", "5", "six", "seven", "8",
    "9'th list entry", "this is the tenth list entry",
    "11", "12",
    NULL
  };

  top_level = XtAppInitialize(&application_context, "listexample",
			      NULL, 0,
			      &argc, argv, NULL,
			      NULL, 0);

  list= XtVaCreateManagedWidget("list",  listWidgetClass, top_level,
				XtNlist, items,
				NULL, 0);
  XtAddCallback(list, XtNcallback, do_list_item_selected, (XtPointer)NULL);
    
  XtRealizeWidget(top_level);
  XtAppMainLoop(application_context);

  return 0;
}
