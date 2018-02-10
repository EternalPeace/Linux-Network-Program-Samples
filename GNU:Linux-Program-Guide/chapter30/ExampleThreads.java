// File: ExampleThreads.java
//
// Example of using Java threads
//

import java.io.*;
import java.util.zip.*;

class MyThread extends Thread {
    public MyThread(String name) {
	super(name);
	this.name = name;
    }
    public MyThread() {
	this("no_name_thread");
    }
    private String name;
	
    public void run() {
	for (int i=0; i<5; i++) {
	    System.out.println(name + " " + i);
	    try {
		Thread.sleep(1000); // sleep 1 second
	    } catch (Exception e) {
		System.out.println("Thread sleep exception: " + e);
	    }
	}
    }
}

public class ExampleThreads {

    static public void main(String [] args) {

	// make an array of MyThread objects:
	MyThread threads[] = new MyThread[10];
	for (int i=0; i<10; i++) {
	    threads[i] = new MyThread("my_thread_" + i);
	}
	// now start all the threads:
	for (int i=0; i<10; i++) {
	    threads[i].start(); // calls the 'run' method
	}
    }
}
