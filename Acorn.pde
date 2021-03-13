class Acorn extends Squirrel{
  //variables
  int ax = 100;
  int ay = 100;
  int vy;
  int a_size;
  PImage acorn_image = loadImage("acorn_img.png");
  boolean holding = false;
  boolean inAir = true;
  float angle;
  
  //constructor
  Acorn(int _x, int _y, int _vx, int _size, int _ax, int _ay, int _vy, int _a_size) {
    super(_x, _y, _vx, _size);
    ax = _ax;
    ay = _ay;
    vy = _vy;
    a_size = _a_size;
  }
  
  //display acorn depending on state
  void display(){
    //image(acorn_image, ax, ay, a_size, a_size);
    if (keyPressed) {
      keyPressed();
    }
    //is holding
    if (holding){
      ax = s1.x + 80;
      ay = s1.y + 60;
      image(acorn_image, ax, ay, a_size, a_size);
    }
    //on ground
    if (ay >= (height - 140) && vy > 0){
      vy = 0;
      ay = height - 140;
      image(acorn_image, ax, ay, a_size, a_size);
      inAir = false;
    }
    //in air
    else if (inAir){
      vy += 1;
      ay += vy;
      pushMatrix();
      translate(ax, ay);
      rotate(angle);
      image(acorn_image, 0, 0, a_size, a_size);
      popMatrix();
      angle += 0.08;
    }
    else{
      image(acorn_image, ax, ay, a_size, a_size);
    }
  }
  
  //checks if squirrel picked up acorn
  boolean checkPickup(){
    if (inAir == false && (ax - s1.x < 175 && ax - s1.x > 0)){
      return true;
    }
    return false;
  }
    
   
  //space to shoot, down arrow to pick up acorn
  void keyPressed() {
    if (key == ' ' && holding == true) {
      inAir = true;
      vy = -39;
      holding = false;
      } 
    if (key == CODED) {
      if (keyCode == DOWN && checkPickup() == true) {
        // put picked coin echo here
        holding = true;
      }
    }
  }  
  
}
