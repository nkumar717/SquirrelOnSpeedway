class Button {
  //variables
 color c1 = color(60,230,70);
 color c2 = color(255,100,100);
 color c3 = color(255);
 boolean passed1 = false;
 boolean passed2 = false;
 boolean start = false;
 boolean highScore = false;
 boolean createName = false;
 boolean continueGame = false;
 boolean endGame = false;
 int count = 0;
 String[] highScore_names = new String[5];
 int[] highScore_scores = new int[5];
 String nameVariableTyping = "";
 String nameVariableSaved = "";

 
 
 //constructor
 Button() {}
 
 //display main menu
 void display_menu() {
   click();
   //start button
   fill(255);
   rect(400,250,200,60);
   fill(0);
   text("Start Game", 430, 285);
   if (onRect(400,250,200,60) == true) {
     fill(220);
     rect(400,250,200,60);
     fill(0);
     text("Start Game", 430, 285);
   }
   //high scores
   fill(255);
   rect(400,360,200,60);
   fill(0);
   text("High Scores", 427, 395);
   if (onRect(400,360,200,60) == true) {
     fill(220);
     rect(400,360,200,60);
     fill(0);
     text("High Scores", 427, 395);
   }
   //exit program
   fill(255);
   rect(400,470,200,60);
   fill(0);
   text("Exit", 473, 508);
   if (onRect(400,470,200,60) == true) {
     fill(220);
     rect(400,470,200,60);
     fill(0);
     text("Exit", 473, 508);
   }
 }
 
 void display_name_creation(){
   textSize(32);
   fill(0);
   text("Enter name: " + nameVariableTyping,25,190);
   //back button
   textSize(36);
   fill(255);
   rect(width-300,height-120,200,60);
   fill(0);
   text("Back", width-245, height-80);
   if (onRect(width-300,height-120,200,60)) {
     fill(210);
     rect(width-300,height-120,200,60);
     fill(0);
     text("Back", width-245, height-80);
   }
   textSize(24);
}
   
   
 // display high scores.
 void display_highScores() {
   
   click();
   textSize(64);
   fill(0);
   text("High Scores",width/2-215,height/2 - 250);  //title
   //back button
   textSize(36);
   fill(255);
   rect(width-300,height-120,200,60);
   fill(0);
   text("Back", width-245, height-80);
   if (onRect(width-300,height-120,200,60)) {
     fill(210);
     rect(width-300,height-120,200,60);
     fill(0);
     text("Back", width-245, height-80);
   }
   textSize(24);

   for (String v : scores.keys()) {
    if (count <= 4) {
     highScore_names[count] = v;
     highScore_scores[count] = scores.get(v);
    }
    count++;
   }
   
   text(highScore_names[0],320,300);
   text(highScore_names[1],320,380);
   text(highScore_names[2],320,460);
   text(highScore_names[3],320,540);
   text(highScore_names[4],320,620);
   text(highScore_scores[0],600,300);
   text(highScore_scores[1],600,380);
   text(highScore_scores[2],600,460);
   text(highScore_scores[3],600,540);
   text(highScore_scores[4],600,620);
   
 }
 
 void music_buttons() {
   click();
   //sound
   fill(255, 241, 80);
   rect(850,850,58,40); //mute
   fill(255, 241, 80);
   rect(912,850,58,40); //unmute
   image(mute,852,854, 58, 35);
   image(unmute,924,857, 32, 30);
 }
 
 //display buttons in the game
 void display_game() {
   click();
   fill(c1);
   rect(50,500,120,40); //restart
   fill(c2);
   rect(50,550,120,40); //end game for gui
   
   //sound
   fill(255, 241, 80);
   rect(50,600,58,40); //mute
   fill(255, 241, 80);
   rect(112,600,58,40); //unmute
   image(mute,52,604, 58, 35);
   image(unmute,124,607, 32, 30);
   
   if (gui.level == 1 && passed1 == false) {
     fill(c3);
     rect(500,500,120,40);
     fill(0);
     text("Level 2",510,530);
   }
   if (gui.level == 2 && passed2 == false) {
     fill(c3);
     rect(500,500,120,40);
     fill(0);
     text("Level 3",510,530);
   }
   if (gui.level == 3 && passed2 == true) {
     fill(c3);
     rect(500,500,150,40);
     rect(500,560,150,40);
     fill(0);
     text("Continue",510,530);
     text("End Game",510,590);
   }
 }
  
 //mouse pressed function
 void click() {
   if (mousePressed == true && mouseButton == LEFT) {
     if (start == true && onRect(50,500,120,40)) {  //restart
       reset();
     }
     if (start == true && onRect(50,550,120,40)) {  //exit
        updateScores();
        endGame = true;
        start = false;
        highScore = false;
        createName = false;
     }
     //sound
     if (start == true && onRect(50,600,58,40)) {  //mute
       file.amp(0);
     }
     if (start == true && onRect(112,600,58,40)) {  //unmute
       file.amp(1);
     }
     if (start == false && onRect(850,850,58,40)) {  //mute
       file.amp(0);
     }
     if (start == false && onRect(912,850,58,40)) {  //unmute
       file.amp(1);
     }
     //levels
     if (gui.level == 1 && passed1 == false && onRect(500,500,120,40)) {
        gui.levelTwo(); 
        passed1 = true;
     }
     if (gui.level == 2 && passed2 == false && onRect(500,500,120,40)) {
        gui.levelThree(); 
        passed2 = true;
     }
     if (gui.level == 3 && passed2 == true && onRect(500,500,150,40)) {
        continueGame(); 
     }
     if (gui.level == 3 && passed2 == true && onRect(500,560,150,40)) {
        endGame = true;
        start = false;
        highScore = false;
        createName = false;
     }
     //main menu
     if (start == false && onRect(400,250,200,60)) {
       createName = true;
     }
     if (highScore == false && onRect(400,360,200,60)) {
       highScore = true;
     }
     //backbutton
     if(highScore == true && onRect(width-300,height-120,200,60)) {
       highScore = false;
     }
     if(createName == true && onRect(width-300,height-120,200,60)) {
       createName = false;
     }
     if (start == false && highScore == false && createName ==false && onRect(400,470,200,60)) {
       exit();
     }
   }
 }
 
 //check is mouse on button
 boolean onRect(int x, int y, int w, int h) {
  if  (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    return true;
  }
  else {
    return false;
  }
 }
 
 //restart game
 void reset() {
   gui.totalScore = 0;
   a1.holding = false;
   gui.holdScore = 0;
   gui.lives = 3;
   gui.level = 0;
   b1.isDead = false;
   b2.isDead = false;
   b3.isDead = false;
   b4.isDead = true;
   b5.isDead = true;
   s1.isDead = false;
   gui.birds[0] = b1;
   gui.birds[1] = b2;
   gui.birds[2] = b3;
   gui.birds[3] = b4;
   gui.birds[4] = b5;
   passed1 = false;
   passed2 = false;
 }
  
  void continueGame() {
   a1.holding = false;
   gui.holdScore = 0;
   gui.level = 0;
   b1.isDead = false;
   b2.isDead = false;
   b3.isDead = false;
   b4.isDead = true;
   b5.isDead = true;
   gui.birds[0] = b1;
   gui.birds[1] = b2;
   gui.birds[2] = b3;
   gui.birds[3] = b4;
   gui.birds[4] = b5;
   passed1 = false;
   passed2 = false;
  }
  
}
