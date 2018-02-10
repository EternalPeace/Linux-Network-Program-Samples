// PaneWindow.hxx

#ifndef PaneWindow__hxx
#define PaneWindow__hxx

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Paned.h>

#include "Component.hxx"

class PaneWindow {
public:
  PaneWindow();
  void addComponent(Component * comp);
  void run();
private:
  Widget top_level;
  Widget pane;
  Component  * components[10];
  int num_components;
  XtAppContext application_context; 
};

#endif
