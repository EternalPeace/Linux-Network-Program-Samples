#!/usr/bin/perl -w

use Gtk;

use vars qw($window $button);

sub hello {
  Gtk->print("hello world\n");
  destroy $button;
  destroy $window;
  exit;
}

init Gtk;

$window = new Gtk::Widget "GtkWindow",
  GtkWindow::type            => -toplevel,
  GtkWindow::title           => "hello world",
  GtkWindow::allow_grow      => 1,
  GtkWindow::allow_shrink    => 1,
  GtkContainer::border_width => 10;

$button = new_child $window "GtkButton",
  GtkButton::label           => "hello world",
  GtkObject::signal::clicked => "hello",
  GtkWidget::visible         => 1;

show $window;

main Gtk;

