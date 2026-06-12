void drawLevel() {
  fig1OnObstacle = false;
  fig2OnObstacle = false;
  if (level == 0) drawLevel0();
}

void drawLevel0() {
  //obstical(300, 950, 50, 5);

  timer();

  int xPosFinish = 900;
  int yPosFinish = 900;
  int fWidth  = 50;
  int fHight  = 40;
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

  // collision with Fig
  collisionObstical(1, x, y, w, h);
  collisionObstical(2, x, y, w, h);
}



void collisionObstical(int fig, float ox, float oy, float ow, float oh) {
  //?
  
  fig1OnObstacle = true;
  fig2OnObstacle = true;
}

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}
