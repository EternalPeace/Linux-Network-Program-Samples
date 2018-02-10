// File: ChatAWT.java

import java.awt.*;
import java.awt.event.*;

public class ChatAWT extends Frame implements ChatListener{
    Panel panel1 = new Panel();
    Label label1 = new Label();
    TextField myPortField = new TextField();
    Label label2 = new Label();
    TextField hostField = new TextField();
    Label label3 = new Label();
    TextField portField = new TextField();
    Label label4 = new Label();
    TextField inputField = new TextField();
    Label label5 = new Label();
    Button connectButton = new Button();
    Button disconnectButton = new Button();
    Button quitButton = new Button();
    TextArea outputField = new TextArea();

    protected ChatEngine chatEngine;
    Button listenButten = new Button();

    public ChatAWT() {
        super("Chat with AWT GUI");
        chatEngine = new ChatEngine();
        chatEngine.registerChatListener(this);
        Panel p = new Panel();
        quitButton.setBounds(448, 280, 111, 32);
        quitButton.setLabel("Quit");
        quitButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                System.exit(0);
            }
        });
        outputField.setBounds(63, 91, 497, 178);
        listenButten.setBounds(5, 281, 153, 33);
        listenButten.setLabel("Start listening");
        listenButten.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.startListening(Integer.parseInt(myPortField.getText()));
            }
        });
        panel1.setLayout(null);
        this.setSize(575, 348);
        label1.setFont(new Font("Dialog", 1, 12));
        label1.setBounds(6, 5, 60, 33);
        label1.setText("My port");
        myPortField.setText("8192");
        myPortField.setBounds(72, 11, 90, 33);
        label2.setFont(new Font("Dialog", 1, 12));
        label2.setBounds(200, 3, 83, 38);
        label2.setText("Remote host");
        hostField.setBounds(299, 7, 94, 27);
        hostField.setText("localhost");
        label3.setFont(new Font("Dialog", 1, 12));
        label3.setBounds(400, 5, 78, 36);
        label3.setText("Remote port");
        portField.setBounds(480, 9, 60, 27);
        portField.setText("8000");
        label4.setFont(new Font("Dialog", 1, 12));
        label4.setBounds(4, 43, 50, 28);
        label4.setText("Input");
        inputField.setBounds(65, 47, 497, 34);
        inputField.setText("  ");
        inputField.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode()  == '\n') {
                    chatEngine.send(inputField.getText());
                }
            }
        });
        label5.setFont(new Font("Dialog", 1, 12));
        label5.setBounds(0, 90, 48, 34);
        label5.setText("Output");
        connectButton.setBounds(175, 280, 126, 34);
        connectButton.setLabel("Connect");
        connectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.connect(hostField.getText(), Integer.parseInt(portField.getText()));
            }
        });
        disconnectButton.setBounds(315, 280, 117, 33);
        disconnectButton.setLabel("Disconnect");
        disconnectButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                chatEngine.logout();
            }
        });
        this.add(panel1, null);
        panel1.add(label1, null);
        panel1.add(myPortField, null);
        panel1.add(label2, null);
        panel1.add(hostField, null);
        panel1.add(label3, null);
        panel1.add(portField, null);
        panel1.add(label4, null);
        panel1.add(inputField, null);
        panel1.add(label5, null);
        panel1.add(connectButton, null);
        panel1.add(disconnectButton, null);
        panel1.add(quitButton, null);
        panel1.add(outputField, null);
        panel1.add(listenButten, null);
        setVisible(true);
        panel1.setVisible(true);

    }
    public void receiveText(String s) {   // ChatListener interface
        outputField.append(s + "\n");
    }
   
    static public void main(String [] args) {
        new ChatAWT();
    }
}
