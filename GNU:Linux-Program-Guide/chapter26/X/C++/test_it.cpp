// test_it.cpp

#include <iostream.h>
#include "PaneWindow.hxx"
#include "Label.hxx"
#include "Button.hxx"
#include "Text.hxx"

Text *text;

void button_cb() {
  cout << "Text is:\n" << text->getText() << "\n";
}

void main() {
  PaneWindow pw;
  Label label("this is a test");
  Button button("Get text", button_cb);
  text = new Text(300, 120);
  pw.addComponent(&label);
  pw.addComponent(&button);
  pw.addComponent(text);
  pw.run();
}
