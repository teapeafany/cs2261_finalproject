 #include "gba.h"
#include <stdlib.h>
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "intro.h"

//town bg

#include "tilesetsample.h"
#include "tilemapsample.h"
#include "512.h"
#include "512map.h"

//spritesheet
#include "myspritesheet.h"


//states bg
#include "paused.h"
#include "win.h"
#include "lose.h"

//bossrooms bg
#include "bossmazemap.h"
#include "bossmazetiles.h"


//instructions bg
#include "instructions.h"

//bg for parallax tiles
//the tileset
#include "parallaxtileset.h"

//the tilemaps
#include "parallaxbg.h"
#include "parallaxclouds.h"
#include "clouds.h"
#include "bubble.h"

//sound
#include "digitalSound.h"
#include "play.h"
#include "surge.h"  // Looping background music
#include "analogSound.h"
#include "bossmovement.h"


//flower spawns 
int timer = 0; 
u16 redFlowerPalette[16];
 

void setupInterrupts();
void interruptHandler();


//define var for hscroll
int hScroll;


#define MAPWIDTH 256
#define MAPHEIGHT 256


OBJ_ATTR shadowOAM[128];

//implement flower
typedef struct {
    int row;
    int col;
    int active;
    int state; // 0 = healthy, 1 = damaged
    int spriteIndex;
    int lifetime;
    int isRed;
    int width;
    int height;
} Flower;

#define MAX_FLOWERS 10
Flower flowers[MAX_FLOWERS];
SOUND soundA;
SOUND soundB;



// Function prototypes 
void drawFlower(Flower* flower);
void initFlowers();
void spawnRandomFlower();
void spawnFlower(int row, int col);
void drawFlower(Flower* flower);
void drawPlayer();
void updatePlayer();
void boss();
void drawBoss();
void drawWaterBoss();
void drawstartsprite();
void checkTriggerAreas();


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

//SPRITES
SPRITE player;
SPRITE bossEntrance;
BOSS waterBoss;
BOSS samuraiBoss;
SPRITE startsprite;
typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;


//characters unlocked
int flowersProtected = 0;
int flowersNeeded = 10;

int animationCounter = 0;
int animationSpeed = 10;

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
    srand(42);


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
//START (PARALLAX, TILEMAP MOD, PALETTE MOD)

void goToStart() {

    hideSprites();


    // FIXME 3.1: Now we need another background!
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE; 

    // TODO 1.2: Set up our background 0 controls
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_SMALL | BG_8BPP | 2;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_SMALL | BG_8BPP| 0;


    // TODO 1.3: DMA the background palette, tileset, and tilemap
    DMANow(3, parallaxtilesetPal, BG_PALETTE, 256);
    DMANow(3, parallaxtilesetTiles, &CHARBLOCK[0], parallaxtilesetTilesLen / 2);
    DMANow(3, parallaxtilesetTiles, &CHARBLOCK[0], parallaxtilesetTilesLen / 2);
    //DMANow(3, parallaxtilesetTiles, &CHARBLOCK[2], parallaxtilesetTilesLen / 2);
    DMANow(3, bubbleMap, &SCREENBLOCK[8], bubbleLen / 2);


    // TODO 4.1: DMA the clouds tilemap into BG1   
    DMANow(3, cloudsMap, &SCREENBLOCK[16], cloudsLen / 2);
    


     //load a player sprite
     DMANow(3, myspritesheetTiles, &CHARBLOCK[4], myspritesheetTilesLen/2);
     DMANow(3, myspritesheetPal, SPRITE_PAL, 256);
     
     startsprite.width = 16;
     startsprite.height = 40;
     startsprite.x = 40;
     startsprite.y = 64;

    playSoundA(surge_data, surge_length, 1);
    state = START;


}
//UPDATE START (tilemap mod, turn the tile into a star!)
void updatestart() {
    
    if (BUTTON_HELD(BUTTON_SELECT)) {
        SCREENBLOCK[16].tilemap[OFFSET(15, 10, 32)] = 99;
    }
     

    // TODO 5.2: Increment hOff
    hScroll++;

    REG_BG1HOFF = hScroll;
    REG_BG0HOFF = hScroll/2;

}
//START
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
//INSRUCTIONS
    void goToInstructions() {
        REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, instructionsPal, BG_PALETTE, 256);

        drawFullscreenImage4(instructionsBitmap);

        hideSprites();
        DMANow(3, shadowOAM, OAM, 128 * 4);
        waitForVBlank();

        DMANow(3, instructionsPal, BG_PALETTE, 256);

        drawFullscreenImage4(instructionsBitmap);

        state = INSTRUCTIONS;


    }
    void instructions() {
        waitForVBlank();

        if (BUTTON_PRESSED(BUTTON_START)) {
            goToGame1();
        }
    }
