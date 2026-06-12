void drawEnd(int x, int y, int w, int h) {
  //draw finish
  strokeWeight(0);
  fill(35);
  rect(x, y, w, h);
  strokeWeight(0);
  fill(230);
  for(int j = 0; j < h; j = j + 20) {
    for(int i = 0; i < w; i = i + 20) {
      rect(x + i, y + j , 10, 10);
    }
    for(int i = 10; i < w; i = i + 20) {
      rect(x + i, y + j + 10, 10, 10);
    }
  }
}

boolean endReached(int x, int y, int w, int h) {
  if(xPosFig1 >= x    && yPosFig1 >= y     && xPosFig1 < w + x    && yPosFig1 < h + y) return true;
  else if(xPosFig2 >= x    && xPosFig2 >= y     && xPosFig2 < w + x    && xPosFig2 < h + y) return true;
  else return false;
}
