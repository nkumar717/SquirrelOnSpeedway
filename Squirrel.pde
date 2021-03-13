class Squirrel {
  //variables
  int x = 400;  
  int y = 400;
  int size = 200;
  int vx = 0;
  String facing = "left";
  
  //sprites
  PImage[] running_squirrel;
  PImage[] idle_squirrel;
  
  int animationTimer1;
  int animationTimerValue1 = 100;
  int currentFrame1;
  
  int animationTimer2;
  int animationTimerValue2 = 100;
  int currentFrame2;
  
  boolean isDead = false;
  
  //constructor
  Squirrel(int _x, int _y, int _vx, int _size) {
    x = _x;
    y = _y;
    vx = _vx;
    size = _size;
  }
  
  void display(){
    checkBoundaries();
    if (keyPressed){
      keyPressed();
      if ((millis()-animationTimer1) >= animationTimerValue1) {
        currentFrame1 = (currentFrame1+1)%5;
        animationTimer1 = millis();
      }
      if (vx > 0){
        pushMatrix();
        scale(-1,1);
        image(running_squirrel[currentFrame1], -x, y, -200, 200);
        popMatrix();        
      }
      else{
        image(running_squirrel[currentFrame1], x, y, 200, 200);
      }
    }
    else {
      vx = 0;
      if ((millis()-animationTimer2) >= animationTimerValue2) {
        currentFrame2 = (currentFrame2+1)%2;
        animationTimer2 = millis();
      }
      if (facing == "left") {
        image(idle_squirrel[currentFrame2], x, y, 200, 200); 
      } else {
        pushMatrix();
        scale(-1,1);
        image(idle_squirrel[currentFrame2], -x, y, -200, 200);
        popMatrix();
      }
    }
  }

  void checkBoundaries(){
    if (x < 5){
        x = 5;
      }
      else if (x > 835){
        x = 835;
      }
    }
  
  void loadSprites() {
    //load sprites
    running_squirrel = new PImage[5];
    for (int i = 0; i < running_squirrel.length; i++){
      String imageName = "run_s" + nf(i+1) + ".png";
      running_squirrel[i] = loadImage(imageName);
    }
    idle_squirrel = new PImage[2];
    for (int i = 0; i < idle_squirrel.length; i++){
      String imageName = "idle_s" + nf(i+1) + ".png";
      idle_squirrel[i] = loadImage(imageName);
    }
  }
 
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        vx = -5;
        x += vx;
        facing = "left";
      } 
      else if (keyCode == RIGHT) {
        vx = 5;
        x += vx;
        facing = "right";
    }
  }
  }
  
  void gotHit(int px, int py) {
   if (px >= (x+50) && px <= (x+size-40) && py >= (y+130)) { 
     // put bad sound # 1 here
     isDead = true;
   }
  }
  
  
}
