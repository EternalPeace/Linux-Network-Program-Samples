// PaneWindow.cpp
//

#include <X11/Intrinsic.h>
#include <X11/Xaw/Paned.h>

#include "PaneWindow.hxx"

static String app_resources[] = {
  "*Text*editType: edit",
  "*Text*autoFill: on",
  "*Text*scrollVertical: whenNeeded",
  "*Text*scrollHorizontal: whenNeeded",
  "*Text*preferredPaneSize: 300",
  NULL,
};

PaneWindow::PaneWindow() {
  int argc = 0;
  char ** argv = NULL;
  top_level = XtAppInitialize(&application_context, "top_level", NULL, 0,
                              &argc, argv, app_resources,
                              NULL, 0);
  num_components = 0;
  pane = XtVaCreateManagedWidget("paned", panedWidgetClass, top_level, NULL); 
}

void PaneWindow::run() {
  // Start by adding all registered components:
  for (int i=0; i<num_components; i++) {
    components[i]->setup(pane);
    XtManageChild(components[i]->getWidget());
  }
  XtRealizeWidget(top_level);
  XtAppMainLoop(application_context);
}

void PaneWindow::addComponent(Component * comp) {
  components[num_components++] = comp;
}
