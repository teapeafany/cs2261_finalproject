 #include "gba.h"
#include <stdlib.h>
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "intro.h"

//town bg
#include "tilesetfaketown.h"
#include "town1fake.h"

//spritesheet
#include "spritesheetm3.h"

//states bg
#include "pause.h"
#include "win.h"
#include "lose.h"

//bossrooms bg
#include "bossroom1.h"
#include "bossmovement.h"

//collision maps
#include "MAP1col.h"
#include "map2col.h"

//instructions bg
#include "instructions.h"

//bg for parallax tiles
//the tilesets
#include "1bubble.h"
#include "2cloud.h"
#include "3back.h"
//the tilemaps
#include "background.h"
#include "cloudforeground.h"
#include "starforeground.h"

//reference
#include "gardenTiles.h"
#include "myGarden.h"
#include "myClouds.h"

//sound
#include "digitalSound.h"
#include "play.h"
#include "surge.h"  // Looping background music
#include "analogSound.h"

void playPauseSound() {
    playAnalogSound(7);
}




void setupInterrupts();
void interruptHandler();


//tileid for tilemap mod
enum {SUNID = 6, FLOWERID = 12} tileid;

//define var for hscroll
int hScroll;


#define MAPWIDTH 256
#define MAPHEIGHT 256


OBJ_ATTR shadowOAM[128];


// state prototypes
void goToStart();
void goToMap();
void goToInstructions();
void goToGame1();
void goToBoss1();
void goToPause();
void goToWin();
void goToLose();

void start();
void game1();
void pause();
void win();
void lose();


// game states
enum {START, INSTRUCTIONS, GAME1, BOSS1, PAUSE, WIN, LOSE};
int state;


SPRITE player;
SPRITE bossEntrance;
BOSS waterBoss;
SPRITE startsprite;
typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;

//characters unlocked
int muShengUnlocked = 0;
int currentCharacter = 0;

// buttons
unsigned short buttons;
unsigned short oldButtons;

//voffhoff
int hOff;
int vOff;

//prevstate tracker
int prevState; //0 for game1, 1 for boss1

/*
inline unsigned char colorAt(int x, int y) {
    if (state == GAME1) {
        return ((unsigned char*) MAP1colBitmap)[OFFSET(x, y, MAPWIDTH)];
    } else if (state == BOSS1) {
        return ((unsigned char*) map2colBitmap)[OFFSET(x, y, MAPWIDTH)];
    }
}
    */

int main() {
    initSound();
    initialize(); 
    state = START;


   while (1) {
    oldButtons = buttons;
    buttons = REG_BUTTONS;
    switch (state) {
        case START:
            drawstartsprite();
            start();
            updatestart();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME1:
            game1();
            break;
        case BOSS1:
            boss();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;  
    }

}
}



void initialize() {
    
    setupSounds();
    setupInterrupts();
    buttons = REG_BUTTONS;
    oldButtons = 0;

    init();
    goToStart();
    
}

void goToStart() {

    hideSprites();

    REG_DISPCTL = MODE(0) | BG_ENABLE(0);


    // FIXME 3.1: Now we need another background!
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    // TODO 1.2: Set up our background 0 controls
    // FIXME 3.2: Set BG priority...How can we set priority without a macro?
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | 1;


    // TODO 1.3: DMA the background palette, tileset, and tilemap
    DMANow(3, gardenTilesPal, BG_PALETTE, gardenTilesPalLen / 2);
    DMANow(3, gardenTilesTiles, &CHARBLOCK[0], gardenTilesTilesLen / 2);
    DMANow(3, myGardenMap, &SCREENBLOCK[8], myGardenMapLen / 2);


    // TODO 4.0: Add BG1 and add its background controls
    REG_BG1CNT = BG_SCREENBLOCK(10) | BG_CHARBLOCK(0) | 0;

    // TODO 4.1: DMA the clouds tilemap into BG1
    DMANow(3, myCloudsMap, &SCREENBLOCK[10], myCloudsMapLen / 2);
    //REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | SPRITE_ENABLE;
 /*
    // Set up three separate backgrounds with different charblocks and screenblocks
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_8BPP | BG_SIZE_WIDE;
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(24) | BG_8BPP | BG_SIZE_WIDE;

    // Load common background palette (assuming all BGs share palette)
    DMANow(3, _backPal, BG_PALETTE, 256);

    // Load background 0 (farthest/slowest)
    DMANow(3, _backTiles, &CHARBLOCK[0], _backTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[28], backgroundLen/2);

    // Load background 1 (middle layer - clouds)
    DMANow(3, _cloudTiles, &CHARBLOCK[1], _cloudTilesLen/2);  // Fixed to use _cloudTilesLen
    DMANow(3, cloudforegroundMap, &SCREENBLOCK[30], cloudforegroundLen/2);

    // Load background 2 (closest layer - bubbles)
    DMANow(3, _bubbleTiles, &CHARBLOCK[2], _bubbleTilesLen/2);
    DMANow(3, starforegroundMap, &SCREENBLOCK[24], starforegroundLen/2);

    // Load the player sprite
    DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
    DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);

    */
   //load a player sprite
    DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
    DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);
    
    startsprite.width = 16;
    startsprite.height = 40;
    startsprite.x = 40;
    startsprite.y = 64;


    playSoundA(surge_data, surge_length, 1);
    state = START;


}

