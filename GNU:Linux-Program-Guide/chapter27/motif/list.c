#include <Xm/Xm.h>
#include <Xm/List.h>

void do_list_click(Widget widget, caddr_t data1, XtPointer data2) {
   char *string;
   XmListCallbackStruct *callback = (XmListCallbackStruct *)data2;
   XmStringGetLtoR(callback->item, XmSTRING_OS_CHARSET, &string);
   printf("  You chose item %d : %s\n", callback->item_position, string);
   XtFree(string);
}

main(int argc, char **argv) {
   Widget top_level, list;
   XmString motif_strings[3];
   Arg arg[4];

   top_level = XtInitialize(argv[0], "test", NULL, 0, &argc, argv);

   motif_strings[0] = XmStringCreateSimple("list item at index 0");
   motif_strings[1] = XmStringCreateSimple("list item at index 1");
   motif_strings[2] = XmStringCreateSimple("list item at index 2");

   XtSetArg(arg[0], XmNitemCount, 3);
   XtSetArg(arg[1], XmNitems, motif_strings);
   XtSetArg(arg[2], XmNvisibleItemCount, 3); // all list elements are visible
   XtSetArg(arg[3], XmNselectionPolicy, XmSINGLE_SELECT);

   list = XmCreateList(top_level, "list", arg, 4);

   XtAddCallback(list, XmNsingleSelectionCallback,
		 (XtCallbackProc)do_list_click, NULL);

   XtManageChild(list);
   XtRealizeWidget(top_level);
   XtMainLoop();
}
