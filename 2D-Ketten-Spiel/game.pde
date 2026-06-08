import javax.swing.*;

void setup() {
  println("game started");
  size(1500, 1000);
  windowTitle("Linus-2D-Ketten-Spiel");
}

void openSettingsWindow() {
  JTextField maxDistField = new JTextField(String.valueOf((int)maxDist), 10);
  JTextField speedField   = new JTextField(String.valueOf(speed), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("Max Kettenlänge:"));  panel.add(maxDistField);
  panel.add(new JLabel("Geschwindigkeit:"));  panel.add(speedField);

  int result = JOptionPane.showConfirmDialog(null, panel, "Einstellungen", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      maxDist = Integer.parseInt(maxDistField.getText());
      speed   = Integer.parseInt(speedField.getText());
    } catch (NumberFormatException e) {
      println("Ungültige Eingabe!");
    }
  }
}

void openColorFig1Window() {
  JTextField r = new JTextField(String.valueOf(ColorFig1[0]), 10);
  JTextField g = new JTextField(String.valueOf(ColorFig1[1]), 10);
  JTextField b = new JTextField(String.valueOf(ColorFig1[2]), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("r:"));  panel.add(r);
  panel.add(new JLabel("g:"));  panel.add(g);
  panel.add(new JLabel("b:"));  panel.add(b);

  int result = JOptionPane.showConfirmDialog(null, panel, "ColorFig1", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      setColor(ColorFig1, Integer.parseInt(r.getText()), Integer.parseInt(g.getText()), Integer.parseInt(b.getText()));
    } catch (NumberFormatException e) {
      println("Ungültige Eingabe!");
    }
  }
}

void openColorFig2Window() {
  JTextField r = new JTextField(String.valueOf(ColorFig2[0]), 10);
  JTextField g = new JTextField(String.valueOf(ColorFig2[1]), 10);
  JTextField b = new JTextField(String.valueOf(ColorFig2[2]), 10);

  JPanel panel = new JPanel();
  panel.setLayout(new java.awt.GridLayout(0, 2, 5, 5));
  panel.add(new JLabel("r:"));  panel.add(r);
  panel.add(new JLabel("g:"));  panel.add(g);
  panel.add(new JLabel("b:"));  panel.add(b);

  int result = JOptionPane.showConfirmDialog(null, panel, "ColorFig2", JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);

  if (result == JOptionPane.OK_OPTION) {
    try {
      setColor(ColorFig2, Integer.parseInt(r.getText()), Integer.parseInt(g.getText()), Integer.parseInt(b.getText()));
    } catch (NumberFormatException e) {
      println("Ungültige Eingabe!");
    }
  }
}

void setColor(int[] arr, int r, int g, int b) {
  arr[0] = r;
  arr[1] = g;
  arr[2] = b;
}

void startscreen() {
  // backgroundbox
  strokeWeight(0);
  fill(10);
  rect(50 + 11, 50 + 12, 1400, 900, 28); // schatten
  strokeWeight(4);
  fill(50);
  rect(50, 50, 1400, 900, 28);
  line(750, 50, 750, 950);

  // text
  fill(230);
  textSize(60);
  text("Player 1", 130, 200);
  text("Player 2", 830, 200);
  textSize(20);
  text("Control player 1 via keys: W A S D", 140, 250);
  text("Control player 2 via keys: U H J K", 840, 250);

  // Start button
  strokeWeight(0);
  fill(10);
  rect(650 + 6, 700 + 7, 200, 100, 28); // schatten
  fill(200);
  strokeWeight(4);
  rect(650, 700, 200, 100, 28);
  textSize(40);
  fill(10);
  text("START", 700, 765);

  // Fig color config
  xPosFig1 = 200;       yPosFig1 = 380;
  xPosFig2 = 200 + 700; yPosFig2 = 380;
  drawFigures(2);
  strokeWeight(0);
  fill(10);
  rect(400 + 6,           345 + 7, 150, 70, 28); // schatten
  rect(400 + 700 + 6,     345 + 7, 150, 70, 28); // schatten
  fill(200);
  strokeWeight(4);
  rect(400,       345, 150, 70, 28);
  rect(400 + 700, 345, 150, 70, 28);

  // Game config (zahnrad)
  strokeWeight(8);
  for (int i = 0; i < 8; i++) {
    float winkel = i * (360 / 8) + 20;
    float ix = 750 + cos(radians(winkel)) * 18;
    float iy = 620 + sin(radians(winkel)) * 18;
    float ox = 750 + cos(radians(winkel)) * 30;
    float oy = 620 + sin(radians(winkel)) * 30;
    fill(200);
    line(ix, iy, ox, oy);
  }
  fill(200);
  ellipse(750, 620, 40, 40);
  fill(50);
  ellipse(750, 620, 12, 12);
}

void mousePressed() {
  if (mouseX >= 650 && mouseX <= 850 && mouseY >= 700 && mouseY <= 800) {
    game = true;
  }
  if (mouseX >= 400 && mouseX <= 400 + 150 && mouseY >= 345 && mouseY <= 345 + 70) {
    openColorFig1Window();
  }
  if (mouseX >= 400 + 700 && mouseX <= 400 + 700 + 150 && mouseY >= 345 && mouseY <= 345 + 70) {
    openColorFig2Window();
  }
  if (mouseX >= 725 && mouseX <= 775 && mouseY >= 595 && mouseY <= 645) {
    openSettingsWindow();
  }
}

