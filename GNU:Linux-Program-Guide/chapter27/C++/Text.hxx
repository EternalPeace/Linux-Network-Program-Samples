// Text.hxx
//

#ifndef Text__hxx
#define Text__hxx

#include <X11/Intrinsic.h>
#include "Component.hxx"

class Text : public Component {
public:
  Text(int width=130, int height=30);
  void setup(Widget parent);
  char *getText();
  void eraseText();
private:
  int my_width;
  int my_height;
};

#endif
