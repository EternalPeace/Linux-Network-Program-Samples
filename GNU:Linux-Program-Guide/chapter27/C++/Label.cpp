// Label.cpp
//

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>
#include "Label.hxx"

Label::Label(char *label, int width, int height) {
  my_label = label;
  my_width = width;
  my_height = height;
}

void Label::setup(Widget parent) {
  Arg args[2];
  XtSetArg(args[0], XtNwidth,  my_width);
  XtSetArg(args[1], XtNheight, my_height);
  my_widget = XtCreateManagedWidget(my_label, labelWidgetClass, parent,
                                    args, 2);
}