void keyPressed() {
  // controllkeys for fig1
  if (key == 'w' || key == 'W') keysPressed[0] = true;
  if (key == 'a' || key == 'A') keysPressed[1] = true;
  if (key == 's' || key == 'S') keysPressed[2] = true;
  if (key == 'd' || key == 'D') keysPressed[3] = true;

  // controllkeys for fig2
  if (key == 'u' || key == 'U') keysPressed[4] = true;
  if (key == 'h' || key == 'H') keysPressed[5] = true;
  if (key == 'j' || key == 'J') keysPressed[6] = true;
  if (key == 'k' || key == 'K') keysPressed[7] = true;

  // return to startscreen
  if (key == '1') game = false;
}

void keyReleased() {
  // controllkeys for fig1
  if (key == 'w' || key == 'W') keysPressed[0] = false;
  if (key == 'a' || key == 'A') keysPressed[1] = false;
  if (key == 's' || key == 'S') keysPressed[2] = false;
  if (key == 'd' || key == 'D') keysPressed[3] = false;

  // controllkeys for fig2
  if (key == 'u' || key == 'U') keysPressed[4] = false;
  if (key == 'h' || key == 'H') keysPressed[5] = false;
  if (key == 'j' || key == 'J') keysPressed[6] = false;
  if (key == 'k' || key == 'K') keysPressed[7] = false;
}

void controlFigures() {
  // Sprung ZUERST prüfen
  if (keysPressed[0] && onGround1()) velocityY1 = -10;
  if (keysPressed[4] && onGround2()) velocityY2 = -10;

  // Schwerkraft
  velocityY1 += gravity;
  velocityY2 += gravity;
  yPosFig1 += velocityY1;
  yPosFig2 += velocityY2;

  // Bewegung links/rechts Fig1
  if (keysPressed[1]) xPosFig1 -= speed;
  if (keysPressed[3]) xPosFig1 += speed;
  collisionEdgeFig1();

  // Bewegung links/rechts Fig2
  if (keysPressed[5]) xPosFig2 -= speed;
  if (keysPressed[7]) xPosFig2 += speed;
  collisionEdgeFig2();

  collisionFigures();
  chainConstraint();
}

boolean onGround1() { return yPosFig1 >= height - r1 - 1; }
boolean onGround2() { return yPosFig2 >= height - r2 - 1; }

void collisionEdgeFig1() {
  xPosFig1 = constrain(xPosFig1, r1, width  - r1);
  yPosFig1 = constrain(yPosFig1, r1, height - r1);
  if (yPosFig1 >= height - r1) velocityY1 = 0;
}

void collisionEdgeFig2() {
  xPosFig2 = constrain(xPosFig2, r2, width  - r2);
  yPosFig2 = constrain(yPosFig2, r2, height - r2);
  if (yPosFig2 >= height - r2) velocityY2 = 0;
}

void collisionFigures() {
  float distx    = xPosFig2 - xPosFig1;
  float disty    = yPosFig2 - yPosFig1;
  float distance = dist(xPosFig1, yPosFig1, xPosFig2, yPosFig2);

  if (distance < minDist && distance > 0) {
    float overlap = minDist - distance;
    float nx = distx / distance;
    float ny = disty / distance;
    xPosFig1 -= nx * overlap / 2;
    yPosFig1 -= ny * overlap / 2;
    xPosFig2 += nx * overlap / 2;
    yPosFig2 += ny * overlap / 2;
  }
}

void chain() {
  strokeWeight(3);
  line(xPosFig1, yPosFig1, xPosFig2, yPosFig2);
}

void chainConstraint() {
  float distx    = xPosFig2 - xPosFig1;
  float disty    = yPosFig2 - yPosFig1;
  float distance = dist(xPosFig1, yPosFig1, xPosFig2, yPosFig2);

  if (distance > maxDist) {
    float overlap = distance - maxDist;
    float nx = distx / distance;
    float ny = disty / distance;
    xPosFig1 += nx * overlap / 2;
    yPosFig1 += ny * overlap / 2;
    xPosFig2 -= nx * overlap / 2;
    yPosFig2 -= ny * overlap / 2;
  }
}

void drawFigures(float a) {
  fill(ColorFig1[0], ColorFig1[1], ColorFig1[2]);
  ellipse(xPosFig1, yPosFig1, a * sizeFig1, a * sizeFig1);
  fill(ColorFig2[0], ColorFig2[1], ColorFig2[2]);
  ellipse(xPosFig2, yPosFig2, a * sizeFig2, a * sizeFig2);
}

void drawObsticals() {
  //rect();
}



// variables
boolean game = false;
boolean[] keysPressed = new boolean[8];

// Fig1
int sizeFig1 = 30;
int[] ColorFig1 = {255, 50, 50};
float xPosFig1 = 40;
float yPosFig1 = 30;
float r1 = sizeFig1 / 2;

// Fig2
int sizeFig2 = 30;
int[] ColorFig2 = {50, 50, 255};
float xPosFig2 = 120;
float yPosFig2 = 30;
float r2 = sizeFig2 / 2;

int speed = 5;
float minDist = r1 + r2 + 1; // +1 aus kosmetischen gründen
float maxDist = 150;

float velocityY1 = 0;
float velocityY2 = 0;
float gravity = 0.5;

void draw() {
  background(180);
  if (!game) startscreen();
  else {
    controlFigures();
    chain();
    drawFigures(1);
    drawObsticals();
  }
}


//------------------------

/*
- if S or J tp zu nächten obstikal oder boden
- Stars / points
- damage system                                  
- game finish

*/
