// Button.cpp
//

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Command.h>
#include "Button.hxx"

static void callback(Widget w, caddr_t data1, caddr_t data2) {
  Button * b = (Button *)data1;
  if (b != 0)  b->my_cb();
}

Button::Button(char *label, button_callback cb,
               int width, int height) {
  my_label = label;
  my_width = width;
  my_height = height;
  my_cb = cb;
}

void Button::setup(Widget parent) {
  Arg args[2];
  XtSetArg(args[0], XtNwidth,  my_width);
  XtSetArg(args[1], XtNheight, my_height);
  my_widget = XtCreateManagedWidget(my_label, commandWidgetClass, parent,
                                    args, 2);
  XtAddCallback(getWidget(), XtNcallback, callback, (XtPointer) this); 
}
