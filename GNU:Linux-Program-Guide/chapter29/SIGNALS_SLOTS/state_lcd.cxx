// state_lcd.cxx
//
// Implementation file for the StateLCDWidget
//
// Loosely based on the Qt tutorial examples
//

#include "state_lcd.hxx"

#include <qlcdnumber.h>

StateLCDWidget::StateLCDWidget(QWidget *parent, const char *name)
  : QWidget(parent, name)  {
  lcd  = new QLCDNumber(4, this, "lcd");
}

void StateLCDWidget::increaseValue() {
  value++;
  lcd->display(value);
}

void StateLCDWidget::decreaseValue() {
  value--;
  lcd->display(value);
}

void StateLCDWidget::resizeEvent(QResizeEvent *) {
  lcd->resize(width(), height() - 16 - 5);
}
