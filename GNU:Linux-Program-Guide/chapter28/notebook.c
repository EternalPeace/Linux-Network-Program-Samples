// notebook.c
//
// An example o using a GTK notebook container

#include <gtk/gtk.h>

// We use the following function in draw_widget.c:
GtkWidget * make_draw_widget(int width, int height);

void close_app(GtkWidget *widget, GtkWidget *event, gpointer data) {
  gtk_main_quit();
}

void main(int argc, char **argv) {

  GtkWidget *window;
  GtkWidget *notebook;
  GtkWidget *frame;
  GtkWidget *label;
  GtkWidget *temp_widget;
  char buf1[256];
  char buf2[256];
  int i;
    
  gtk_init(&argc, &argv);
    
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    
  gtk_signal_connect(GTK_OBJECT(window), "delete_event",
                     GTK_SIGNAL_FUNC(close_app), NULL);
    
  gtk_container_border_width(GTK_CONTAINER(window), 5);

  notebook = gtk_notebook_new();
  gtk_notebook_set_tab_pos(GTK_NOTEBOOK(notebook), GTK_POS_TOP);
  gtk_container_add(GTK_CONTAINER(window), notebook);
  gtk_widget_show(notebook);

  // Add some pages to the notebook:
  for (i=0; i < 4; i++) {
    if (i == 0) {
      sprintf(buf1, "Draw something here with the mouse");
      sprintf(buf2, "Draw Tab");
    } else {
      sprintf(buf1, "Frame number %d", i+1);
      sprintf(buf2, "Tab %d", i);
    }
    // Create a frame to hold anything (at all!)
    // that we might want to add to this page
    frame = gtk_frame_new(buf1);
    gtk_container_border_width(GTK_CONTAINER(frame), 10);
    gtk_widget_set_usize(frame, 240, 120);
    gtk_widget_show(frame);
    label = gtk_label_new(buf1);
    if (i == 0) {
      temp_widget = make_draw_widget(240, 120);
      gtk_container_add(GTK_CONTAINER(frame), temp_widget);
    } else {
      gtk_container_add(GTK_CONTAINER(frame), label);
      gtk_widget_show(label);
    }
    label = gtk_label_new(buf2);
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), frame, label);
  }
    
  /* Set what page to start at the first page */
  gtk_notebook_set_page(GTK_NOTEBOOK(notebook), 0);

  gtk_widget_show(window);
    
  gtk_main();
}
