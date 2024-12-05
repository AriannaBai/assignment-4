 // images i need
  PImage Background;
  PImage character;
  PImage mainMenu;
  PImage obstacleA;
  boolean isOnMainPage = true;
  

 // ground and jump
  float groundY = 350;
  float gravity = 1;
  float jumpPower = -15;
  int maxJumpCount = 2;
  int currentJumpCount = 0;
 // score
  int score = 0;
 // main menu
  boolean isOnMianPage = true;
 
 //Game over? game win??
  boolean isGameWin = false;
  boolean isGameOver = false;
  
  //character
  character characterBai;
  
//---------------------basic-------------------------------
void setup() {
  size(680, 500); //initial canvas size set to 680, 500
  
  //load image
  Background = loadImage ("backgroun.png");
  character = loadImage("Character.png");
  mainMenu = loadImage ("Main menu.png");
  obstacleA = loadImage("ob1.png");
  
  characterBai = new character(100, 350, 0, -15, 0, 1);
  
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
  text ("START", width / 2, height / 2 );
  } else {
    image( Background, 0, 0, width, height);
  }
  
  // text 
    fill (255);
    textSize (20);
    text ("SCORE:" + score, 450, 20);
    
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
 characterBai.update();
}
 
 // Reset the game
 void resetGame(){
   isGameWin = false;
   isGameOver = false;
   characterBai.velocity.y = 0;
   currentJumpCount = 0;
   score = 0;
 }
 
 // key press
 void keyPressed(){

   if (key == 'o' && (isGameWin || isGameOver)){
     resetGame();
   }
 }
