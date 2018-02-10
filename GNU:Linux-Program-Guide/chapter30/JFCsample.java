// File: JFCsample.java

import javax.swing.*;           // swing 1.1
//import com.sun.java.swing.*;  // swing 1.0
import java.awt.*;
import java.awt.event.*;

public class JFCsample extends JFrame {
    private int count = 0;
    JLabel countLabel;

    public JFCsample() {
        super("JFC Sample Program");

        JPanel panel1 = new JPanel();
        countLabel = new JLabel();
        JButton countButton = new JButton();
        panel1.setLayout(null);
        getContentPane().setLayout(null);  // different than AWT
        setBounds(50, 100, 230, 150);
        setVisible(true);
        panel1.setVisible(true);
        countLabel.setText("button clicked " + count + " times");
        countButton.setText("click me");
        countButton.addMouseListener(
          new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
               countLabel.setText("button clicked " + ++count + " times");
            }
        });
        getContentPane().add(panel1, null); // add with null constraints
        panel1.setBounds(0, 0, 180, 120);
        panel1.add(countLabel, null);       // add with null constraints
        countLabel.setBounds(30, 35, 190, 20);
        panel1.add(countButton, null);      // add with null constraints
        countButton.setBounds(40, 65, 100, 30);
    }

    static public void main(String [] args) {
        new JFCsample();
    }
}
