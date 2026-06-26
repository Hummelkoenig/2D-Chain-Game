void mousePressed() {
  print("mouse X: " + mouseX);
  println("  Y: " + mouseY);
  
  // buttons for start and end
  if (mouseX >= 1050 && mouseX <= 1350 && mouseY >= 630 && mouseY <= 880 && gameState == 0) { // start
    gameState = 1;
    levelStart = millis() / 1000;
    resetFigures(level);
  }
  if (mouseX >= 640 && mouseX <= 860 && mouseY >= 770 && mouseY <= 870 && gameState == 2) { // restart
    gameState = 0;
    end = false;
  }
  
  // buttons for level
  if (mouseX >= 150 && mouseX <= 400 && mouseY >= 600 && mouseY <= 720 && gameState == 0) { // Level 1
    level = 1;
    println("level: " + level);
  }
  if (mouseX >= 460 && mouseX <= 710 && mouseY >= 600 && mouseY <= 720 && gameState == 0) { // Level 2
    level = 2;
    println("level: " + level);
  }
  if (mouseX >= 150 && mouseX <= 400 && mouseY >= 770 && mouseY <= 890 && gameState == 0) { // Level 3
    level = 3;
    println("level: " + level);
  }
  if (mouseX >= 460 && mouseX <= 710 && mouseY >= 770 && mouseY <= 890 && gameState == 0) { // Level 4
    level = 4;
    println("level: " + level);
  }
  
  // buttons for Colorwindow
  if (mouseX >= 400 && mouseX <= 400 + 150 && mouseY >= 345 && mouseY <= 345 + 70 && gameState == 0) { // color Fig 1
    openColorFig1Window();
  }
  if (mouseX >= 400 + 700 && mouseX <= 400 + 700 + 150 && mouseY >= 345 && mouseY <= 345 + 70 && gameState == 0) { // color fig2
    openColorFig2Window();
  }
  if (mouseX >= 845 && mouseX <= 910 && mouseY >= 650 && mouseY <= 720 && gameState == 0) { // Settings
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

  // opperation keys (should be hided)
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