void updatestart() {
    // TODO 2.0: Modify the tile at (15, 15) to grow a flower! 
    if (BUTTON_HELD(BUTTON_SELECT)) {
        SCREENBLOCK[8].tilemap[OFFSET(15, 15, 32)] = TILEMAP_ENTRY_TILEID(FLOWERID);
    }

    // TODO 5.2: Increment hOff
    hScroll++;

    REG_BG1HOFF = hScroll;
    REG_BG0HOFF = hScroll / 2;

}

void start() {

    // Draw everything
    drawstartsprite();
    
    // Wait for VBlank and update display
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    if (BUTTON_PRESSED(BUTTON_START)) {

        goToInstructions();
    }

}
    void goToInstructions() {
        REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, instructionsPal, BG_PALETTE, 256);

        drawFullscreenImage4(instructionsBitmap);

        hideSprites();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        waitForVBlank();

        state = INSTRUCTIONS;


    }
    void instructions() {
        waitForVBlank();

        if (BUTTON_PRESSED(BUTTON_START)) {
            goToGame1();
        }
    }

    void goToPause() {
        
        playPauseSound();
        REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, pausePal, BG_PALETTE, 256);

        drawFullscreenImage4(pauseBitmap);

        hideSprites();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        waitForVBlank();

        if (state == GAME1) {
            prevState = 0;
        } else if (state == BOSS1) {
            prevState = 1;
        }
        state = PAUSE;
    }

    void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    if (BUTTON_PRESSED(BUTTON_START) && prevState == 0) {
        goToGame1();
    }
    if (BUTTON_PRESSED(BUTTON_START) && prevState == 1) {
        goToBoss1();
    }
}


void goToWin() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, winPal, BG_PALETTE, 256);

        drawFullscreenImage4(winBitmap);

    hideSprites();
    // Wait for VBlank before copying to OAM
    waitForVBlank();
    
    // Copy the shadowOAM to the actual OAM
    DMANow(3, shadowOAM, OAM, 128 * 4);
    muShengUnlocked = 1; // Unlock Mu Sheng when player wins
    prevState = 2;
    state = WIN;
}

// run win state for each frame
void win() {
    waitForVBlank();
    prevState = 2;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame1();
        return;
    }
}


void goToLose() {

    REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


    //load the tilemap pause
    DMANow(3, losePal, BG_PALETTE, 256);

    drawFullscreenImage4(loseBitmap);

     // Clear shadow OAM
    hideSprites();
     // Wait for VBlank before copying to OAM
     waitForVBlank();
     
     // Copy the shadowOAM to the actual OAM
     DMANow(3, shadowOAM, OAM, 128 * 4);
     
     state = LOSE;
}
// run lose state for each frame

void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        
        goToStart();
        return;
    }
}


