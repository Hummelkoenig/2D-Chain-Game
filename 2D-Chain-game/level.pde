void drawLevel() {
  fig1OnObstacle = false;
  fig2OnObstacle = false;
  if (level == 1) drawLevel1();
  else if (level == 2) drawLevel2();
  else if (level == 3) drawLevel3();
  else if (level == 4) drawLevel4();
}

void drawLevel1() {
  // obsticals
  fill(150);
  textSize(60);
  text("Tutorial", 130, 200);
  obstical(60, 600, 1400, 20);
  obstical(600, 530, 400, 20);
  deathZone(-10, 990, 2000, 20);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 1300;
  int yPosFinish = 540;
  int fWidth = 50;
  int fHight = 40;
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (endReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    end  = true;
    won = true;
    gameState = 2;
  }
}

void drawLevel2() {
  // obsticals
  obstical(60, 600, 250, 20);
  obstical(370, 550, 250, 20);
  obstical(700, 550, 500, 20);
  obstical(1275, 550, 300, 20);
  deathZone(900, 540, 60, 20);
  deathZone(-10, 990, 2000, 20);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 1400;
  int yPosFinish = 470;
  int fWidth = 50;
  int fHight = 40;
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (endReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    end  = true;
    won = true;
    gameState = 2;
  }
}

void drawLevel3() {
  // obsticals
  obstical(60, 600, 250, 20);
  obstical(400, 550, 200, 20);
  obstical(670, 650, 80, 20);
  obstical(810, 650, 150, 20);
  obstical(550, 470, 150, 20);
  obstical(770, 440, 100, 20);
  obstical(930, 410, 100, 20);
  obstical(1100, 550, 100, 20);
  obstical(1020, 600, 120, 20);
  obstical(1275, 530, 300, 20);
  deathZone(880, 490, 60, 20);
  deathZone(1120, 380, 20, 80);
  deathZone(-10, 990, 2000, 20);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 1400;
  int yPosFinish = 460;
  int fWidth = 50;
  int fHight = 40;
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (endReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    end  = true;
    won = true;
    gameState = 2;
  }
}

void drawLevel4() {
  // obsticals
  strokeWeight(0);
  fill(100, 150, 100);
  rect(70, 640, 80, 20, 30);
  obstical(350, 910, 20, 50);
  obstical(50, 950, 1100, 20);
  obstical(1200, 885, 130, 20);
  obstical(1325, 830, 130, 20);
  obstical(1160, 770, 100, 20);
  obstical(580, 720, 530, 20);
  obstical(200, 720, 300, 20);
  obstical(60, 650, 100, 20);
  obstical(220, 240, 100, 20);
  obstical(360, 200, 100, 20);
  obstical(500, 160, 100, 20);
  obstical(640, 120, 500, 20);
  obstical(1300, 500, 300, 20);
  deathZone(1300, 30, 20, 300);
  deathZone(1100, 550, 250, 20);
  deathZone(400, 870, 20, 70);
  deathZone(630, 940, 50, 20);
  deathZone(830, 940, 50, 20);
  deathZone(780, 710, 50, 20);
  deathZone(900, 710, 50, 20);
  deathZone(820, 110, 50, 20);
  deathZone(-10, 990, 2000, 20);


  // tp
  if(xPosFig1 >= 60    && yPosFig1 >= 600     && xPosFig1 < 100 + 60    && yPosFig1 < 50 + 600) {
    xPosFig1 = 80;
    yPosFig1 = 30;
    velocityFig1 = 0;
    
    xPosFig2 = 80;
    yPosFig2 = 70;
    velocityFig2 = 0;
  }
  if(xPosFig2 >= 60    && yPosFig2 >= 600     && xPosFig2 < 100 + 60    && yPosFig2 < 50 + 600) {
    xPosFig1 = 80;
    yPosFig1 = 30;
    velocityFig1 = 0;
    
    xPosFig2 = 80;
    yPosFig2 = 70;
    velocityFig2 = 0;
  }
  
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 1410;
  int yPosFinish = 435;
  int fWidth = 50;
  int fHight = 40;
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (endReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    end  = true;
    won = true;
    gameState = 2;
  }
}

void obstical(int x, int y, int w, int h) {
  // draw obstical
  strokeWeight(0);
  fill(80);
  rect(x, y, w, h, 20);

  // collision fig 1
  if (xPosFig1 >= x && xPosFig1 <= x + w) {
    if (yPosFig1 + r1 >= y && yPosFig1 - r1 < y && velocityFig1 >= 0) {
      yPosFig1 = y - r1;
      velocityFig1 = 0;
      fig1OnObstacle = true;
    }
    else if (yPosFig1 - r1 <= y + h && yPosFig1 + r1 > y + h && velocityFig1 < 0) {
      yPosFig1 = y + h + r1;
      velocityFig1 = 1;
    }
  }

  // collision fig 2 
  if (xPosFig2 >= x && xPosFig2 <= x + w) {
    if (yPosFig2 + r2 >= y && yPosFig2 - r2 < y && velocityFig2 >= 0) {
      yPosFig2 = y - r2;
      velocityFig2 = 0;
      fig2OnObstacle = true;
    }
    else if (yPosFig2 - r2 <= y + h && yPosFig2 + r2 > y + h && velocityFig2 < 0) {
      yPosFig2 = y + h + r2;
      velocityFig2 = 1;
    }
  }
}

void resetFigures(int level) {
  if (level == 1) {
    xPosFig1 = 100;
    yPosFig1 = 550;
    velocityFig1 = 0;
    
    xPosFig2 = 140;
    yPosFig2 = 550;
    velocityFig2 = 0; 
  }
  
  if (level == 2) {
    xPosFig1 = 40;
    yPosFig1 = 550;
    velocityFig1 = 0;
    
    xPosFig2 = 120;
    yPosFig2 = 550;
    velocityFig2 = 0; 
  }
  
  if (level == 3) {
    xPosFig1 = 100;
    yPosFig1 = 550;
    velocityFig1 = 0;
    
    xPosFig2 = 140;
    yPosFig2 = 550;
    velocityFig2 = 0;
  }
  
  if (level == 4) {
    xPosFig1 = 80;
    yPosFig1 = 900;
    velocityFig1 = 0;
    
    xPosFig2 = 130;
    yPosFig2 = 900;
    velocityFig2 = 0; 
  }
}

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}


void deathZone(int x, int y, int w, int h) {
  // draw danger box (red with X-pattern)
  strokeWeight(0);
  fill(170, 50, 50);
  rect(x, y, w, h, 30);

  // collision fig1 - jede Berührung = Tod
  if (xPosFig1 + r1 > x && xPosFig1 - r1 < x + w &&
      yPosFig1 + r1 > y && yPosFig1 - r1 < y + h) {
    won = false;
    end = true;
    gameState = 2;
  }

  // collision fig2 - jede Berührung = Tod
  if (xPosFig2 + r2 > x && xPosFig2 - r2 < x + w &&
      yPosFig2 + r2 > y && yPosFig2 - r2 < y + h) {
    won = false;
    end = true;
    gameState = 2;
  }
}
