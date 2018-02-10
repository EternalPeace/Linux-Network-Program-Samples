// main.cxx
//
// Simple main program for testing the equally simple DrawWidget class

#include "draw.hxx"

int main(int argc, char **argv) {
  QApplication app(argc, argv);
  DrawWidget draw;
  app.setMainWidget(&draw);
  draw.show();
  return app.exec();
}
