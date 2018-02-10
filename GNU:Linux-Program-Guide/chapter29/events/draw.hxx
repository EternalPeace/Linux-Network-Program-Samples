// Draw.hxx
//
// Simple example showing Qt's event methods that are inhereted from QWidget
//
// This example is derived from the QT connect.cpp example, so the following
// copyright is in effect:

/****************************************************************************
** $Id: qt/examples/drawlines/connect.cpp   2.2.0   edited 2000-08-31 $
**
** Copyright (C) 1992-2000 Trolltech AS.  All rights reserved.
**
** This file is part of an example program for Qt.  This example
** program may be used, distributed and modified without limitation.
**
*****************************************************************************/

#ifndef __DRAW_HXX
#define __DRAW_HXX

#include <qwidget.h>
#include <qpainter.h>
#include <qapplication.h>

class DrawWidget : public QWidget
{
public:
  DrawWidget(QWidget *parent=0, const char *name=0);
  ~DrawWidget();
protected:
  void  paintEvent(QPaintEvent *);
  void  mousePressEvent(QMouseEvent *);
  void  mouseMoveEvent(QMouseEvent *);
private:
  QPoint     *points;                         // point array
  QColor     *color;                          // color value
  int         count;                          // count = number of points
};

#endif
