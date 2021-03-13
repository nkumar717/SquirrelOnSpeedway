//cite: https://opengameart.org/content/bird-and-explosion

class Bird {
  //variables
  int x;  int y;
  int speed;
  int size = 75;
  Boolean isDead = false;
  
  //timer
  int animationTimer;
  int animationTimerValue = 100;
  int currentFrame;
  
  //sprites
  PImage[] birds;
  
  //poop
  int px = x+(size/2);
  int py = y+size;
  int gravity = 8;
  int psize = 20;
  
  //constructor
  Bird(int _x, int _y, int _speed) {
    x = _x;
    y = _y;
    speed = _speed;
  }
  
  void loadSprites() {
    //load sprites into bird array
    birds = new PImage[4];
    for (int i = 0; i < 4; i++) {
      String fname = "bird" + nf(i+1) + ".png";
      birds[i] = loadImage(fname);
    }
  }
    
  void alive() {
    //increase x position based on speed
    checkBoundary();
    x += speed;
    
    //display going left or right 
    if (speed > 0) {
      image(birds[currentFrame],x,y,size,size);
      poopFall();
    }
    else {
      pushMatrix();
      scale(-1.0,1.0);
      image(birds[currentFrame],-x,y,-size,size);
      popMatrix();
      poopFall();
    }
    
    //iterate frame (timer)
    if ((millis()-animationTimer) >= animationTimerValue) {
      currentFrame = (currentFrame+1)%4;
      animationTimer = millis();
    }
  }
  
  void poopFall() {
    fill(255);
    ellipse(px,py,psize,psize);
    py += gravity;
  }
  
  //check if past boundary
  void checkBoundary() {
    if ((x+size+speed) >= width  || x < 0) {
      speed = speed * -1;
    }
    if (py >= height-50) {
      py = y+size;
      px = x+(size/2);
    }
  }
  
  //check if hit by acorn; pass in acorn location
  Boolean hit (int ax, int ay) {
    if ((ax > x) && (ax < x+size) && (ay < y+size) && isDead == false){
      // put cork here
      isDead = true;
      gui.totalScore += 1;
      return true;
    }
    return false;
  }
  
    
}
  
