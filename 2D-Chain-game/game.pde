

void setup() {
  size(1500, 1000);
  //windowTitle("2D-Chain-Game");
}




void drawLevel1() {
  //draw obsticals
  rect(300, 950, 50, 5);
  
  int xPosFinish = 900;
  int yPosFinish = 900;
  int fWidth = 50;
  int fHight = 40;
  
  // draw finish
  drawFinish(xPosFinish, yPosFinish, fWidth, fHight);
  if (finishReached(xPosFinish, yPosFinish, fWidth, fHight)) {
    finished = true;
    gameState = 2;
  }
}

void timer() {
  levelTime = millis() / 1000 - levelStart;
  fill(30);
  textSize(40);
  text(levelTime, 10, 35);
}





// variables
int gameState = 0;
boolean finished = false;
boolean[] keysPressed = new boolean[8];
int levelStart = 0;
int level = 0; 

// score
int levelTime = 0;
int[] bestTime = new int[8];

// Fig1
int sizeFig1 = 30;
int[] ColorFig1 = {255, 50, 50};
float xPosFig1 = 40;
float yPosFig1 = 30;
float r1 = sizeFig1 / 2;

// Fig2
int sizeFig2 = 30;
int[] ColorFig2 = {50, 50, 255};
float xPosFig2 = 120;
float yPosFig2 = 30;
float r2 = sizeFig2 / 2;

int speed = 5;
float minDistAllowed = r1 + r2 + 1; // +1 for cosmetic reasons
float maxDistAllowed = 150;

float velocityFig1 = 0;
float velocityFig2 = 0;
float gravity = 0.5;

void draw() {
  background(180);
  if (gameState == 0) startscreen();
  else if (gameState == 1) {
    controlFigures();
    drawLevel1();
    DrawChain();
    drawFigures(1);
    timer();
  }
  else if (gameState == 2) endScreen();
}