void goToGame1() {

    if (prevState == 2) {
        muShengUnlocked = 1; // Remember that Mu Sheng is unlocked
    }
    //pause state
    if (state == PAUSE) {
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
        
        //load the tilemap game1 
        DMANow(3, decor_8x8Tiles, &CHARBLOCK[0], decor_8x8TilesLen/2);
        DMANow(3, town1fakeMap, &SCREENBLOCK[28], town1fakeLen/2);
        DMANow(3, decor_8x8Pal, BG_PALETTE, 256);

        //load the player sprite - Make sure we're loading to CHARBLOCK 4
        DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
        DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);
            
        state = GAME1;
        return;
    }
    
    //set up mode0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    //in background 0 find the tilemap
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    
    //load the tilemap game1 
    DMANow(3, decor_8x8Tiles, &CHARBLOCK[0], decor_8x8TilesLen/2);
    DMANow(3, town1fakeMap, &SCREENBLOCK[28], town1fakeLen/2);
    DMANow(3, decor_8x8Pal, BG_PALETTE, 256);

    //load the player sprite - Make sure we're loading to CHARBLOCK 4
    DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
    DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);
    
    // Clear shadow OAM
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    hOff = 0;
    vOff = 0;
    
    // Initializing player sprite
    player.width = 16;
    player.height = 40;
    player.x = 40;
    player.y = 64;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 20;

    //init boss entrance
    bossEntrance.width = 16;
    bossEntrance.height = 32;
    bossEntrance.x = 200;
    bossEntrance.y = 160;

    //init waterboss
    initBoss(&waterBoss, 100, 90, 64, 64);
    
    state = GAME1; // Move this to the end of the function
}

void game1() {
    // Update game state first
    updatePlayer();
    
    // Check collision after updating player position
    //if (collision(player.x, player.y, player.width, player.height,
        //bossEntrance.x, bossEntrance.y, bossEntrance.width, bossEntrance.height)) {

        if (muShengUnlocked && BUTTON_PRESSED(BUTTON_A)) {
            // Toggle between characters (0 and 1)
            currentCharacter = (currentCharacter == 0) ? 1 : 0;
        }

    if (BUTTON_PRESSED(BUTTON_SELECT)){
        goToBoss1();
        return;  // Exit the function to prevent further processing
    }
    
    // Handle pause button only if we haven't transitioned to boss fight
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
        return;  // Exit the function after transitioning to pause
    }
    
    // Draw everything
    drawPlayer();
    drawBossEntrance();
    
    // Wait for VBlank and update display
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

}


void goToBoss1() {
    prevState = 1;
    //pause state
    if (state == PAUSE) {
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
        
        //load the tilemap bossroom 
        DMANow(3, decor_8x8Tiles, &CHARBLOCK[0], decor_8x8TilesLen/2);
        DMANow(3, bossroom1Map, &SCREENBLOCK[28], bossroom1Len/2);
        DMANow(3, decor_8x8Pal, BG_PALETTE, 256);

        //load the player sprite - Make sure we're loading to CHARBLOCK 4
        DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
        DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);
            
        state = BOSS1;
        return;
    }

    //set up mode0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    //in background 0 find the tilemap
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;


    //load the tilemap bossroom 
        DMANow(3, decor_8x8Tiles, &CHARBLOCK[0], decor_8x8TilesLen/2);
        DMANow(3, bossroom1Map, &SCREENBLOCK[28], bossroom1Len/2);
        DMANow(3, decor_8x8Pal, BG_PALETTE, 256);

        //load the player sprite - Make sure we're loading to CHARBLOCK 4
        DMANow(3, spritesheetm3Tiles, &CHARBLOCK[4], spritesheetm3TilesLen/2);
        DMANow(3, spritesheetm3Pal, SPRITE_PAL, 256);

    // Clear shadow OAM
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    hOff = 0;
    vOff = 0;

    // Initializing player sprite
    player.width = 16;
    player.height = 40;
    player.x = 100;
    player.y = 100;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 20;
    player.damageTimer = 0;

    state = BOSS1; // Move this to the end of the function
}

