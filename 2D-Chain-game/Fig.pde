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
  
  border();
  movementControl();
}

boolean onGround1() { return yPosFig1 >= height - r1 - 1; }
boolean onGround2() { return yPosFig2 >= height - r2 - 1; }

void border() {
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
