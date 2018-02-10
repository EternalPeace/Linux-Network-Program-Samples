// Text.cpp
//

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/AsciiText.h> 
#include "Text.hxx"

Text::Text(int width, int height) {
  my_width = width;
  my_height = height;
}

void Text::setup(Widget parent) {
  Arg args[2];
  XtSetArg(args[0], XtNwidth,  my_width);
  XtSetArg(args[1], XtNheight, my_height);
  my_widget = XtVaCreateManagedWidget("text", asciiTextWidgetClass, parent,
                                      XtNtype, XawAsciiString,
                                      XtNstring, " ",
                                      args, 2, NULL);
}

char * Text::getText() {
  Widget w = getWidget();
  String str;
  XtVaGetValues(w,
                XtNstring, &str,
                NULL);
  return str;
}

void Text::eraseText() {
  Widget w = getWidget();
  XtVaSetValues(w,
                XtNstring, "",
                NULL);
}
