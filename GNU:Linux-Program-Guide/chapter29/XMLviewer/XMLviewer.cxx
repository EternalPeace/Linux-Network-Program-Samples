#include <stdlib.h>
#include <iostream.h>
#include <qapplication.h>
#include <qwidget.h>
#include <qdom.h>
#include <qfile.h>
#include <qtextstream.h>
#include <qlistview.h>

void traversenode(QDomNode &n, QListViewItem *parent)
{
  QListViewItem *after=parent;

  while(!n.isNull()) {
    QListViewItem *parentptr=parent;

    if(!n.isText())
      parentptr=after=new QListViewItem(parentptr, after, n.nodeName());

    if(!n.nodeValue().isNull())
      parentptr=after=new QListViewItem(parentptr, after, n.nodeValue());

    QDomNode child=n.firstChild();
    if(!child.isNull())
      traversenode(child,parentptr);

    n=n.nextSibling();
  }
}

int main (int argc, char *argv[])
{
  QApplication app(argc, argv);

  if(argc<2) {
    cout << "Usage: " << argv[0] << " <xmlfile>" << endl;
    exit(-1);
  }

  QDomDocument doc("mydocument");
  QFile f(argv[1]);
  if(f.open(IO_ReadOnly)) {
    QTextStream t(&f);
    QString s;

    while (!t.eof()) s.append(t.readLine());

    doc.setContent(s);
    f.close();
  } else {
    cout << "Couldn't open " << argv[1] << endl;
    exit(-1);
  }

  QListView lv(0,argv[1]);

  lv.addColumn("Data");
  lv.setSorting (-1);
  lv.setRootIsDecorated(TRUE);

  QListViewItem lvi(&lv,"XML Data");

  QDomNode child=doc.firstChild();
  child=child.nextSibling();

  traversenode(child,&lvi);

  app.setMainWidget(&lv);
  lv.show();

  return app.exec();
}
