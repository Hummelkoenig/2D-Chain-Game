void endScreen() {
  //show: score, high score, which player caused end
  
  //update best time
  if (bestTime[level] >= levelTime || bestTime[level] == 0) bestTime[level] = levelTime;
  
  // backgroundbox
  strokeWeight(0);
  fill(10);
  rect(400 + 11, 50 + 12, 700, 900, 28); // shadow
  strokeWeight(4);
  fill(50);
  rect(400, 50, 700, 900, 28);
  
  // restart button
  strokeWeight(0);
  fill(10);
  rect(640 + 6, 770 + 7, 220, 100, 28); // shadow
  fill(200);
  strokeWeight(4);
  rect(640, 770, 220, 100, 28);
  textSize(40);
  fill(10);
  text("RESTART", 675, 835);

  // text
  fill(230);
  textSize(100);
  if (won) {
    text("You Win", 580, 300);
    textSize(20);
    text("Your time is: " + levelTime, 580, 500);
  }
  else text("You Lose", 580, 300);
  textSize(20);
  text("The best time for this level is: " + bestTime[level], 580, 450);
}
