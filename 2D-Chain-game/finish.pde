void drawFinish(int x, int y, int Width, int Hight) {
  //draw finish
  strokeWeight(0);
  fill(35);
  rect(x, y, Width, Hight);
  strokeWeight(0);
  fill(230);
  for(int j = 0; j < Hight; j = j + 20) {
    for(int i = 0; i < Width; i = i + 20) {
      rect(x + i, y + j , 10, 10);
    }
    for(int i = 10; i < Width; i = i + 20) {
      rect(x + i, y + j + 10, 10, 10);
    }
  }
}

boolean finishReached(int x, int y, int Width, int Hight) {
  if(xPosFig1 >= x    && yPosFig1 >= y     && xPosFig1 < Width + x    && yPosFig1 < Hight + y) return true;
  else if(xPosFig2 >= x    && xPosFig2 >= y     && xPosFig2 < Width + x    && xPosFig2 < Hight + y) return true;
  else return false;
}
