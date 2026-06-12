void drawLevel() {
  if (level == 0) drawLevel0();
  //else if (level == 1) drawLevel1();
}

void drawLevel0() {
  //draw obsticals
  rect(300, 950, 50, 5);
  
  //draw timer and keep track on time
  timer();
  
  // draw finish
  int xPosFinish = 900;
  int yPosFinish = 900;
  int fWidth = 50;
  int fHight = 40;
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (finishReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    finished = true;
    gameState = 2;
  }
}

void borderObsticals() {
  xPosFig1 = constrain(xPosFig1, r1, width  - r1);
  yPosFig1 = constrain(yPosFig1, r1, height - r1);
  if (yPosFig1 >= height - r1) velocityFig1 = 0;
  
  xPosFig2 = constrain(xPosFig2, r2, width  - r2);
  yPosFig2 = constrain(yPosFig2, r2, height - r2);
  if (yPosFig2 >= height - r2) velocityFig2 = 0;
}

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}
