class character{
  PVector position; 
  PVector velocity;
  float width = 80, height = 80; 
  
  float JumpHeight = -15;
  int maxJumpCount = 2; 
  int currentJumpCount = 0;
  
  character(float x, float y, float vx, float vy, float ax, float ay) {
   position = new PVector (x, y);
   velocity = new PVector (vx, vy);
  }
   void update(){
   position. add(velocity);
   velocity.y += gravity;
   
   if( position.y >= groundY - height){
     position.y = groundY - height;//make sure the chatacter is on the ground
     velocity = 0;// stop falling
     currentJumpCount = 0; // Reset jump count when on the ground
   }
 }
// inplement the character
  void display(PImage characterImage) {
    image(characterImage, position.x, position.y, width, height);  // 绘制角色图像
  }

  // 跳跃控制
  void characterControl(char key, boolean isPressed) {
    if (key == ' ' && isPressed && currentJumpCount < maxJumpCount) {
      velocity.y = jumpPower;
      currentJumpCount++;
    }
  }
}
