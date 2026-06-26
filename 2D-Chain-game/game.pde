//---Setup---
  void setup() {
    size(1500, 1000);
    windowTitle("2D-Chain-Game"); // may not work on older version of Processing! if error, comment out!
  }


//---Global Variables---
  // variables
  int gameState = 0;
  boolean end = false;
  boolean[] keysPressed = new boolean[8];
  boolean won = false;
  
  //level
  int levelStart = 0;
  int level = 1; 
  
  // score
  int levelTime = 0;
  int[] bestTime = new int[8];
  
  // Fig1
  int sizeFig1 = 30;
  int[] ColorFig1 = {255, 50, 50};
  float xPosFig1 = 40;
  float yPosFig1 = 30;
  float r1 = sizeFig1 / 2;
  boolean fig1OnObstacle = false;
  
  // Fig2
  int sizeFig2 = 30;
  int[] ColorFig2 = {50, 50, 255};
  float xPosFig2 = 120;
  float yPosFig2 = 30;
  float r2 = sizeFig2 / 2;
  boolean fig2OnObstacle = false;
  
  // chain
  float minDistAllowed = r1 + r2 + 1; // +1 for cosmetic reasons
  float maxDistAllowed = 250;
  
  // movement
  float velocityFig1 = 0;
  float velocityFig2 = 0;
  float gravity = 0.5;
  int speed = 5;


//---Looop---
  void draw() {
    background(180);
    if (gameState == 0) startscreen();
    else if (gameState == 1) {
      controlFigures();
      drawLevel();
      DrawChain();
      drawFigures(1);
    }
    else if (gameState == 2) endScreen();
}
