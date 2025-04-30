#ifndef BOSSMOVEMENT_H
#define BOSSMOVEMENT_H

#include "gba.h"
#include <stdlib.h>
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "bossroom1.h"

// Boss behavior states
#define BOSS_CHASE 0
#define BOSS_CIRCLE 1
#define BOSS_DASH 2
#define BOSS_RETREAT 3

// Movement speed constants
#define BOSS_NORMAL_SPEED 1
#define BOSS_DASH_SPEED 3
// Boss properties
#define BOSS_INITIAL_LIVES 5
#define BOSS_DAMAGE_COOLDOWN 30

#define BOSS_FRAME_DELAY_MIN = 20
#define BOSS_FRAME_DELAY_MAX = 50

extern SPRITE player;
#define MAPWIDTH 256
#define MAPHEIGHT 256

// Structure for the boss
typedef struct {
    int x, y;
    int width, height;
    int lives;
    int behaviorState;
    int behaviorTimer;
    int attackCooldown;
    int damageDelay;
    int isInvulnerable;
    int invulnerableTimer;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex; 
    
} BOSS;
// Initialize a boss with given position, size, and default values
void initBoss(BOSS* boss, int x, int y, int width, int height);

// Update boss position and behavior based on player position
void updateBoss(BOSS* boss, SPRITE* player);

// Draw the boss sprite at its current position
void drawBoss(BOSS* boss, OBJ_ATTR* shadowOAM, int index, int hOff, int vOff);

// Handle collision between player and boss
int checkBossCollision(BOSS* boss, SPRITE* player);

#endif