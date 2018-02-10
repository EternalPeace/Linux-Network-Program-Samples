#include <iostream>
#include <gtk--/button.h>
#include <gtk--/main.h>
#include <gtk--/window.h>

using SigC::slot;

void destroy_handler() {
  Gtk::Main::quit();
}

class HelloWorld : public Gtk::Window
{
  Gtk::Button button;

  void hello() {
    cout << "Hello World" << endl;
  }

  virtual int delete_event_impl(GdkEventAny *event) {
    return true;
  }

public:
  HelloWorld() : Gtk::Window(GTK_WINDOW_TOPLEVEL),  button("Hello World") {
    destroy.connect(slot(&destroy_handler));

    set_border_width(10);

    button.clicked.connect(slot(this, &HelloWorld::hello));
    button.clicked.connect(destroy.slot());
    add(button);

    show_all();
  }
};
  
int main (int argc, char *argv[])
{
  Gtk::Main kit(argc, argv);

  HelloWorld helloworld;

  kit.run();
  return 0;
}
