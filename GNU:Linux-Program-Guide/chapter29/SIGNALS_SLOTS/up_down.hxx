// up_down.hxx
//
// Header file for the UpDownWidget
//
// Loosely based on the Qt tutorial examples
//

#ifndef __UP_DOWN_HXX
#define __UP_DOWN_HXX

#include <qwidget.h>
#include <qpushbutton.h>

#include "state_lcd.hxx"

class UpDownWidget : public QWidget {
  Q_OBJECT
public:
  UpDownWidget(QWidget *parent=0, const char *name=0);
  signals:
protected:
  void resizeEvent(QResizeEvent *);
private:
  QPushButton *up;
  QPushButton *down;
  StateLCDWidget *lcd;
};

#endif
