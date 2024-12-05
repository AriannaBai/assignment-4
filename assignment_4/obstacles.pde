class Obstacle {
  PVector position;
  float width, height;
  boolean passed = false; 
  Obstacle(PVector position, float width, float height){
  }
  
  void update(){
    position.x -= obstacleSpeed;
    image(obstacleA, position.x, position.y, width, height);
  }
}
