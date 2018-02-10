// Component.hxx
//
// This is the super class for Label, Button, and Text
//

#ifndef Component__hxx
#define Component__hxx

#include <X11/Intrinsic.h>

class Component {
public:
  Component();
  virtual void setup(Widget parent) = 0;
  Widget getWidget() { return my_widget; }
protected:
  Widget my_widget;
};

#endif
