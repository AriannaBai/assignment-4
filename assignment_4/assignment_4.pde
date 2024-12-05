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
