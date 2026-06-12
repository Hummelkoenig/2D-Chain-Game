import javax.swing.*;

void setup() {
  size(1500, 1000);
  //windowTitle("2D-Chain-Game");
}

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

void endScreen() {
  //show: score, high score, which player caused end
  
  //update score
  if (score > highScore) highScore = score;
  
  // backgroundbox
  strokeWeight(0);
  fill(10);
  rect(400 + 11, 50 + 12, 700, 900, 28); // shadow
  strokeWeight(4);
  fill(50);
  rect(400, 50, 700, 900, 28);
  
  // restart button
  strokeWeight(0);
  fill(10);
  rect(640 + 6, 770 + 7, 220, 100, 28); // shadow
  fill(200);
  strokeWeight(4);
  rect(640, 770, 220, 100, 28);
  textSize(40);
  fill(10);
  text("RESTART", 675, 835);

  // text
  fill(230);
  textSize(90);
  if (finished) text("finished", 130, 200);
  else text("you died", 580, 220);
  textSize(20);
  if (highScore > 0) text("High score is: " + highScore, 840, 250);

  
  line(750, 50, 750, 950);
}

void startscreen() {
  // backgroundbox
  strokeWeight(0);
  fill(10);
  rect(50 + 11, 50 + 12, 1400, 900, 28); // shadow
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
  rect(650 + 6, 700 + 7, 200, 100, 28); // shadow
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
  rect(400 + 6,           345 + 7, 150, 70, 28); // shadow
  rect(400 + 700 + 6,     345 + 7, 150, 70, 28); // shadow
  fill(200);
  strokeWeight(4);
  rect(400,       345, 150, 70, 28);
  rect(400 + 700, 345, 150, 70, 28);
  textSize(20);
  fill(0);
  text("change color", 420, 385);
  text("change color", 1120, 385);

  // Game config (makes the gear) (AI-generated because im not capable of doing that)
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
  
  // highscore
  fill(150);
  strokeWeight(4);
  rect(680, 830, 150, 50, 28);
  fill(0);
  textSize(20);
  text("Highscore: " + highScore, 700, 862);
}

