// up_down.cxx
//
// Implementation file for the UpDownWidget
//
// Loosely based on the Qt tutorial examples
//

#include "up_down.hxx"

#include <qscrollbar.h>
#include <qlcdnumber.h>
#include <stdio.h>

UpDownWidget::UpDownWidget(QWidget *parent, const char *name)
  : QWidget(parent, name)
{
  lcd  = new StateLCDWidget(parent, name);
  lcd->move(0, 0);
  up = new QPushButton("Up", this);
  down = new QPushButton("Down", this);
  connect(up, SIGNAL(clicked()), lcd, SLOT(increaseValue()));
  connect(down, SIGNAL(clicked()), lcd, SLOT(decreaseValue()));
  printf("SIGNAL(clicked()) = |%s|\n", SIGNAL(clicked()));
}

void UpDownWidget::resizeEvent(QResizeEvent *)
{
  lcd->resize(width(), height() - 59);
  up->setGeometry(0, lcd->height() + 5, width(), 22);
  down->setGeometry(0, lcd->height() +31, width(), 22);
}
