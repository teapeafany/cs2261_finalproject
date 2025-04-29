#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"

#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#include "play.h"
#include "digitalSound.h"

// TODO 3.1: Include examplesong.h
#include "surge.h"


int currentSong;


void init() {
    currentSong = 0;

    // TODO 3.2: Set songs[0] struct members

    songs[0].sampleRate = surge_sampleRate;
    songs[0].length = surge_length;
    songs[0].data = (signed char*)surge_data;
    songs[0].title = "surge";

    playSong(currentSong);

} 

void playSong(int s) {

    // TODO 3.3: Play song at index s of songs
    playSoundA(songs[s].data, songs[s].length, soundA.looping);    

    // TODO 1.1: Setup timer 2 control and data registers
    REG_TM2D = 65536 - 16384;
    REG_TM2CNT = 0;
    
    // TODO 1.1: Setup timer 3 control and data registers
    REG_TM3D = 65536 - 60;
    REG_TM3CNT = 0;
    
}
