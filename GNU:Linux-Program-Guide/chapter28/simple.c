#include <gtk/gtk.h>

void do_click(GtkWidget *widget, gpointer data)
{
  int * count = (int *) data;
  *count += 1;
  printf("Button clicked %d times (5 to quit)\n", *count);
  if (*count > 4)  gtk_main_quit();
}

int main(int argc, char *argv[])
{
  // Declare variables to reference both a
  // window widget and a button widget:
  GtkWidget *window, *button;
  // Use for demonstrating encapsulation of data (the address
  // of this variable will be passed to the button's callback
  // function):
  int count = 0;
          
  // Pass command line arguments to the GTK+ initialization function:
  gtk_init(&argc, &argv);
          
  // Create a new top level window:
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
          
  // Change the default width around widgets from 0 to 5 pixels:
  gtk_container_border_width(GTK_CONTAINER(window), 5);
          
  button = gtk_button_new_with_label("Click to increment counter");
          
  // Connect the 'do_click' C callback function to the button widget.
  // We pass in the address of the variable 'count' so that the
  // callback function can access the value of count without having
  // to use global data:
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
                     GTK_SIGNAL_FUNC(do_click), &count);

          
  // Add the button widget to the window widget:
  gtk_container_add(GTK_CONTAINER(window), button);
          
  // Make any widgets added to the window visible before
  // making the window itself visible:
  gtk_widget_show(button);
  gtk_widget_show(window);

  // Handle events:
  gtk_main();
          
}
