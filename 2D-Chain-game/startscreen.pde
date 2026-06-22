void startscreen() {
  // backgroundbox
  strokeWeight(0);
  fill(10);
  rect(50 + 11, 50 + 12, 1400, 900, 28); // shadow
  strokeWeight(4);
  fill(50);
  rect(50, 50, 1400, 900, 28);
  line(750, 100, 750, 500);
  line(100, 550, 1400, 550);

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
  rect(1050 + 10, 630 + 11, 300, 250, 28); // shadow
  fill(200);
  strokeWeight(6);
  rect(1050, 630, 300, 250, 28);
  textSize(60);
  fill(10);
  text("START", 1110, 770);
  
  // level
  strokeWeight(0);
  fill(10);
  rect(150 + 6, 600 + 7, 250, 120, 28); // shadow
  rect(460 + 6, 600 + 7, 250, 120, 28); // shadow
  rect(150 + 6, 770 + 7, 250, 120, 28); // shadow
  rect(460 + 6, 770 + 7, 250, 120, 28); // shadow
  fill(200);
  if(level == 1) { strokeWeight(10); fill(255); }
  else { strokeWeight(4); fill(200); }
  rect(150, 600, 250, 120, 28);
  
  if(level == 2) { strokeWeight(10); fill(255); }
  else { strokeWeight(4); fill(200); }
  rect(460, 600, 250, 120, 28);
  
  if(level == 3) { strokeWeight(10); fill(255); }
  else { strokeWeight(4); fill(200); }
  rect(150, 770, 250, 120, 28);
  
  if(level == 4) { strokeWeight(10); fill(255); }
  else { strokeWeight(4); fill(200); }
  rect(460, 770, 250, 120, 28);
  
  textSize(40);
  fill(10);
  text("LEVEL 1", 200, 675);
  text("LEVEL 2", 510, 675);
  text("LEVEL 3", 200, 845);
  text("LEVEL 4", 510, 845);

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

  // Game config (makes the gearsymbol) (AI-generated because im not capable of doing that)
  strokeWeight(8);
  for (int i = 0; i < 8; i++) {
    float winkel = i * (360 / 8) + 20;
    float ix = 880 + cos(radians(winkel)) * 18;
    float iy = 690 + sin(radians(winkel)) * 18;
    float ox = 880 + cos(radians(winkel)) * 30;
    float oy = 690 + sin(radians(winkel)) * 30;
    fill(200);
    line(ix, iy, ox, oy);
  }
  fill(200);
  ellipse(880, 690, 40, 40);
  fill(50);
  ellipse(880, 690, 12, 12);
  
  // highscore
  fill(150);
  strokeWeight(4);
  rect(800, 770, 170, 50, 28);
  fill(0);
  textSize(20);
  text("Best Time: " + bestTime[level], 820, 803);
}
