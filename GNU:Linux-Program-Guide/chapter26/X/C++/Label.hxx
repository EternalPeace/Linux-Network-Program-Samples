// Label.hxx
//

#ifndef Label__hxx
#define Label__hxx

#include "Component.hxx"

class Label : public Component  {
public:
  Label(char * label = "test label", int width=100, int height=20);
  void setup(Widget parent);
private:
  char * my_label;
  int my_width;
  int my_height;
};

#endif
