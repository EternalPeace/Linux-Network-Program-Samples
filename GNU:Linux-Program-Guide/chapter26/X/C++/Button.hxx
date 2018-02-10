// Button.hxx
//

#ifndef Button__hxx
#define Button__hxx
#include <X11/Intrinsic.h>
#include "Component.hxx"

typedef void (*button_callback)(void);

class Button : public Component {
public:
  Button(char * label = "test label", button_callback cb = 0,
         int width=130, int height=30);
  void setup(Widget parent);
  button_callback my_cb;
private:
  char * my_label;
  int my_width;
  int my_height;
};

#endif
