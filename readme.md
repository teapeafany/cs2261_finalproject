
## 🎮 How to Play (UPDATED TO M03!!!)

- Use the **ARROW KEYS** to move the player character.
- Press **START** to pause or resume the game.
- Press **SELECT** to skip to the boss room (for testing).
- Defeat the boss to win the game!
    - Press **BUTTON B** to attack within the boss room
    - he will chase after you in you are out of range and attack at different speeds (randomized).
- You lose if your HP drops to zero.
- You win if you deplete the boss's HP before it gets you. 
    - Press **BUTTON A** to swap to unlocked characters (and swap back) after you win! They also have different attack sets

## 🗺️ Game States and Requirements

The game consists of the following states:
- `START`: Title screen
    -includes  **parallax bgs**! two moving bg layers at diff speeds and  **sprite** of Mu Sheng and Miao Miao together! 
    -also small **tilemap modification** when pressing SELECT. star appears.
    -looping sound from cdrama ost begins playing!!
    

- `INSTRUCTIONS`: Gives all the button instructions
- `GAME1`: Main exploration town **sprite** of Miao Miao (with animation)
- `BOSS1`: Boss battle with samurai protect the memory flowers. 
    - **boss sprite** with attack animation
- `PAUSE`: Pause screen with resume/start logic
- `WIN`: Win screen
- `LOSE`: Lose screen

