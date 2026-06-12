import javax.swing.*; // library was recomended and explained by AI 

void openSettingsWindow() {
  JTextField maxDistAllowedField = new JTextField(String.valueOf((int)maxDistAllowed), 10);
  JTextField speedField   = new JTextField(String.valueOf(speed), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("Max chain lenght:"));  panel.add(maxDistAllowedField);
  panel.add(new JLabel("speed:"));  panel.add(speedField);

  int result = JOptionPane.showConfirmDialog(null, panel, "settings", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      maxDistAllowed = Integer.parseInt(maxDistAllowedField.getText());
      speed   = Integer.parseInt(speedField.getText());
    } catch (NumberFormatException e) {
      println("Invalid input!");
    }
  }
}

void openColorFig1Window() {
  JTextField r = new JTextField(String.valueOf(ColorFig1[0]), 10);
  JTextField g = new JTextField(String.valueOf(ColorFig1[1]), 10);
  JTextField b = new JTextField(String.valueOf(ColorFig1[2]), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("red:"));  panel.add(r);
  panel.add(new JLabel("green:"));  panel.add(g);
  panel.add(new JLabel("blue:"));  panel.add(b);

  int result = JOptionPane.showConfirmDialog(null, panel, "ColorFig1", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      setColor(ColorFig1, Integer.parseInt(r.getText()), Integer.parseInt(g.getText()), Integer.parseInt(b.getText()));
    } catch (NumberFormatException e) {
      println("Invalid input!");
    }
  }
}

void openColorFig2Window() {
  JTextField r = new JTextField(String.valueOf(ColorFig2[0]), 10);
  JTextField g = new JTextField(String.valueOf(ColorFig2[1]), 10);
  JTextField b = new JTextField(String.valueOf(ColorFig2[2]), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("red:"));  panel.add(r);
  panel.add(new JLabel("green:"));  panel.add(g);
  panel.add(new JLabel("blue:"));  panel.add(b);

  int result = JOptionPane.showConfirmDialog(null, panel, "ColorFig2", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      setColor(ColorFig2, Integer.parseInt(r.getText()), Integer.parseInt(g.getText()), Integer.parseInt(b.getText()));
    } catch (NumberFormatException e) {
      println("Invalid input!");
    }
  }
}

void setColor(int[] arr, int r, int g, int b) {
  arr[0] = r;
  arr[1] = g;
  arr[2] = b;
}
