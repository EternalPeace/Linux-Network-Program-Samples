#include <qapplication.h>

#include "up_down.hxx"

int main(int argc, char **argv) {
  QApplication a(argc, argv);
  QWidget top;
  top.setGeometry(0, 0, 222, 222);
  UpDownWidget w(&top);
  w.setGeometry(0, 0, 220, 220);
  a.setMainWidget(&top);
  top.show();
  return a.exec();
}
