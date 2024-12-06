//declair the two main varibles
character characterBai;
Obstacle obstacle;

// images will be imported to this project
PImage Background;
PImage character;
PImage mainMenu;
PImage obstacleA;

// ground and jump
float groundY = 450;
float gravity = 1;
float jumpPower = -15;
// score
int score = 0;

//Set the boolean expressions
boolean isGameWin = false;//Game over? game win??
boolean isGameOver = false;
boolean isOnMainPage = true;

// array list for obstacles
ArrayList<Obstacle> obstacles = new ArrayList< Obstacle> ();

//---------------------basic-------------------------------
void setup() {
  size(680, 500); //initial canvas size set to 680, 500

  //load image ot this project
  Background = loadImage ("background.png");
  character = loadImage("Character.png");
  mainMenu = loadImage ("Main menu.png");
  obstacleA = loadImage("ob1.png");

  //the initial position of character. I would be able to change characters position in this line
  //based on the function set in character class
  characterBai = new character(100, 350, 0, -15);

  resetGame(); //make sure the game resets when meeting certain conditions
}

void draw() {
  if (isOnMainPage) {
    background(135, 206, 235); //showing the main menu
    //here is the design of the main menu
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Welcome to the Game", width / 2, height / 4);

    image (mainMenu, 0, 0, width, height);
    fill (245, 215, 229);
    rect (width / 2 - 75, height / 2, 150, 50);
    fill (255);
    textSize (50);
    text ("START", 340, 275);
  } else {
    image( Background, 0, 0, width, height);

    // obstacle will be updated here
    updateObstacles();
    for (Obstacle obs : obstacles) {
      obs.display(obstacleA);
    }
    //update the character
    characterBai.update();
    characterBai.display(character);

    // text
    fill (255);
    textSize (20);
    text ("SCORE:" + score, 450, 20);

//---------------------boolean statements-------------------------------//

    //here are the conditions that need to be set using boolean expression
    // HOW CAN LET THE GAME WIN??
    if (score >= 20) {
      isGameWin = true;
    }
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
}

//---------------------key inputs-------------------------------//

//Here are the key and mouse inputs
// key press
void keyPressed() {
  characterBai.characterControl(key, true);
}
void keyReleased() {
  if (key == '0' && (isGameOver || isGameWin)) {
    resetGame();
  }
}
// mouse press
void mousePressed() {
  if (isOnMainPage && mouseX > width / 2 - 75 && mouseX < width / 2 + 75 &&
    mouseY > height / 2 && mouseY < height / 2 + 50) {
    isOnMainPage = false;
  }
}

// Reset the game
void resetGame() {
  isGameWin = false;
  isGameOver = false;
  score = 0;
  
  // character's position on the ground
  characterBai = new character(100, groundY - 80, 0, 0);

  // obstacles
  obstacles = new ArrayList<Obstacle> ();
  for (int i = 0; i <200; i++) {
    obstacles. add(new Obstacle(new PVector(width + i * 200, groundY - random(30, 80) + 10),
      random(20, 50), random(30, 80)));
  }
}

//update obstacle
void updateObstacles() {
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle obs = obstacles. get(i);
    obs.update();

    if (characterBai.position.x + 30 > obs. position.x && characterBai.position.x < obs. position.x + obs. width &&characterBai.position.y + 30 > obs. position.y && characterBai.position.y < obs. position.y + obs. height) {
      isGameOver = true;
    }
    
if (obs.position.x + obs.width < 0) {
  obs.position.x = -1000;  // Move the obstacle off-screen
  score=score+1;  // Increase score
}

  }
  if (obstacles.size() < 3) {
    obstacles.add(new Obstacle(new PVector(width + random(100, 300), groundY - random(30, 80) + 100), random(20, 50), random(30, 80)));
  }
}