//GO TO PAUSE
    void goToPause() {
        REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, pausedPal, BG_PALETTE, 256);

        drawFullscreenImage4(pausedBitmap);

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

    //PAUSE 

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

//GO TO WIN
void goToWin() {
    flowersProtected = 0;
    REG_DISPCTL = MODE(4) | BG_ENABLE(2); 


        //load the tilemap pause
        DMANow(3, winPal, BG_PALETTE, 256);

        drawFullscreenImage4(winBitmap);

    hideSprites();
    // Wait for VBlank before copying to OAM
    waitForVBlank();
    
    // Copy the shadowOAM to the actual OAM
    DMANow(3, shadowOAM, OAM, 128 * 4);
    prevState = 2;
    state = WIN;
}
//WIN
// run win state for each frame
void win() {
    waitForVBlank();
    prevState = 2;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame1();
        return;
    }
}

//GO TO LOSE
void goToLose() {

    flowersProtected = 0;
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

//GO TO GAME1
void goToGame1() {
    //pause state
    if (state == PAUSE) {
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
        
        //load the tilemap game1 
        DMANow(3, tilesetsampleTiles, &CHARBLOCK[0], tilesetsampleTilesLen/2);
        DMANow(3, tilemapsampleMap, &SCREENBLOCK[28], tilemapsampleLen/2);
        DMANow(3, tilesetsamplePal, BG_PALETTE, 256);

        //load the player sprite - Make sure we're loading to CHARBLOCK 4
        DMANow(3, myspritesheetTiles, &CHARBLOCK[4], myspritesheetTilesLen/2);
     DMANow(3, myspritesheetPal, SPRITE_PAL, 256);
        state = GAME1;
        return;
    }
    
    //set up mode0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    //in background 0 find the tilemap
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    
    //load the tilemap game1 
    DMANow(3, tilesetsampleTiles, &CHARBLOCK[0], tilesetsampleTilesLen/2);
    DMANow(3, tilemapsampleMap, &SCREENBLOCK[28], tilemapsampleLen/2);
    DMANow(3, tilesetsamplePal, BG_PALETTE, 256);

    //load the player sprite - Make sure we're loading to CHARBLOCK 4
    DMANow(3, myspritesheetTiles, &CHARBLOCK[4], myspritesheetTilesLen/2);
     DMANow(3, myspritesheetPal, SPRITE_PAL, 256);
    
    // Clear shadow OAM
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    hOff = 0;
    vOff = 0;
    
    // init player sprite
    player.x = 30;
    player.y = 14;
    player.width = 16;
    player.height = 32;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 100;
    

    //init bosses
    initBoss(&waterBoss, 100, 90, 64, 64);
    initBoss(&samuraiBoss, 140, 40, 64, 64);
    
    state = GAME1; // Move this to the end of the function
}

//GAME1 
void game1() {
    // Update game state first
    updatePlayer();

    checkTriggerAreas();



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
    // Wait for VBlank and update display
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

}

//GO TO BOSS 1
void goToBoss1() {
    flowersProtected = 0;
    flowersNeeded = 10;

    for (int i = 0; i < MAX_FLOWERS; i++) {
        drawFlower(&flowers[i]);
    }

    prevState = 1;
    //pause state
    if (state == PAUSE) {
        REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;
        
        //load the tilemap bossroom 
        DMANow(3, bossmazetilesTiles, &CHARBLOCK[0], bossmazetilesTilesLen/2);
        DMANow(3, bossmazemapMap, &SCREENBLOCK[28], bossmazemapLen/2);
        DMANow(3, bossmazetilesPal, BG_PALETTE, 256);

        DMANow(3, myspritesheetTiles, &CHARBLOCK[4],myspritesheetTilesLen/2);
     DMANow(3, myspritesheetPal, SPRITE_PAL, 256);
        state = BOSS1;
        return;
    }

    //set up mode0
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    //in background 0 find the tilemap
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;


    //load the tilemap bossroom 
    DMANow(3, bossmazetilesTiles, &CHARBLOCK[0], bossmazetilesTilesLen/2);
    DMANow(3, bossmazemapMap, &SCREENBLOCK[28], bossmazemapLen/2);
    DMANow(3, bossmazetilesPal, BG_PALETTE, 256);
        DMANow(3, myspritesheetTiles, &CHARBLOCK[4],myspritesheetTilesLen/2);
     DMANow(3, myspritesheetPal, SPRITE_PAL, 256);

    // Clear shadow OAM
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    hOff = 0;
    vOff = 0;

    // Initializing player sprite
    
    player.x = 10;
    player.y = 100;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 100;
    player.damageTimer = 0;

    initFlowers();
    initRedFlowerPalette();

    

    state = BOSS1; // Move this to the end of the function
}


//BOSS FUNCTION
void boss() {

    updatePlayer();
    updateFlowers();
    checkFlowerCollisions();
    timer++;
    for (int i = 0; i < MAX_FLOWERS; i++) {
        drawFlower(&flowers[i]);
    }

    updateBoss(&waterBoss, &player);
    updateBoss(&samuraiBoss, &player);

    // Update damage timer if active
    if (player.damageTimer > 0) {
        player.damageTimer--;
    }



// Check for collision with boss entrance
    // Check for collisions between boss and player
    if (checkBossCollision(&waterBoss, &player) || checkBossCollision(&samuraiBoss, &player)) {
        // Condition 1: Boss hits player on frame 1
        if (player.damageTimer == 0) {

        if (waterBoss.currentFrame == 1 || samuraiBoss.currentFrame == 1) { 
            player.health -= 10; // Player loses 5 HP
            player.damageTimer = 50;
            
            // Check if player is defeated
            if (player.health <= 0) {
                player.health = 0;
                goToLose();
            }
        }
    }
    }


    if (timer % 120 == 0) { // Every 2 seconds assuming 60 FPS
        spawnRandomFlower();
    }


    drawPlayer();
    drawWaterBoss();
    drawSamuraiBoss();
    
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);


        if (BUTTON_PRESSED(BUTTON_START)) {
            goToPause();
        }

}

