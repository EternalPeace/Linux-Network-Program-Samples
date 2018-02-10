import java.net.*;
import java.io.*;

public class ExampleSockets {

    // Default host name and port number:
    final static public String host = "127.0.0.1"; // local host
    final static public int port = 8000;

    protected String my_name = "no_name";

    // inner class to handle socket output:
    class do_output extends Thread {
	private int num_sends;
	PrintStream out;
	public do_output(int num_sends) {
	    this.num_sends = num_sends;
	    start();
	}
	public do_output() {
	    this(10);
	}
	public void run() {
	    try {
		Socket s = new Socket(host, port);
		DataInputStream in   = new DataInputStream(s.getInputStream());
		out = new PrintStream(s.getOutputStream());
	    } catch (Exception e) {
		System.out.println("Exception 1: " + e);
	    }
	    for (int i=0; i<10; i++) {
		out.println(my_name + " sends " + i);
		try { Thread.sleep(500); } catch (Exception e) { }
	    }
	    try { Thread.sleep(2000); } catch (Exception e) { }
	    System.out.println("All done.");
	    System.exit(0);
	}
    }

    // inner class to handle socket input:
    class do_input extends Thread {

	public do_input() {
	    super();
	    start();
	}
	public void run() {
	    ServerSocket serverSocket;
	    try {
		serverSocket = new ServerSocket(port, 2000);
	    } catch (IOException e) {
		System.out.println("Error in handling socket input: " + e);
		return;
	    }
	    
	    try  {
		while (true) {
		    Socket socket = serverSocket.accept();
		    new MyServerConnection(socket);
		}
	    } catch (IOException e) {
		System.out.println("Error in new socket connection: " + e);
	    } finally {
		try {
		    serverSocket.close();
		} catch (IOException e) {
		    System.out.println("I/O exception: " + e);
		}
	    }
	}
	// an inner (inner) class to handle incoming socket connections
	public class MyServerConnection extends Thread {
	    protected transient Socket client_socket;
	    protected transient BufferedReader input_strm;
	    protected transient PrintStream output_strm;
	    
	    public MyServerConnection(Socket client_socket) {
		this.client_socket = client_socket;
		try {
		    input_strm=new BufferedReader(new InputStreamReader(client_socket.getInputStream()));
		    output_strm = new PrintStream(client_socket.getOutputStream());
		}
		catch (IOException io_exception) {
		    try { client_socket.close(); } catch (IOException io_ex2) {  };
		    System.err.println("Exception 2: getting socket streams " +
				       io_exception);
		    return;
		}
		// Start the thread (i.e., call method 'run'):
		this.start();
		//System.out.println("MyServerConnection is set up.");
	    }

	    public void run() {
		String input_buf;
		try {
		    while (true) {
			input_buf = input_strm.readLine();
			System.out.println("received on socket: " + input_buf);
		    }
		}
		catch (Exception exception) { }
		finally {
		    try {
			client_socket.close();
		    }
		    catch (Exception exception) { };
		}
	    }
	}
    }

    public ExampleSockets() {
	do_input ins   = new do_input();
	do_output outs = new do_output();
	//ins.start();
	//try { Thread.sleep(2000); } catch (Exception e) { }
	//outs.start();
    }
		
  public static void main(String [] args) {
      ExampleSockets ex = new ExampleSockets();
      if (args.length > 0)  ex.my_name = args[0];
  }
}