void mousePressed() {
  // buttons for start and end
  if (mouseX >= 650 && mouseX <= 850 && mouseY >= 700 && mouseY <= 800 && gameState == 0) { // start
    gameState = 1;
  }
  if (mouseX >= 640 && mouseX <= 850 && mouseY >= 720 && mouseY <= 800 && gameState == 2) { // restart
    gameState = 0;
    finished = false;
  }
  
  // buttons for Colorwindow
  if (mouseX >= 400 && mouseX <= 400 + 150 && mouseY >= 345 && mouseY <= 345 + 70 && gameState == 0) { // color Fig 1
    openColorFig1Window();
  }
  if (mouseX >= 400 + 700 && mouseX <= 400 + 700 + 150 && mouseY >= 345 && mouseY <= 345 + 70 && gameState == 0) { // color fig2
    openColorFig2Window();
  }
  if (mouseX >= 725 && mouseX <= 775 && mouseY >= 595 && mouseY <= 645 && gameState == 0) { // Settings
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

  // opperation keys (secret)
  if (key == '1') gameState = 0;
  if (key == '2') gameState = 1;
  if (key == '3') gameState = 2;
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
  // jump + gravity
  if (keysPressed[0] && onGround1()) velocityFig1 = -10;
  if (keysPressed[4] && onGround2()) velocityFig2 = -10;
  velocityFig1 += gravity;
  velocityFig2 += gravity;
  yPosFig1 += velocityFig1;
  yPosFig2 += velocityFig2;

  // movement Fig1
  if (keysPressed[1]) xPosFig1 -= speed;
  if (keysPressed[3]) xPosFig1 += speed;

  // movement Fig2
  if (keysPressed[5]) xPosFig2 -= speed;
  if (keysPressed[7]) xPosFig2 += speed;
  
  collisionEdge();
  movementControl();
}

boolean onGround1() { return yPosFig1 >= height - r1 - 1; }
boolean onGround2() { return yPosFig2 >= height - r2 - 1; }

void collisionEdge() {
  xPosFig1 = constrain(xPosFig1, r1, width  - r1);
  yPosFig1 = constrain(yPosFig1, r1, height - r1);
  if (yPosFig1 >= height - r1) velocityFig1 = 0;
  
  xPosFig2 = constrain(xPosFig2, r2, width  - r2);
  yPosFig2 = constrain(yPosFig2, r2, height - r2);
  if (yPosFig2 >= height - r2) velocityFig2 = 0;
}

void collisionObstical() {
  xPosFig1 = constrain(xPosFig1, r1, width  - r1);
  yPosFig1 = constrain(yPosFig1, r1, height - r1);
  if (yPosFig1 >= height - r1) velocityFig1 = 0;
  
  xPosFig2 = constrain(xPosFig2, r2, width  - r2);
  yPosFig2 = constrain(yPosFig2, r2, height - r2);
  if (yPosFig2 >= height - r2) velocityFig2 = 0;
}

void movementControl() {
  float distx    = xPosFig2 - xPosFig1;
  float disty    = yPosFig2 - yPosFig1;
  float distance = dist(xPosFig1, yPosFig1, xPosFig2, yPosFig2);

  if (distance < minDistAllowed && distance > 0) {
    float overshoot = minDistAllowed - distance;
    float nx = distx / distance;
    float ny = disty / distance;
    xPosFig1 -= nx * overshoot / 2;
    yPosFig1 -= ny * overshoot / 2;
    xPosFig2 += nx * overshoot / 2;
    yPosFig2 += ny * overshoot / 2;
  }
  
  if (distance > maxDistAllowed) {
    float overlap = distance - maxDistAllowed;
    float directCorrectionX = distx / distance;
    float directCorrectionY = disty / distance;
    xPosFig1 += directCorrectionX * overlap / 2;
    yPosFig1 += directCorrectionY * overlap / 2;
    xPosFig2 -= directCorrectionX * overlap / 2;
    yPosFig2 -= directCorrectionY * overlap / 2;
  }
}

void DrawChain() {
  strokeWeight(3);
  line(xPosFig1, yPosFig1, xPosFig2, yPosFig2);
}

void drawFigures(float a) {
  strokeWeight(3);
  fill(ColorFig1[0], ColorFig1[1], ColorFig1[2]);
  ellipse(xPosFig1, yPosFig1, a * sizeFig1, a * sizeFig1);
  fill(ColorFig2[0], ColorFig2[1], ColorFig2[2]);
  ellipse(xPosFig2, yPosFig2, a * sizeFig2, a * sizeFig2);
}

void drawLevel() {
  //draw obsticals
  rect(300, 950, 50, 5);
  
  // draw finish
  drawFinish();
}

void drawFinish() {
  //draw finish
  strokeWeight(0);
  fill(35);
  rect(xFinish, yFinish, fWidth, fHight);
  strokeWeight(0);
  fill(230);
  for(int j = 0; j < fHight; j = j + 20) {
    for(int i = 0; i < fWidth; i = i + 20) {
      rect(xFinish + i, yFinish + j , 10, 10);
    }
    for(int i = 10; i < fWidth; i = i + 20) {
      rect(xFinish + i, yFinish + j + 10, 10, 10);
    }
  }
}

void finishReached() {
  if(xPosFig1 >= xFinish    && yPosFig1 >= yFinish     && xPosFig1 < fWidth + xFinish    && yPosFig1 < fHight + yFinish) finished = true;
  else if(xPosFig2 >= xFinish    && xPosFig2 >= yFinish     && xPosFig2 < fWidth + xFinish    && xPosFig2 < fHight + yFinish) finished = true;
}

void score() {
    fill(30);
    textSize(40);
    text(millis() / 1000, 10, 35);
    millis() / 1000
}


// variables
int gameState = 0;
boolean finished = false;
boolean[] keysPressed = new boolean[8];

// score
long score = 0;
int highScore = 0;

// finish
int xFinish = 900;
int yFinish = 900;
int fWidth = 50;
int fHight = 40;

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
float minDistAllowed = r1 + r2 + 1; // +1 for cosmetic reasons
float maxDistAllowed = 150;

float velocityFig1 = 0;
float velocityFig2 = 0;
float gravity = 0.5;

void draw() {
  background(180);
  if (gameState == 0) startscreen();
  else if (gameState == 1) {
    controlFigures();
    drawLevel();
    DrawChain();
    drawFigures(1);
    if (finished) gameState = 2;
    score();
  }
  else if (gameState == 2) endScreen();
}

//------------------------
