// state_lcd.hxx
//
// Header file for the StateLCDWidget
//
// Loosely based on the Qt tutorial examples
//

#ifndef __STATE_LCD_WIDGET_HXX
#define __STATE_LCD_WIDGET_HXX

#include <qwidget.h>
#include <qlcdnumber.h>

class StateLCDWidget : public QWidget {
  Q_OBJECT
public:
  StateLCDWidget(QWidget *parent=0, const char *name=0);
public slots:
  void increaseValue();
  void decreaseValue();
protected:
  void resizeEvent(QResizeEvent *);
private:
  QLCDNumber  *lcd;
  int value;
};

#endif


