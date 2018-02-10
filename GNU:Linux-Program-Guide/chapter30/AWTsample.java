// File: AWTsample.java

import java.awt.*;
import java.awt.event.*;

public class AWTsample extends Frame {
    private int count = 0;
    Label countLabel;

    public AWTsample() {
        super("AWT Sample Program");

        Panel panel1 = new Panel();
        countLabel = new Label();
        Button countButton = new Button();
        panel1.setLayout(null);
        setSize(180, 150);
        panel1.setVisible(true);
        countLabel.setText("button clicked " + count + " times");
        countButton.setLabel("click me");
        countButton.addMouseListener(
          new java.awt.event.MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
               countLabel.setText("button clicked " + ++count + " times");
            }
        });
        panel1.add(countLabel);
        countLabel.setBounds(30, 35, 140, 20);
        panel1.add(countButton);
        countButton.setBounds(40, 65, 100, 30);
        add(panel1);
        setVisible(true);
    }

    static public void main(String [] args) {
        new AWTsample();
    }
}
