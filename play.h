#ifndef PLAY_H
#define PLAY_H

#define SONGCOUNT 3

typedef struct {

    char* title;
    unsigned short color;

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[SONGCOUNT];

void init();
void update();
void draw();

void playSong(int);
void prevSong();
void nextSong();

extern int paused;
extern int shuffle;
extern int currentSong;

extern int minute;
extern int second;

#endif