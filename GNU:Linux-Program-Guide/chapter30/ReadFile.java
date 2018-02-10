// File: ReadFile.java
//
// Example of saving Java objects to a compressed data file
//

import java.io.*;
import java.util.zip.*;

public class ReadFile {

    static public void main(String [] args) {
	String file_name = "car.data";
	Car c1, c2;
	// Always wrap file IO in a try/catch statement:
	try {
	    FileInputStream f = new FileInputStream(file_name);
	    GZIPInputStream gf = new GZIPInputStream(f);
	    ObjectInputStream ois = new ObjectInputStream(gf);
	    c1 = (Car)ois.readObject();
	    c2 = (Car)ois.readObject();
	    ois.close();
	    
	    System.out.println("Cars reads from file: " + c1.getName() +
			       " and " + c2.getName());
	} catch (Exception e) {
	    System.out.println("Error: " + e);
	}
    }
}
