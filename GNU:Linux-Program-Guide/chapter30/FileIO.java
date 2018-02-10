// File: FileIO.java
//
// Example of writing to a text file, then reading the file
//

import java.io.*;

public class FileIO {

    static public void main(String [] args) {
	// Always wrap file IO in a try/catch statement:
	try {

	    // Write a file:

	    BufferedWriter bw = new BufferedWriter(new FileWriter("temp.txt"));
	    bw.write("This is a test\n");
	    bw.write("This is a second line of text\n");
	    bw.write("Here is the number three: " + 3 + "\n");
	    bw.close();

	    // Read the file that we just wrote:

	    BufferedReader br = new BufferedReader(new FileReader("temp.txt"));
            while (true) {
               String s = br.readLine();
               if (s == null || s.length() < 1)  break;
	       System.out.println("line from file: " + s);
	    }
	    br.close();
	} catch (Exception e) {
	    System.out.println("Error: " + e);
	}
    }
}
