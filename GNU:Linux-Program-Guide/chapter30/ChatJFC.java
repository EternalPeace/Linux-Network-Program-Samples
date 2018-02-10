// File: ChatJFC.java

import javax.swing.*;            // swing 1.1
//import com.sun.java.swing.*;   // swing 1.0
import java.awt.*;
import java.awt.event.*;

public class ChatJFC extends JFrame implements ChatListener{
    JPanel jPanel1 = new JPanel();
    JTextField myPortField = new JTextField();
    JLabel label1 = new JLabel();
    JLabel label2 = new JLabel();
    JTextField hostField = new JTextField();
    JLabel label3 = new JLabel();
    JTextField portField = new JTextField();
    JLabel label4 = new JLabel();
    JTextField inputField = new JTextField();
    JLabel label5 = new JLabel();
    JButton listenButton = new JButton();
    JButton connectButton = new JButton();
    JButton disconnectButton = new JButton();
    JButton quitButton = new JButton();
    JTextArea outputField = new JTextArea();
    JScrollPane jScrollPane1 = new JScrollPane();

    protected ChatEngine chatEngine;

    public ChatJFC() {
        super("Chat with JFC GUI");
        chatEngine = new ChatEngine();
        chatEngine.registerChatListener(this);
        this.setSize(575, 348);
        jPanel1.setLayout(null);
        jPanel1.setBounds(5, 16, 595, 343);
        outputField.setRows(500);
        jScrollPane1.setBounds(66, 92, 498, 168);
        this.getContentPane().setLayout(null);
        quitButton.setBounds(448, 280, 121, 32);
        quitButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                System.exit(0);
            }
        });
        quitButton.setText("Quit");
        this.setSize(592, 371);
        label1.setFont(new Font("Dialog", 1, 12));
        label1.setBounds(1, 5, 69, 33);
        label1.setText("My port");
        myPortField.setBounds(62, 11, 100, 24);
        myPortField.setText("8000");
        label2.setFont(new Font("Dialog", 1, 12));
        label2.setBounds(200, 3, 93, 38);
        label2.setText("Remote host");
        hostField.setBounds(299, 7, 129, 27);
        hostField.setText("localhost");
        label3.setFont(new Font("Dialog", 1, 12));
        label3.setBounds(433, 5, 45, 36);
        label3.setText("Port");
        portField.setBounds(469, 9, 93, 27);
        portField.setText("8192");
        label4.setFont(new Font("Dialog", 1, 12));
        label4.setBounds(4, 43, 60, 28);
        label4.setText("Input");
        inputField.setBounds(65, 47, 507, 34);
        inputField.setText("  ");
        inputField.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode()  == '\n') {
                    chatEngine.send(inputField.getText());
                }
            }
        });
        label5.setFont(new Font("Dialog", 1, 12));
        label5.setBounds(0, 90, 58, 34);
        label5.setText("Output");
        listenButton.setBounds(5, 281, 163, 33);
        listenButton.setText("Start listening");
        listenButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.startListening(Integer.parseInt(myPortField.getText()));
            }
        });
        connectButton.setBounds(175, 280, 136, 34);
        connectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.connect(hostField.getText(), Integer.parseInt(portField.getText()));
            }
        });
        connectButton.setText("Connect");
        disconnectButton.setBounds(315, 280, 127, 33);
        disconnectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.connect(hostField.getText(), Integer.parseInt(portField.getText()));
            }
        });
        disconnectButton.setText("Disconnect");
        this.getContentPane().add(jPanel1, null);
        jPanel1.add(label1, null);
        jPanel1.add(myPortField, null);
        jPanel1.add(label2, null);
        jPanel1.add(hostField, null);
        jPanel1.add(label3, null);
        jPanel1.add(portField, null);
        jPanel1.add(label4, null);
        jPanel1.add(inputField, null);
        jPanel1.add(label5, null);
        jPanel1.add(listenButton, null);
        jPanel1.add(connectButton, null);
        jPanel1.add(disconnectButton, null);
        jPanel1.add(quitButton, null);
        jPanel1.add(jScrollPane1, null);
        jScrollPane1.getViewport().add(outputField, null);
        setVisible(true);
    }
    private String output_string = "";
    public void receiveText(String s) {
        if (s == null)  return;
        output_string = output_string + s;
        outputField.setText(output_string + "\n");
    }

    static public void main(String [] args) {
        new ChatJFC();
    }
}
