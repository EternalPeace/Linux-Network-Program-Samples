// File: WriteFile.java
//
// Example of saving Java objects to a compressed data file
//

import java.io.*;
import java.util.zip.*;

public class WriteFile {

    static public void main(String [] args) {
	// Create a few objects to save:
	Car mustang = new Car("Mustang", 15000.0f);
	Car ford = new Car("Thunderbird", 22000.0f);
	// Open a compressed output stream:
	String file_name = "car.data";
	// Always wrap file IO in a try/catch statement:
	try {
	    FileOutputStream f = new FileOutputStream(file_name);
	    GZIPOutputStream gf = new GZIPOutputStream(f);
	    ObjectOutputStream oos = new ObjectOutputStream(gf);
	    oos.writeObject(mustang);
	    oos.writeObject(ford);
	    oos.flush();
	    oos.close();
	} catch (Exception e) {
	    System.out.println("Error: " + e);
	}
    }
}
