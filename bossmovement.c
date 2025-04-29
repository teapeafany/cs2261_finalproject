#include "bossmovement.h"
#include <stdlib.h>

void initBoss(BOSS* boss, int x, int y, int width, int height) {
    boss->x = x;
    boss->y = y;
    boss->width = width;
    boss->height = height;
    boss->behaviorState = BOSS_CHASE;
    boss->behaviorTimer = 60; // Start with 1 second of chase behavior
    boss->attackCooldown = 0;
    boss->damageDelay = 0;
    boss->isInvulnerable = 0;
    boss->invulnerableTimer = 0;
    boss->currentFrame = 0;
    boss->timeUntilNextFrame = 50;
    boss-> lives = 20;
}

void updateBoss(BOSS* boss, SPRITE* player) {
    // Update behavior timer and possibly change behavior
    boss->behaviorTimer--;
    if (boss->behaviorTimer <= 0) {
        // Switch to a new random behavior
        boss->behaviorState = rand() % 4;  // 0-3 different behaviors
        
        // Set duration for this behavior
        boss->behaviorTimer = 60 + (rand() % 60);  // 1-2 seconds
    }
    
    // Update damage delay timer
    if (boss->damageDelay > 0) {
        boss->damageDelay--;
    }
    
    // Update invulnerability timer
    if (boss->isInvulnerable) {
        boss->invulnerableTimer--;
        if (boss->invulnerableTimer <= 0) {
            boss->isInvulnerable = 0;
        }
    }
    
    // Calculate direction to player
    int dx = player->x - boss->x;
    int dy = player->y - boss->y;
    int distanceSquared = dx * dx + dy * dy;
    
    // Determine movement based on current behavior
    switch (boss->behaviorState) {
        case BOSS_CHASE:  // Direct chase - normal Genshin enemy behavior
            if (distanceSquared > 25) {  // Don't get too close
                int dirX = (dx > 0) ? 1 : ((dx < 0) ? -1 : 0);
                int dirY = (dy > 0) ? 1 : ((dy < 0) ? -1 : 0);
                
                boss->x += dirX * BOSS_NORMAL_SPEED;
                boss->y += dirY * BOSS_NORMAL_SPEED;
            }
            break;
            
        case BOSS_CIRCLE:  // Circle around player - like shielded enemies
            // Move perpendicular to player direction
            if (distanceSquared > 900 && distanceSquared < 2500) {  // Stay in a ring
                // Perpendicular direction for circling
                int dirX = (dy > 0) ? 1 : -1;
                int dirY = (dx > 0) ? -1 : 1;
                
                boss->x += dirX * BOSS_NORMAL_SPEED;
                boss->y += dirY * BOSS_NORMAL_SPEED;
            } else if (distanceSquared > 2500) {
                // Too far, move closer
                int dirX = (dx > 0) ? 1 : ((dx < 0) ? -1 : 0);
                int dirY = (dy > 0) ? 1 : ((dy < 0) ? -1 : 0);
                
                boss->x += dirX * BOSS_NORMAL_SPEED;
                boss->y += dirY * BOSS_NORMAL_SPEED;
            }
            break;
            
        case BOSS_DASH:  // Quick dash toward player - like hilichurl rush attacks
            if (boss->attackCooldown <= 0 && distanceSquared > 400) {
                // Dash in player direction
                int dirX = (dx > 0) ? 1 : ((dx < 0) ? -1 : 0);
                int dirY = (dy > 0) ? 1 : ((dy < 0) ? -1 : 0);
                
                boss->x += dirX * BOSS_DASH_SPEED;
                boss->y += dirY * BOSS_DASH_SPEED;
                
                boss->attackCooldown = 15;  // Small cooldown between dash steps
            } else {
                boss->attackCooldown--;
            }
            break;
            
        case BOSS_RETREAT:  // Back away to prepare - like archers or mages
            if (distanceSquared < 900) {  // Too close, back away
                int dirX = (dx > 0) ? -1 : ((dx < 0) ? 1 : 0);
                int dirY = (dy > 0) ? -1 : ((dy < 0) ? 1 : 0);
                
                boss->x += dirX * BOSS_NORMAL_SPEED;
                boss->y += dirY * BOSS_NORMAL_SPEED;
            } else {
                // Stand still as if preparing an attack
            }
            break;
    }
    
    // Keep boss within map boundaries
    if (boss->x < 0) boss->x = 0;
    if (boss->y < 0) boss->y = 0;
    if (boss->x + boss->width > MAPWIDTH) boss->x = MAPWIDTH - boss->width;
    if (boss->y + boss->height > MAPHEIGHT) boss->y = MAPHEIGHT - boss->height;
}

int checkBossCollision(BOSS* boss, SPRITE* player) {
     // Only check when the boss is in frame 2 (index 2) which has the second half
     if (boss->currentFrame == 2) {
        // Calculate the position of the second half sprite
        int secondHalfX = boss->x; // The X position of the second half
        int secondHalfY = boss->y; // The Y position is the same
        
        // Check for collision between player and second half sprite
        return (player->x < secondHalfX + boss->width && 
                player->x + player->width > secondHalfX && 
                player->y < secondHalfY + boss->height && 
                player->y + player->height > secondHalfY);
    }
    return 0; // No collision if boss isn't in the right frame
}
