// XMLviewer.c
//
// Parse an XML input file from 'stdin' and display
// the structure in a GTK tree window.
//
// Note: This example is partially derived from James Clark's
// XML Expat example program and from the simple GTK tree
// demo program in the GTK tutorial at www.gtk.org
//

#include <stdio.h>
#include <gtk/gtk.h>
#include "xmlparse.h"


//    For handling GTK signals:

static void item_signal_callback(GtkWidget *item, gchar *signame)
{
  gchar *name;
  GtkLabel *label;
  label = GTK_LABEL(GTK_BIN(item)->child);
  /* Get the text of the label */
  gtk_label_get(label, &name);
  printf("signal name=%s, selected item name=%s\n", signame, name);
}

//    Data and callback functions for handling XML tags:

#define MAX_DEPTH 10

// Top level tree (for adding tags at level zero):
GtkWidget  *tree;

// Items to add to the tree (for adding tags with depth > zero):
GtkWidget *item;

// For the next subtree:
GtkWidget *subtree[MAX_DEPTH];

// Callback required by James Clark's Expat XML parser:

void handleElementData(void *userData, const char * data, int len) {
  // Note: 'data' contains all of the remaining tag data in
  // the document, but only the first 'len' characters belong
  // to the current tag.
  int i, ok;
  char * cp;
  int *depthPtr = userData;
  GtkWidget *subitem;
  if (len < 3) {
    return;
  }
  cp = (char *)malloc(len + 1);
  for (i=0; i<len; i++) cp[i] = data[i];
  cp[len] = '\0';
  // check that all of the tag data is just not equal to spaces:
  ok = 0;
  for (i=0; i<len; i++) {
    if (cp[i] != ' ') {
      ok = 1;
      break;
    }
  }
  if (ok == 0)  return;
  if (strlen(data) < 3)  return;
  subitem = gtk_tree_item_new_with_label(cp);
  gtk_tree_append(GTK_TREE(subtree[*depthPtr]), subitem);
  gtk_signal_connect(GTK_OBJECT(subitem), "select",
		     GTK_SIGNAL_FUNC(item_signal_callback), "tag data select");
  gtk_signal_connect(GTK_OBJECT(subitem), "deselect",
		     GTK_SIGNAL_FUNC(item_signal_callback), "tag data deselect");
  gtk_widget_show (subitem);
}

// Callback required by James Clark's Expat XML parser:

void startElement(void *userData, const char *name, const char **atts)
{
  int *depthPtr = userData;
  *depthPtr += 1;

  // Build a top level tree element:
  if (*depthPtr == 1) {
    item = gtk_tree_item_new_with_label((char *)name);
    gtk_signal_connect(GTK_OBJECT(item), "select",
		       GTK_SIGNAL_FUNC(item_signal_callback), "top level item select");
    gtk_signal_connect(GTK_OBJECT(item), "deselect",
		       GTK_SIGNAL_FUNC(item_signal_callback), "top level item deselect");
    // a tree item can hold any number of items; add new item here:
    gtk_tree_append(GTK_TREE(tree), item);
    gtk_widget_show(item);
    // Create this item's subtree:
    subtree[*depthPtr] = gtk_tree_new();
    gtk_tree_set_view_mode(GTK_TREE(subtree[*depthPtr]), GTK_TREE_VIEW_ITEM);
    gtk_tree_item_set_subtree(GTK_TREE_ITEM(item), subtree[*depthPtr]);
  } else {
    GtkWidget *subitem = gtk_tree_item_new_with_label((char *)name);
    subtree[*depthPtr] = gtk_tree_new();
    gtk_signal_connect(GTK_OBJECT(subitem), "select",
		       GTK_SIGNAL_FUNC(item_signal_callback), "tree item select");
    gtk_signal_connect(GTK_OBJECT(subitem), "deselect",
		       GTK_SIGNAL_FUNC(item_signal_callback), "tree item deselect");
    // Add this sub-tree it to its parent tree:
    gtk_tree_append(GTK_TREE(subtree[*depthPtr - 1]), subitem);
    gtk_widget_show(subitem);
    gtk_tree_item_set_subtree(GTK_TREE_ITEM(subitem), subtree[*depthPtr]);
  }
}

// Callback required by James Clark's Expat XML parser:

void endElement(void *userData, const char *name)
{
  int *depthPtr = userData;
  *depthPtr -= 1;   // decrement stack pointer
}

void main(int argc, char **argv) {
  // Data for parsing an XML document:
  char buf[BUFSIZ];
  XML_Parser parser = XML_ParserCreate(NULL);
  int done;
  int depth = 0;

  // GTK data:
  GtkWidget *window, *scrolled_win;

  gint i;

  gtk_init(&argc, &argv);

  // Build a top level scrolled window and add a tree to it:

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_signal_connect(GTK_OBJECT(window), "delete_event",
		     GTK_SIGNAL_FUNC(gtk_main_quit), NULL);
  gtk_container_border_width(GTK_CONTAINER(window), 5);

  scrolled_win = gtk_scrolled_window_new(NULL, NULL);
  gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled_win),
				 GTK_POLICY_AUTOMATIC,
				 GTK_POLICY_AUTOMATIC);
  gtk_widget_set_usize(scrolled_win, 150, 200);
  gtk_container_add(GTK_CONTAINER(window), scrolled_win);
  gtk_widget_show(scrolled_win);
        
  tree = gtk_tree_new();

  gtk_scrolled_window_add_with_viewport(GTK_SCROLLED_WINDOW(scrolled_win), tree);
  gtk_tree_set_selection_mode(GTK_TREE(tree),
			      GTK_SELECTION_SINGLE);
  gtk_widget_show(tree);

  // Now process the XML file in 'stdin' to create sub-trees:

  XML_SetUserData(parser, &depth);
  XML_SetElementHandler(parser, startElement, endElement);
  XML_SetCharacterDataHandler(parser, handleElementData);
  do {
    size_t len = fread(buf, 1, sizeof(buf), stdin);
    done = len < sizeof(buf);
    if (!XML_Parse(parser, buf, len, done)) {
      printf("%s at line %d\n",
              XML_ErrorString(XML_GetErrorCode(parser)),
              XML_GetCurrentLineNumber(parser));
      return;
    }
  } while (!done);
  XML_ParserFree(parser); 

  gtk_widget_show(window);
  gtk_main();
}
