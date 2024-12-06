class Obstacle {
  PVector position;
  float width, height;
  float obstacleSpeed = 5; 
  boolean passed = false; // mark the ibstacle pss or not
  
  Obstacle(PVector pos, float w, float h){
  position = pos;
  width = w;
  height = h;
  }
  
  void update(){
    position.x -= obstacleSpeed;
     }
 void display( PImage obstacleA) {
   image( obstacleA, position.x, position.y, width, height);
  }
}
