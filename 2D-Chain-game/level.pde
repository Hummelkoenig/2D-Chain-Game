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
  obstical(60, 600, 250, 20);
  obstical(370, 550, 250, 20);
  obstical(700, 550, 500, 20);
  obstical(1275, 550, 300, 20);
  
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

void drawLevel2() {
  // obsticals
  obstical(300, 950, 50, 5);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 900;
  int yPosFinish = 900;
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
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 900;
  int yPosFinish = 900;
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
  obstical(50, 950, 300, 20);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 900;
  int yPosFinish = 900;
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
  
  else if (level == 2) {
    xPosFig1 = 40;
    yPosFig1 = 550;
    velocityFig1 = 0;
    
    xPosFig2 = 120;
    yPosFig2 = 550;
    velocityFig2 = 0; 
  }
  
  else if (level == 3) {
    xPosFig1 = 100;
    yPosFig1 = 550;
    velocityFig1 = 0;
    
    xPosFig2 = 140;
    yPosFig2 = 550;
    velocityFig2 = 0;
  }
  
  else if (level == 4) {
    xPosFig1 = 40;
    yPosFig1 = 30;
    velocityFig1 = 0;
    
    xPosFig2 = 120;
    yPosFig2 = 30;
    velocityFig2 = 0; 
  }
}

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}

/*
obstical(30, 150, 200, 20);
obstical(200, 300, 150, 20);
obstical(400, 450, 150, 20);
obstical(300, 650, 350, 20);
obstical(750, 800, 200, 20);
obstical(830, 950, 40, 50);
*/
