// Draw.cxx
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

#include "draw.hxx"

#include <stdlib.h>
#include <stdio.h>

const int MAXPOINTS = 3000;  // maximum number of points

DrawWidget::DrawWidget(QWidget *parent, const char *name)
  : QWidget(parent, name)
{
  setBackgroundColor(white);            // white background
  count = 0;
  points = new QPoint[MAXPOINTS];
  color = new QColor(250, 10, 30); // Red, Green, Blue
}

DrawWidget::~DrawWidget()
{
  delete[] points;                              // cleanup
}

void DrawWidget::paintEvent(QPaintEvent *)
{
  QPainter paint(this);
  paint.drawText(10, 20, "Click the mouse buttons, or press button and drag");
  paint.setPen(*color);
  for (int i=0; i<count; i++) {         // connect all points
    paint.drawRect(points[i].x()-3, points[i].y()-3, 6, 6);
  }
}

void DrawWidget::mousePressEvent(QMouseEvent * e) {
  if (count < MAXPOINTS) {
    QPainter paint(this);
    points[count] = e->pos();           // add point
    paint.setPen(*color);
    paint.drawRect(points[count].x()-3, points[count].y()-3, 6, 6);
    count++;
  }
}

void DrawWidget::mouseMoveEvent(QMouseEvent *e) {
  if (count < MAXPOINTS) {
    QPainter paint(this);
    points[count] = e->pos();           // add point
    paint.setPen(*color);
    paint.drawRect(points[count].x()-3, points[count].y()-3, 6, 6);
    count++;
  }
}
