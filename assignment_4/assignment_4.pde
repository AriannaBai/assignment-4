  PImage Background;
  PImage character;
  PImage mainMenu;
  PImage obstacleA;
  boolean isOnMainPage = true;
  
//---------------------basic-------------------------------
void setup() {
  size(680, 500); //initial canvas size set to 680, 500
  
  //load image
  Background = loadImage ("backgroun.png");
  character = loadImage("Character.png");
  mainMenu = loadImage ("Main menu.png");
  obstacleA = loadImage("ob1.png");
}

void draw() {
  if(isOnMainPage){
  background(135, 206, 235);
  
  //main menu
  image (mainMenu, 0, 0, width, height);
  
  fill (245, 215, 229);
  rect (width / 2 - 75, height / 2, 150, 50);
  
  fill (255);
  textSize (50);
  text ("START", width / 2, height / 2 + 25);
  } else {
    image( Background, 0, 0, width, height);
  }
  
  // text 
    fill (255);
    textSize (20);
    text ("SCORE:" + score, 350, 20);
    
 // HOW CAN LET THE GAME WIN??
 if (score >= 30) {
   isGameWin = true;
  }

// GAME WIN PART
  if (isGameWin) {
  background (187, 229, 167);
  textAlign( CENTER, CENTER);
  
  fill (83, 116, 67);
  textSize (35);
  text(" YEAHH!!! YOU WIN THE GAME!", width / 2, height / 2);
  textSize (17);
  text(" Press O to play again", width / 2, height / 2 + 45);
 }

// GAME LOSE PART
  if (isGameOver) {
  background (144, 177, 201);
  textAlign( CENTER, CENTER);
  
  fill (67, 97, 118);
  textSize (35);
  text(" OOPS--YOU LOSE THE GAME", width / 2, height / 2);
  textSize (17);
  text(" Press O to try again", width / 2, height / 2 + 45);
 }
 
 // Reset the game
 void resetGame() {
   isGameWin = false;
   isGameOver = false;
   characterPosition. set(100, groundY - 30 + 100);
   velocityY = 0;
   currentJumpCount = 0;
   score = 0;
 }
