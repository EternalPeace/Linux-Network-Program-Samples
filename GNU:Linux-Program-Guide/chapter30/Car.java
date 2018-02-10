// File: Car.java

import java.io.*;

public class Car implements Serializable {
  private String name;
  private float price;
  static private int countCarInstances = 0;

  public Car(String name, float price) {
    // Keep a count of the number of instances of class Car:
    countCarInstances++;
    this.name = name;
    this.price = price;
    System.out.println("Creating Car(" + name + ", " + price + ")");
    System.out.println("Number of instances of class Car: " + countCarInstances);
  }

  public String getName() { return name; }
  public float getPrice() { return price; }

  // A static main test method

  static public void main(String [] args) {
    // This program does not use any arguments, but if any
    // command line arguments are supplied, at least print them out:
    if (args.length > 0) {
      for (int i=0; i<args.length; i++) {
        System.out.println("args[" + i + "]=" + args[i]);
      }
    }

    // Create a few instances of class car:

    Car mustang = new Car("Mustang", 15000.0f);
    Car ford = new Car("Thunderbird", 22000.0f);

    String name = ford.getName();
    float price = mustang.getPrice();

    System.out.println("name: " + name + ", price: " + price);
  }
}
