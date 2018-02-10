#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

#include <X11/Xaw/MenuButton.h>
#include <X11/Xaw/SimpleMenu.h>
#include <X11/Xaw/Sme.h>
#include <X11/Xaw/SmeBSB.h>

XtAppContext application_context;

void do_menu_selection(Widget item_selected, XtPointer unused1,
		       XtPointer unused2) {
  char * name = XtName(item_selected);
  printf("Menu item `%s' has been selected.\n", name);
  if (strcmp(name, "Exit program") == 0) {
    XtDestroyApplicationContext(application_context);
    exit(0);
  }
}

String fallback_resources[] = { 
    "*menuButton.label: This is a menubutton label",
    "*menu.label: Sample menu label",
    NULL,
};

void main(int argc, char **argv) {

    int i;
    Widget top_level, menu_button, menu, menu_element;
    
    char * menu_item_names[] = {
	"Menu item1", "Menu item2", "Menu item3",
	"Menu item4", "Exit program",
    };

    top_level = XtVaAppInitialize(&application_context, "testmenu", NULL, 0,
			    &argc, argv, fallback_resources, 
			    NULL);
    

    menu_button = XtCreateManagedWidget("menuButton", menuButtonWidgetClass,
					top_level, NULL, 0);
    
    menu = XtCreatePopupShell("menu", simpleMenuWidgetClass, menu_button, 
			      NULL, 0);
    
    for (i = 0; i < (int)XtNumber(menu_item_names) ; i++) {
      menu_element = XtCreateManagedWidget(menu_item_names[i],
					   smeBSBObjectClass,
					   menu, NULL, 0);
      XtAddCallback(menu_element, XtNcallback, do_menu_selection, NULL);
	
    }
    
    XtRealizeWidget(top_level);
    XtAppMainLoop(application_context);
}