void boss() {
    updatePlayer();
    updateBoss(&waterBoss, &player);

    // Update damage timer if active
    if (player.damageTimer > 0) {
        player.damageTimer--;
    }


    // Check for collisions between boss and player
    if (checkBossCollision(&waterBoss, &player)) {
        // Condition 1: Boss hits player on frame 2
        if (waterBoss.currentFrame == 2 && player.damageTimer == 0) { 
            player.health -= 5; // Player loses 1 HP
            player.damageTimer = 60;
            
            // Check if player is defeated
            if (player.health <= 0) {
                player.health = 0;
                goToLose();
            }
        }
        
        // Condition 2: Player hits boss when pressing B
        if (BUTTON_PRESSED(BUTTON_B) && player.isAttacking) {
            waterBoss.lives-=5; // Directly reduce boss health instead of using damageBoss()
            
            // Check if boss is defeated
            if (waterBoss.lives <= 0) {
                goToWin();
            }
        }
    }

    drawPlayer();
    drawWaterBoss();
    
    //need to implement draw health bars.
    
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);


        if (BUTTON_PRESSED(BUTTON_START)) {
            goToPause();
        }

}


    void updatePlayer() {

        player.isAnimating = 0;
    
        int leftX = player.x;
        int rightX = player.x + player.width - 1;
        int topY = player.y;
        int bottomY = player.y + player.height - 1;
    
         // UP movement
        if (BUTTON_HELD(BUTTON_UP)) {
            player.direction = UP;
            player.isAnimating = 1;
            if (player.y > 0 ) {  // Ensure the right side is walkable
                player.y -= player.yVel;
            }
        }

        if (BUTTON_HELD(BUTTON_DOWN)) {
            player.direction = DOWN;
            player.isAnimating = 1;
            if (player.y < MAPHEIGHT - player.height ) {  
                player.y += player.yVel;
            }
        }
    
        // LEFT movement
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = LEFT;
            player.isAnimating = 1;
            if (player.x > 0 ) { // Ensure the left side is walkable
                player.x -= player.xVel;
            }
        }
    
        // RIGHT movement
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = RIGHT;
            player.isAnimating = 1;
            if (player.x < MAPWIDTH - player.width ) { // Ensure the right side is walkable
                player.x += player.xVel;
            }
        }


    // --- NEW: Trigger attack on B press ---
    if (BUTTON_PRESSED(BUTTON_B) && !player.isAttacking) {
        player.isAttacking = 1;
        
       /* player.isAttacking = 1;
        player.currentFrame = 0;
        player.timeUntilNextFrame = 5; // Faster animation for attack
        player.numFrames = 3; // You can adjust this based on your attack animation frames
        */
    }

    // Animate attack if in progress
    if (player.isAttacking) {
        if (--player.timeUntilNextFrame <= 0) {
            player.timeUntilNextFrame = 5;
            player.currentFrame++;
            if (player.currentFrame >= player.numFrames) {
                player.currentFrame = 0;
                player.isAttacking = 0; // Attack done
            }
        }
    } /* else if (player.isAnimating) {
        // Normal walking animation
        if (--player.timeUntilNextFrame <= 0) {
            player.timeUntilNextFrame = 10;
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
        }
    } else {
        player.currentFrame = 0;
    }*/

        /*
        //PLAYER ANIMATIONS!!
            if (player.isAnimating) {
                player.timeUntilNextFrame--;
                if (player.timeUntilNextFrame == 0) {
                    player.timeUntilNextFrame = 10;
                    player.currentFrame = (player.currentFrame + 1) % player.numFrames;
                }
            } else {
                player.currentFrame = 0;
                player.timeUntilNextFrame = 10;
            }
        */
        //COMPLEX MOVEMENT - center screen on player
        hOff = player.x - (SCREENWIDTH - player.width) /2;
        vOff = player.y - (SCREENHEIGHT - player.height) /2;

        if (player.x < 0) {
            player.x = 0;
        }
        if (player.y < 0) {
            player.y = 0;
        }
        if(player.x + player.width > MAPWIDTH) {
            player.x = MAPWIDTH - player.width;
        }
        if(player.y + player.height > MAPHEIGHT) {
            player.y = MAPHEIGHT - player.height;
        }

        if (hOff < 0) {
            hOff = 0;
        }
        if (vOff < 0) {
            vOff = 0;
        }
        //restrict camera movement to map
        if (hOff > MAPWIDTH - SCREENWIDTH){
            hOff = MAPWIDTH - SCREENWIDTH;
        }
        if (vOff > MAPHEIGHT - SCREENHEIGHT){
            vOff = MAPHEIGHT - SCREENHEIGHT;
        }
    }
    void drawPlayer() {
        // Set the sprite attributes
        shadowOAM[0].attr0 = ATTR0_Y(player.y) | ATTR0_4BPP | ATTR0_TALL; // Shape and Y position
        shadowOAM[0].attr1 = ATTR1_X(player.x) | ATTR1_MEDIUM; // X position and size

        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        int baseTileIndex = 0;

        if (player.isAttacking) {
        // Use appropriate attack sprite based on selected character
            if (currentCharacter == 1) { // Mu Sheng
                shadowOAM[0].attr2 = ATTR2_TILEID(3, 5) | ATTR2_PALROW(3); // Mu Sheng attack sprite
            } else { // Default character
                shadowOAM[0].attr2 = ATTR2_TILEID(2, 1) | ATTR2_PALROW(0); // Normal attack sprite
            }
        } else {
            // Regular sprites
            if (currentCharacter == 1) { // Mu Sheng
                shadowOAM[0].attr2 = ATTR2_TILEID(0, 4) | ATTR2_PALROW(3); // Mu Sheng sprite
            } else { // Default character
                shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0); // Default sprite
            }
        }

    }
    void drawBossEntrance(){
        int screenX = bossEntrance.x - hOff;
        int screenY = bossEntrance.y - vOff;
         // Set the sprite attributes
         shadowOAM[1].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_TALL; // Shape and Y position
         shadowOAM[1].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // X position and size
         shadowOAM[1].attr2 = ATTR2_TILEID(0,17) | ATTR2_PALROW(0);
    }

    void drawstartsprite(){
        shadowOAM[5].attr0 = ATTR0_Y(startsprite.y) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
        shadowOAM[5].attr1 = ATTR1_X(startsprite.x) | ATTR1_LARGE; // X position and size
        shadowOAM[5].attr2 = ATTR2_TILEID(10,1) | ATTR2_PALROW(2);

    }

    void drawWaterBoss(){
        int screenX = waterBoss.x - hOff;
        int screenY = waterBoss.y - vOff;

        shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
        shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
        shadowOAM[2].attr2 = ATTR2_TILEID(2,17) | ATTR2_PALROW(1);

            // Determine the base tile index based on current frame

        // Handle 3-frame animation
        if (waterBoss.currentFrame == 0) {
            shadowOAM[3].attr0 = ATTR0_HIDE;
            // Frame 1: (2,17)
            shadowOAM[2].attr2 = ATTR2_TILEID(2, 17)  | ATTR2_PALROW(1);
        } else if (waterBoss.currentFrame == 1) {
            // Frame 2: (9,17)
            shadowOAM[3].attr0 = ATTR0_HIDE;
            shadowOAM[2].attr2 = ATTR2_TILEID(9, 17)  | ATTR2_PALROW(1);
        } else if (waterBoss.currentFrame == 2) {
            // Frame 3 (split): First part (15,17)
            shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
            shadowOAM[2].attr1 = ATTR1_X(screenX-64) | ATTR1_LARGE; // X position and size
            shadowOAM[2].attr2 = ATTR2_TILEID(15, 17)  | ATTR2_PALROW(1); // First half
            // For the second part, update the second part's tile as well
            shadowOAM[3].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
            shadowOAM[3].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[3].attr2 = ATTR2_TILEID(23, 17) | ATTR2_PALROW(1); // Second half
        }

            // Now, update the frame timer:
        waterBoss.timeUntilNextFrame--;
        if(waterBoss.timeUntilNextFrame <= 0) {
            waterBoss.currentFrame = (waterBoss.currentFrame + 1) % 3;  // Cycle through 0, 1, 2
            waterBoss.timeUntilNextFrame = (rand() % (50 - 20 + 1)) + 20;  // Reset the delay counter
        }
    }
   

    //SOUND FUNCTIONS

        // Play background music (looping)
    void playBackgroundMusic() {
        // Use soundA for background music (looping)
        playSoundA(surge_data, surge_length, 1);  // 1 means looping
    }

    
    void setupInterrupts() {

        REG_IME = 0;

        // TODO 1.0: Set correct bits in interrupt enable register
        REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
        
        REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
        REG_INTERRUPT = &interruptHandler;

        REG_IME = 1;

    }

    void interruptHandler() {
        REG_IME = 0;
    
        if (REG_IF & IRQ_VBLANK) {
            // SOUND A
            if (soundA.isPlaying) {
                soundA.vBlankCount++;
                if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                    if (soundA.looping) {
                        playSoundA(soundA.data, soundA.dataLength, 1); // restart clean
                    } else {
                        soundA.isPlaying = 0;
                        DMA[1].ctrl = 0;       
                        REG_TM0CNT = 0;       
                    }
                }
            }
            // SOUND B (if used)
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, 1);
                } else {
                    soundB.isPlaying = 0;
                    DMA[2].ctrl = 0;
                    REG_TM1CNT = 0;
                }
            }
        }
        }
    
        REG_IF = REG_IF;
        REG_IME = 1;
    }
    