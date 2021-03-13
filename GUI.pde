class GUI {
  //variables
  int currentScore = 0;
  int totalScore = 0;
  int holdScore = 0;
  int lives = 3;
  int level = 0;
  boolean start;
  PImage lives_img = loadImage("idle_s1.png");
  int size = 100;
  Bird[] birds = new Bird[5];

  //contructor
  GUI() {
  }  
  
  //display lives icons
  void displayLives() {
   loseLife();
   if (lives > 0){
     image(lives_img,0,350, size, size);
   }
   if (lives > 1){
     image(lives_img,size,350, size, size);
   }
   if (lives > 2){
     image(lives_img,2*size,350, size, size);
   }
  }
  
  //change squirrel is dead state if lose a life
  void loseLife() {
    if (lives != 0) {
      if (s1.isDead == true) {
        s1.isDead = false;
        lives -=1;
      }
    }
    else {
      s1.isDead = true;
    }
  }
  
  //TODO
  //calc score based on birds hit
  void calcScore() {
    if (level == 0 || buttons.passed1 == false) {
      currentScore = holdScore-2;
    }
    else if (level == 1 && buttons.passed1 || buttons.passed2 == false) {
      currentScore = holdScore-1;
    }
    else if (level == 2 && buttons.passed2) {
      currentScore = holdScore;
    } 
    else if (level == 3) {
      currentScore = holdScore-5;
    }
    if (b1.isDead) {
     birds[0] = null;  
    }
    if (b2.isDead) {
     birds[1] = null;  
    }
    if (b3.isDead) {
     birds[2] = null;  
    }
    if (b4.isDead) {
     birds[3] = null;  
    }
    if (b5.isDead) {
     birds[4] = null;  
    }
    for (int i=0; i<5; i++) {
     if (birds[i] == null) {
       currentScore += 1;
     }
    }
  }
  
  //check win
  boolean lose() {
   if (lives == 0) {
     return true;
   }
   return false;
  }
  
  void levelOne(){
    b1.isDead = false; 
    b2.isDead = false;
    b3.isDead = false;
    b4.isDead = true;
    b5.isDead = true;
  }
  
  void levelTwo(){
    gui.birds[0] = b1;
    gui.birds[1] = b2;
    gui.birds[2] = b3;
    gui.birds[3] = b4;
    gui.birds[4] = b5;
    b1.isDead = false; 
    b2.isDead = false;
    b3.isDead = false;
    b4.isDead = false;
    b5.isDead = true;
    gui.holdScore = 3;
  }
  
  void levelThree(){
    gui.birds[0] = b1;
    gui.birds[1] = b2;
    gui.birds[2] = b3;
    gui.birds[3] = b4;
    gui.birds[4] = b5;
    b1.isDead = false; 
    b2.isDead = false;
    b3.isDead = false;
    b4.isDead = false;
    b5.isDead = false;
    gui.holdScore = 7;
  }
  
}
