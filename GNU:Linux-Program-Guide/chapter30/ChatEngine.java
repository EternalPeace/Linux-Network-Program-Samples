// File: ChatEngine.java
//
// Defines the non-GUI behavior for both the AWT
// and JFC versions of the chat programs.
//

import java.net.*;
import java.io.*;

public class ChatEngine {
    protected int port=8080;
    protected String host="127.0.0.1";
    private PrintStream out;
    private HandleInputSocket socketThread;

    public ChatEngine() {
    }

    public void startListening(int my_listen_port) {
        System.out.println("ChatEngine.startListening(" + my_listen_port + ")");
        try {
            socketThread = new HandleInputSocket(my_listen_port);
        } catch (Exception e) {
            System.out.println("Exception 0: " + e);
        }
    }

    public void connect(String host, int port) {
        System.out.println("ChatEngine.connect(" + host + ", " + port + ")");
        this.port=port;
        this.host = host;
        try {
            Socket s = new Socket(host, port);
            out = new PrintStream(s.getOutputStream());
        } catch (Exception e) {
            System.out.println("Exception 1: " + e);
        }

        // just for testing:
        if (chatListener != null) {
            chatListener.receiveText("This is\na test!\nLogging on\n");
        }
    }
    public void logout() {
        try { out.close(); } catch (Exception e) { }
        socketThread.stop();
        socketThread = null;
        // just for testing:
        if (chatListener != null) {
            chatListener.receiveText("This is\na test!\nLogging off\n");
        }
    }

    public void send(String s) {
        try {
            out.println(s);
        } catch (Exception e) { }
    }
    
    void registerChatListener(ChatListener cl) {
        this.chatListener = cl;
    }
    protected ChatListener chatListener = null;

    // inner class to handle socket input:
    class HandleInputSocket extends Thread {
        int listenPort = 8191;
        public HandleInputSocket(int port) {
            super();
            listenPort = port;
            start();
        }
        public void run() {
            ServerSocket serverSocket;
            try {
                serverSocket = new ServerSocket(listenPort, 2000);
            } catch (IOException e) {
                System.out.println("Error in handling socket input: " + e + ", port=" + port);
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
                    input_strm  = new BufferedReader(new InputStreamReader(client_socket.getInputStream()));
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
            }
            public void run() {
                String input_buf;
                try {
                    while (true) {
                        input_buf = input_strm.readLine();
                        if (input_buf == null) {
                           logout();
                           break;
                        }
                        System.out.println("received on socket: " + input_buf);
                        if (chatListener != null) {
                            chatListener.receiveText(input_buf);
                        }
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
}
