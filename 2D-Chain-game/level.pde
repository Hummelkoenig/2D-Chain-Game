void drawLevel() {
  fig1OnObstacle = false;
  fig2OnObstacle = false;
  if (level == 0) drawLevel0();
}

void drawLevel0() {
  // obsticals
  obstical(300, 950, 50, 5);
  
  // timer
  timer();
  
  // finish
  int xPosFinish = 900;
  int yPosFinish = 900;
  int fWidth = 50;
  int fHight = 40;
  drawEnd(xPosFinish, yPosFinish, fWidth, fHight);
  if (endReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    end  = true;
    gameState = 2;
  }
}

void obstical(int x, int y, int w, int h) {
  // draw obstical
  strokeWeight(0);
  fill(80);
  rect(x, y, w, h);

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

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}
