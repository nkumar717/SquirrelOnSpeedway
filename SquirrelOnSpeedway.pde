//initialize variables
Bird b1;
Bird b2;
Bird b3;
Bird b4;
Bird b5;
PImage menu;
PImage scene;
PImage mute;
PImage unmute;
Squirrel s1;
Acorn a1;
GUI gui;
Button buttons;
PFont courier; 
Table highScores;
IntDict scores;
int finalscore;
boolean scoreSave = false;


import processing.sound.*;
  
SoundFile file;
String audioName = "mushroom.wav";
String path;

void setup() {
  size(1000,900);
  
  // Read the .csv data
  highScores = loadTable("scores.csv","header");
  readScores();

  menu = loadImage("Menu.png");
  scene = loadImage("scene.png");
  
  //sound
  mute = loadImage("mute.png");
  unmute = loadImage("unmute.png");
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.amp(1);
  file.loop();

  //create Bird object
  b1 = new Bird(int(random(50,900)),0,4);
  b2 = new Bird(int(random(500,300)),100,5);
  b3 = new Bird(int(random(200,900)),200,-4);
  b4 = new Bird(int(random(400,700)),300,-6);
  b5 = new Bird(int(random(20,800)),400,8);
  
  //call load sprites function
  b1.loadSprites();
  b2.loadSprites();
  b3.loadSprites();
  b4.loadSprites();
  b5.loadSprites();
  
  //create Squirrel object
  s1 = new Squirrel(width/2,height - 180,0, 200);
  s1.loadSprites();
  
  //create Acorn object
  a1 = new Acorn(width/2,height - 180,0, 200, width - 200, height - 310, 5, 35);

  //gui
  gui = new GUI();
  gui.birds[0] = b1;
  gui.birds[1] = b2;
  gui.birds[2] = b3;
  gui.birds[3] = b4;
  gui.birds[4] = b5;
  
  //buttons
  buttons = new Button();
  //text 
  courier = createFont("Courier",32);
  textFont(courier);
  textSize(24);
}

void draw() {
  // Begin at the main menu
  if (buttons.start == false && buttons.highScore == false && buttons.createName == false) {
    image(menu,0,0);
    buttons.display_menu();
    buttons.music_buttons();
  }
  // User clicks high score, display high scores
  else if (buttons.highScore == true) {
    readScores();
    background(245);
    buttons.display_highScores();
    buttons.music_buttons();
  }
  else if (buttons.createName == true) {
    background(245);
    buttons.display_name_creation();
    buttons.music_buttons();
  }
  // User clicks start, begins the game.
  else {
    image(scene,0,0);
    buttons.display_game();
    
    //text
    fill(0);
    text("Restart",60,530);
    text("Exit",81,580);
    //text("Mute",55,630);
    text("Lives:",10,370);
    text("Score: " + gui.totalScore,10,340);
    
    //user ends the game
    if (buttons.endGame){ 
      readScores();
      updateScores();
      buttons.reset();     
      buttons.endGame = false;
    }
    if (gui.lose()){
      text("GAME OVER",width/2,height/2); 
      readScores();
      updateScores();
    }
 
    //display lives and score gui
    gui.displayLives();
    gui.calcScore();
    
    //display birds as long as alive
    if (b1.hit(a1.ax,a1.ay)== false && b1.isDead == false) {
        b1.alive();
    }
    if (b2.hit(a1.ax,a1.ay)== false && b2.isDead == false) {
        b2.alive();
      }
    if (b3.hit(a1.ax,a1.ay)== false && b3.isDead == false) {
        b3.alive();
      }
    if (b4.hit(a1.ax,a1.ay)== false && b4.isDead == false) {
        b4.alive();
      }
    if (b5.hit(a1.ax,a1.ay)== false && b5.isDead == false) {
        b5.alive();
      }
      
    //levels based on current score
    if (gui.currentScore == -2) {    //lvl1
      gui.levelOne();
    }
    else if (gui.currentScore == 3) {    //lvl2
      gui.holdScore=3;
      gui.level = 1;
    }
    else if (gui.currentScore == 7) {    //lvl3
      gui.holdScore=7;
      gui.level = 2;
    }
    else if (gui.currentScore >= 12) {
      gui.holdScore=12;
      gui.level = 3;
    }
  
    //display squirrel and acorn as long as its alive
    if (s1.isDead == false) {
       s1.display();
       a1.display();
       //check if squirrel got hit by poop
       s1.gotHit(b1.px,b1.py);
       s1.gotHit(b2.px,b2.py);
       s1.gotHit(b3.px,b3.py);
       s1.gotHit(b4.px,b4.py);
       s1.gotHit(b5.px,b5.py);
    }   
    }
}

//keypressed for user entering name
void keyPressed() {
  if (buttons.createName == true) {
    if (key == '\n' ) {
    buttons.nameVariableSaved = buttons.nameVariableTyping;
    buttons.nameVariableTyping = ""; 
    buttons.start = true;
    buttons.createName = false;
    } 
    else if (key == BACKSPACE && buttons.nameVariableTyping.length() > 0) {
        buttons.nameVariableTyping = buttons.nameVariableTyping.substring(0,buttons.nameVariableTyping.length()-1);
      }
    else {
      buttons.nameVariableTyping = buttons.nameVariableTyping + key; 
    }
  }  
}

void updateScores() {
  finalscore = gui.totalScore;
  TableRow newRow = highScores.addRow();
  newRow.setString("Name", buttons.nameVariableSaved);
  newRow.setInt("Score", finalscore);

  if (scoreSave == false) {
    saveTable(highScores, "data/scores.csv");
    scoreSave = true;
  }
}

void readScores() {
 // Create dictionary for the data
  scores = new IntDict();
  // Add data into the dictionary
  for (TableRow row : highScores.rows()) {
    
    String name = row.getString("Name");
    int score = row.getInt("Score");
    
    scores.set(name,score);
  }
  scores.sortValuesReverse(); 
}