//UPDATE PLAYER
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

            //COMPLEX MOVEMENT - center screen on player
            // Clamp player first
        if (player.x < 0) player.x = 0;
        if (player.y < 0) player.y = 0;
        if (player.x + player.width > MAPWIDTH) player.x = MAPWIDTH - player.width;
        if (player.y + player.height > MAPHEIGHT) player.y = MAPHEIGHT - player.height;

        // Center camera based on clamped player position
        hOff = player.x - (SCREENWIDTH - player.width) / 2;
        vOff = player.y - (SCREENHEIGHT - player.height) / 2;

        // Clamp camera to map bounds
        if (hOff < 0) hOff = 0;
        if (vOff < 0) vOff = 0;
        if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
        if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    if (BUTTON_PRESSED(BUTTON_B) && !player.isAttacking) {
        player.isAttacking = 1;
        

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

    } 



        
    }
    }

    //DRAW FUNCTIONS


    //DRAW PLAYER 
    void drawPlayer() {
        // Set the sprite attributes
        shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_4BPP | ATTR0_TALL; // Shape and Y position
        shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM; // X position and size

        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        int baseTileIndex = 0;
        int row = 0;    


        animationCounter++;
        if (animationCounter >= animationSpeed) {
            animationCounter = 0;
            player.currentFrame = (player.currentFrame + 1) % 7; // Cycle through 7 frames
        }

            // For animation frames
            if (player.direction == DOWN) {
                row = 0; // Down-facing (first row)
                // Don't reset currentFrame every time, only when direction changes
                // Only increment on animation timing, not every frame
            } else if (player.direction == UP) {
                row = 1; // Up-facing (second row)
            } else if (player.direction == LEFT) {
                row = 2; // Left-facing (third row)
            } else if (player.direction == RIGHT) {
                row = 3; // Right-facing (fourth row)
            }


            // If your sprite is 32x16 (ATTR1_MEDIUM | ATTR0_TALL)
            // And each sprite takes 4x2 tiles
            int column = player.currentFrame % 5; // Assuming 7 frames per animation
        // If each sprite is 16x32 pixels (2x4 tiles)
        shadowOAM[0].attr2 = ATTR2_TILEID(column * 2, row * 4) | ATTR2_PALROW(0);            
            
        }

    
    //DRAW START SPRITE
    void drawstartsprite(){
        shadowOAM[5].attr0 = ATTR0_Y(startsprite.y) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
        shadowOAM[5].attr1 = ATTR1_X(startsprite.x) | ATTR1_LARGE; // X position and size
        shadowOAM[5].attr2 = ATTR2_TILEID(0,22) | ATTR2_PALROW(1) | ATTR2_PRIORITY(1);

    }
    //DRAW SAMURAI BOSS
    void drawSamuraiBoss(){
        int screenX = samuraiBoss.x - hOff;
        int screenY = samuraiBoss.y - vOff;

        shadowOAM[16].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
        shadowOAM[16].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // X position and size
        shadowOAM[16].attr2 = ATTR2_TILEID(2,17) | ATTR2_PALROW(0);

            // Determine the base tile index based on current frame

        // Handle 3-frame animation
        if (samuraiBoss.currentFrame == 0) {
            shadowOAM[16].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
            shadowOAM[16].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // X position and size
            // Frame 1: (0,17)
            shadowOAM[16].attr2 = ATTR2_TILEID(0, 17)  | ATTR2_PALROW(0);
        } else if (samuraiBoss.currentFrame == 1) {
            // Frame 2: (6,17)
            shadowOAM[16].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[16].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[16].attr2 = ATTR2_TILEID(6, 17)  | ATTR2_PALROW(0);

        } else if (samuraiBoss.currentFrame == 2) {
            // Frame 3 (split): First part (15,17)
            shadowOAM[16].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[16].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[16].attr2 = ATTR2_TILEID(15, 17)  | ATTR2_PALROW(0); 

        } else if (samuraiBoss.currentFrame == 3) {
            shadowOAM[16].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[16].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[16].attr2 = ATTR2_TILEID(24, 17)  | ATTR2_PALROW(0); 

        }

            // Now, update the frame timer:
        samuraiBoss.timeUntilNextFrame--;
        if(samuraiBoss.timeUntilNextFrame <= 0) {
            samuraiBoss.currentFrame = (waterBoss.currentFrame + 1) % 4;  // Cycle through 0, 1, 2
            samuraiBoss.timeUntilNextFrame = (rand() % (50 - 20 + 1)) + 20;  // Reset the delay counter
        }
    }

    //DRAW WATER BOSS
    void drawWaterBoss(){
        int screenX = waterBoss.x - hOff;
        int screenY = waterBoss.y - vOff;

        shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
        shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // X position and size
        shadowOAM[2].attr2 = ATTR2_TILEID(2,17) | ATTR2_PALROW(0);

            // Determine the base tile index based on current frame

        // Handle 3-frame animation
        if (waterBoss.currentFrame == 0) {
            shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_SQUARE; // Shape and Y position
            shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM; // X position and size
            // Frame 1: (0,17)
            shadowOAM[2].attr2 = ATTR2_TILEID(0, 17)  | ATTR2_PALROW(0);
        } else if (waterBoss.currentFrame == 1) {
            // Frame 2: (6,17)
            shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[2].attr2 = ATTR2_TILEID(6, 17)  | ATTR2_PALROW(0);

        } else if (waterBoss.currentFrame == 2) {
            // Frame 3 (split): First part (15,17)
            shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[2].attr2 = ATTR2_TILEID(15, 17)  | ATTR2_PALROW(0); 

        } else if (waterBoss.currentFrame == 3) {
            shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_WIDE; // Shape and Y position
            shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_LARGE; // X position and size
            shadowOAM[2].attr2 = ATTR2_TILEID(24, 17)  | ATTR2_PALROW(0); 

        }

            // Now, update the frame timer:
        waterBoss.timeUntilNextFrame--;
        if(waterBoss.timeUntilNextFrame <= 0) {
            waterBoss.currentFrame = (waterBoss.currentFrame + 1) % 4;  // Cycle through 0, 1, 2
            waterBoss.timeUntilNextFrame = (rand() % (50 - 20 + 1)) + 20;  // Reset the delay counter
        }
    }

    void drawFlower(Flower* flower) {
        if (flower->active) {
            // Calculate screen coordinates from world coordinates
            int screenX = flower->col - hOff;
            int screenY = flower->row - vOff;
            
            // Only draw if on screen
            if (screenX >= -16 && screenX < SCREENWIDTH && 
                screenY >= -32 && screenY < SCREENHEIGHT) {
                
                shadowOAM[flower->spriteIndex].attr0 = ATTR0_Y(screenY) | ATTR0_4BPP | ATTR0_TALL;
                shadowOAM[flower->spriteIndex].attr1 = ATTR1_X(screenX) | ATTR1_TINY;
                if (flower->isRed) {
                    shadowOAM[flower->spriteIndex].attr2 = ATTR2_TILEID(0, 30) | ATTR2_PALROW(3);
                } else {
                    shadowOAM[flower->spriteIndex].attr2 = ATTR2_TILEID(0, 30) | ATTR2_PALROW(2);
                }
            } else {
                // Hide off-screen flowers
                shadowOAM[flower->spriteIndex].attr0 = ATTR0_HIDE;
            }
        } else {
            // Hide inactive flowers
            shadowOAM[flower->spriteIndex].attr0 = ATTR0_HIDE;
        }
    }
   

    //SOUND FUNCTIONS


    void playAnalogSoundEffect(unsigned short sound) {

        playAnalogSound(sound);
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
    
    

    //MAP TRIGGERS
    // Define special map areas that trigger state changes
    typedef struct {
        int x, y;          // Top-left coordinates of the area
        int width, height; // Dimensions of the area
        int targetState;   // State to transition to when touched
    } TRIGGER_AREA;

    TRIGGER_AREA triggerAreas[] = {
        {240, 40, 32, 32, BOSS1},      // Area to trigger next level
        // Add more as needed
    };

    #define NUM_TRIGGER_AREAS (sizeof(triggerAreas) / sizeof(TRIGGER_AREA))

    
    void checkTriggerAreas() {
        for (int i = 0; i < NUM_TRIGGER_AREAS; i++) {
            if (collision(
                player.x, player.y, player.width, player.height,
                triggerAreas[i].x, triggerAreas[i].y, 
                triggerAreas[i].width, triggerAreas[i].height)) {
                
                // Player is in trigger area, switch state
                switch (triggerAreas[i].targetState) {
                    case BOSS1:
                        goToBoss1();
                        return;
                    // Add cases for other states
                }
            }
        }
    }



    void initFlowers() {
        for (int i = 0; i < MAX_FLOWERS; i++) {
            flowers[i].active = 0;
            flowers[i].state = 0;
            flowers[i].width = 8;
            flowers[i].height = 16;
        }
    }

    void spawnRandomFlower() {
        int padding = 8;
        int row = padding + (rand() % (MAPHEIGHT - 2 * padding));
        int col = padding + (rand() % (MAPWIDTH - 2 * padding));
        spawnFlower(row, col);
    }

    void spawnFlower(int row, int col) {
        for (int i = 0; i < MAX_FLOWERS; i++) {
            if (!flowers[i].active) { // Only use inactive slots
                flowers[i].row = row;
                flowers[i].col = col;
                flowers[i].active = 1;
                flowers[i].state = 0; // Healthy
                flowers[i].spriteIndex = i + 3; // Assign sprite index
                flowers[i].lifetime = 300;
                flowers[i].isRed = 0; // Start with normal color
                break; // Break after finding an inactive flower
            }
        }
    }

    //palette mod
    void initRedFlowerPalette() {
        // Get the original palette
        u16* spritePalette = (u16*)SPRITE_PAL;
        
        // Create a red version of palette row 2
        for (int i = 0; i < 16; i++) {
            // Get original color
            u16 origColor = spritePalette[32 + i];
            
            // Extract RGB components
            u16 origRed = origColor & 0x1F;
            u16 origGreen = (origColor >> 5) & 0x1F;
            u16 origBlue = (origColor >> 10) & 0x1F;
            
            // Create red version
            u16 newRed = 31; // Max red
            u16 newGreen = origGreen / 3; // Reduce green
            u16 newBlue = origBlue / 3; // Reduce blue
            
            // Store in our custom palette
            redFlowerPalette[i] = RGB(newRed, newGreen, newBlue);
        }

        DMANow(3, redFlowerPalette, &SPRITE_PAL[48], 16);
    }

    // Update function to manage which flower turns red
// Update function to check for flowers about to expire
void updateFlowers() {
    // Update all flowers
    for (int i = 0; i < MAX_FLOWERS; i++) {
        if (flowers[i].active) {
            // Decrease lifetime
            flowers[i].lifetime--;
            
            // Check if flower is about to expire
            if (flowers[i].lifetime < 100) {
                flowers[i].isRed = 1; // Mark to use red palette
                
            } else {
                flowers[i].isRed = 0; // Use normal palette
            }
            
            // Make it disappear when lifetime ends
            if (flowers[i].lifetime <= 0) {
                flowers[i].active = 0;
            }
        }
    }
}
// Check if player is overlapping with flowers
void checkFlowerCollisions() {
    for (int i = 0; i < MAX_FLOWERS; i++) {
        // Check for ALL active flowers, regardless of color
        if (flowers[i].active) { 
            // Check for collision with player
            if (collision(
                player.x, player.y, player.width, player.height,
                flowers[i].col, flowers[i].row, flowers[i].width, flowers[i].height)) {  
                
                // Player collected this flower
                flowers[i].active = 0; // Remove the flower
                flowersProtected++; // Increment counter
                
                // Play a sound effect 
                playCollectSound();
    
                
                // Check win condition
                if (flowersProtected >= flowersNeeded) {
                    goToWin(); // Player has protected enough flowers
                    return;
                }
            }
        }
    }
}

void playCollectSound() {
    playAnalogSound(16); // Shine
}