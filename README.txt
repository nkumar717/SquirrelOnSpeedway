To run our program, simply open "IfStatementAbusers_finalproject.pde" and run the program.

The Scenes we have included are as follows -

[Main Menu]
Serves as the main menu for our game.
(Button) Start Game - Begins the game, prompts the player to enter a username.
(Button) High Scores - Reads data from scores.csv and displays the top 5 scores.
(Button) Exit - Exits the program.


[High Scores]
Displays the top 5 scores from scores.csv
(Button) Back - Sends the player back to the main menu.


[Enter Name]
Player will type in the name they want their score to be stored under.
Player hits BACKSPACE to remove the last character in their name.
Player hits ENTER to finalize their name and begin playing.
(Button) Back - Sends the player back to the main menu.


[In Game]
This scene is our actual game. Description of the game can be found in the project description.
(Button) Restart - Resets the game back to level 1 with a score of 0 and 3 lives.
(Button) Exit - Sends the player back to the main menu and saves the players score in scores.csv.


[In-Between Levels]
Once the player has beaten a level they will be prompted with a button to continue to the next level.
(Button) Level (2/3) - Clicking this enters the player into the next level.

[Upon Completing Level 3]
Once the player has beated level 3, they will have a choice to continue playing or exit and save their
score. The player may play the game as many times as they wish until their lives hit 0.
(Button) Continue - Restarts the game back at level 1, score and lives remain unchanged.
(Button) End Game - Sends the player back to the main menu and saves the players score in scores.csv.

[Persistent Buttons]
In every scene there will be mute/unmute buttons that allow the player to control the music.


The controls for our game are as follows -

Left arrow key - Move left
Right arrow key - Move right
Down arrow key - Pick up the acorn
Space bar - Throw the acorn straight up at the birds.


The GUI keeps track of the player's lives and score during the game.