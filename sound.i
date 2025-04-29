# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"

# 1 "play.h" 1





typedef struct {

    char* title;
    unsigned short color;

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[3];

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
# 3 "sound.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "sound.c" 2
