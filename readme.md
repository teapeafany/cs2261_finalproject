
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
    -includes  **parallax bgs**! two moving bg layers at diff speeds and a draft **sprite** of Mu Sheng and Miao Miao together! 
    -also small **tilemap modification** when pressing SELECT. flower appears.
    -looping sound from cdrama ost begins playing!!
    

- `INSTRUCTIONS`: Gives all the button instructions
- `GAME1`: Main exploration town
    - draft **sprite** of Miao Miao (with attack animation)
    - after win, draft **sprite** of Mu Sheng unlocked (with attack animation)
- `BOSS1`: Boss battle
    - **boss sprite** with attack animation
- `PAUSE`: Pause screen with resume/start logic
- `WIN`: Win screen
- `LOSE`: Lose screen

**note: i was going to polish up the parallax backgrounds and sprites with better art but was down with a fever in the middle of this week and didn't have the time TT sorry the assets are so wack!**

