class character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  int maxJumpCount = 2;
  int currentJumpCount = 0;
  
  character(float x, float y, float vx, float vy, float ax, float ay) {
   position = new PVector (x, y);
   velocity = new PVector (vx, vy);
   acceleration = new PVector (ax, ay);
  }
 void display(){
   image(character, position.x, position.y, 30, 30);
 }
 
 void update(){
   position. add(velocity);
   velocity. add(acceleration);
   if( position.y >= groundY - 30 + 100){
     position.y = groundY - 30 + 100;
     currentJumpCount = 0;
     velocity.y = 0;
   }
    if (key == ' ' && currentJumpCount < maxJumpCount && !isGameOver && !isGameWin) {
     velocity.y = jumpPower;
     currentJumpCount ++;
     
     }
   }
 }
  
