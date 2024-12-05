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
 
 //Game over? game win??
  boolean isGameWin = false;
  boolean isGameOver = false;
  
  // obstacles
  ArrayList<Obstacle> obstacles = new ArrayList< Obstacle> ();
  float obstacleSpeed = 5;
  
  //character
  character characterBai;
  
//---------------------basic-------------------------------
void setup() {
  size(680, 500); //initial canvas size set to 680, 500
  
  //load image
  Background = loadImage ("background.png");
  character = loadImage("Character.png");
  mainMenu = loadImage ("Main menu.png");
  obstacleA = loadImage("ob1.png");
  
  characterBai = new character(100, 350, 0, -15, 0, 1);
  
  resetGame();
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
  text ("START", 270, 290);
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
 image (character, characterBai.position.x, characterBai.position.y);
 
 characterBai.update();
}
 

 
 // key press
 void keyPressed(){
  if (key == 'o' && (isGameWin || isGameOver)){
     resetGame();
   }
 }
 
// mouse press
void mousePressed() {
  if (isOnMainPage && mouseX > width / 2 - 75 && mouseX < width / 2 + 75 && mouseY > height / 2 && mouseY < height / 2 + 50){
    isOnMainPage = false;
  }
}
 // Reset the game
 void resetGame(){
   isGameWin = false;
   isGameOver = false;
   characterBai.velocity.y = 0;
   currentJumpCount = 0;
   obstacleSpeed = 5;
   score = 0;
   
   //obstacle uodate
   obstacles.clear();
   for (int i = 0; i < 3; i++) {
     obstacles.add(new Obstacle(new PVector(width + i * 200, groundY - random(30, 80) + 100), random(20, 50), random(30, 80)));
   }
 }
   //update obstacle
   void updateObstacles() {
     for (int i = obstacles.size() - 1; i >= 0; i--) {
       Obstacle obs = obstacles. get(i);
       obs. update();
      if (characterBai.position.x + 30 > obs. position.x 
      && characterBai.position.x < obs. position.x + obs. width && 
      characterBai.position.y + 30 > obs. position.y &&
      characterBai.position.y < obs. position.y + obs. height) {
        isGameOver = true;
      }
     if (obs.position.x + obs. width <0) {
       obstacles. remove(i);
       score ++;
     }
    }
    if (obstacles.size() < 3) {
      obstacles.add(new Obstacle(new PVector(width + random(100, 300), groundY - random(30, 80) + 100), random(20, 50), random(30, 80)));
    }
   }
       
