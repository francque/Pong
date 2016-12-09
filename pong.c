#include <stdio.h>
#include <curses.h>
#include <stdlib.h>
#include <time.h>
#include <sys/timeb.h>
#include <sys/time.h>
#include <string.h>
#include <windows.h>
#define MAXLENGTH 56
#define MAXWIDTH 190

void generateGame(char PADDLE, char BALL, int leftPos, int rightPos);
void drawPaddle(char PADDLE, int pos, int oldPos, char SPACE, int side);
static void initGame();
void delay(int milliseconds);
//void startBall(int r, char BALL, int* ballX);
static int difficulty = 0;
//static int MAXWIDTH, MAXLENGTH;

int main(void) {

	//MAXWIDTH = GetSystemMetrics(SM_CXFULLSCREEN);
	//MAXWIDTH = 56;
	//MAXLENGTH = GetSystemMetrics(SM_CYMAXIMIZED);
	//MAXLENGTH = 190;
	const char PADDLE = '|';
	struct timeb tmb;
 
	ftime(&tmb);
	//int oldTime = time(NULL);
	const char BALL = 'o';
	int i;
	int j;
	const char SPACE = ' ';
	const int LEFTSIDE = 1;
	const int RIGHTSIDE = 190;
	//int* game[MAXWIDTH][MAXLENGTH]; //0 if blank, 1 if ball, 2 if left paddle, 3 if left paddle
	int leftPos = MAXLENGTH / 2;
	int oldLeftPos = leftPos;
	int rightPos = MAXLENGTH / 2;
	int oldRightPos = rightPos;
	char button = 'j';
	//int ballPos[MAXWIDTH][MAXLENGTH];
	int ballX = MAXWIDTH / 2;
	int ballY = MAXLENGTH /2;
	int oldBallX = ballX;
	struct timeval tv;
	int oldTime = tmb.millitm;
	int currentTime = oldTime;
	int oldBallY = ballY;
	int leftScore = 0;
	int rightScore = 0;
	
	srand(time(NULL));
	int r = rand();
	//initscr();
	
	while (1) {
		initGame();
		generateGame(PADDLE, BALL, leftPos, rightPos);
		//refresh();
		//mvprintw(20, 20, "%c", BALL);
		refresh();
		//startBall(r, BALL, *ballX);
		if (r % 2 == 0) 
			ballX++;
		else ballX--;
		mvprintw(ballY, ballX, "%c", BALL);
		//mvprintw(ballY, oldBallX, "7");
		refresh();
		
		

		while (1) {
			mvprintw(1, MAXWIDTH /2, "Player 1: %d     Player 2: %d", leftScore, rightScore);
			ftime(&tmb);
			oldTime = tmb.millitm;
			//status = ftime(&tp);
			timeout(0);
			button = getch();
			//mvprintw(50, 90, "%d", ballX);
			refresh();
			if (button == 'w' && leftPos > 4) { 
				oldLeftPos = leftPos;
				leftPos--;
				drawPaddle(PADDLE, leftPos, oldLeftPos, SPACE, LEFTSIDE);
			}
			if (button == 's' && leftPos < MAXLENGTH - 3) {
				oldLeftPos = leftPos;
				leftPos++;
				drawPaddle(PADDLE, leftPos, oldLeftPos, SPACE, LEFTSIDE);
			}
			if (button == 'l' && rightPos < MAXLENGTH - 3) {
				oldRightPos = rightPos;
				rightPos++;
				drawPaddle(PADDLE, rightPos, oldRightPos, SPACE, RIGHTSIDE);
			}
			if (button == 'o' && rightPos > 4) {
				oldRightPos = rightPos;
				rightPos--;
				drawPaddle(PADDLE, rightPos, oldRightPos, SPACE, RIGHTSIDE);
			}
			if (ballX == (RIGHTSIDE -1)) {
				if (ballY == rightPos) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					--ballX;
				}
				else if (ballY == rightPos - 1 || ballY == rightPos - 2 || ballY == rightPos - 3 || ballY == rightPos - 4) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					oldBallY = ballY;
					--ballX;
					--ballY;
				}
				else if (ballY == rightPos + 1 || ballY == rightPos + 2 || ballY == rightPos + 3 || ballY == rightPos + 4) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					oldBallY = ballY;
					--ballX;
					++ballY;
				}
				else {
					++leftScore;
					erase();
					mvprintw(MAXLENGTH / 2, MAXWIDTH / 2, "Left score: %d            Right score: %d", leftScore, rightScore);
					refresh();
					delay(1500);
					erase();
					for (i = leftPos - 3; i <= leftPos + 3; i++) {
						mvprintw(i, 1, "%c", SPACE);
					}
					for (i = rightPos - 3; i <= rightPos + 3; i++) {
					mvprintw(i, MAXWIDTH, "%c", SPACE);
					}
					mvprintw(ballY, ballX, "%c", SPACE);
					ballX = MAXWIDTH / 2;
					ballY = MAXLENGTH / 2;
					leftPos = MAXLENGTH / 2;
					rightPos = MAXLENGTH / 2;
					for (i = leftPos - 3; i <= leftPos + 3; i++) {
						mvprintw(i, 1, "%c", PADDLE);
					}
					for (i = rightPos - 3; i <= rightPos + 3; i++) {
					mvprintw(i, MAXWIDTH, "%c", PADDLE);
					}
					if (r % 2) ++ballX;
					else --ballX;
				}
			}
			if (ballX == (LEFTSIDE+1)) {
				if (ballY == leftPos) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					++ballX;
				}
				else if (ballY == leftPos -1 || ballY == leftPos -2 || ballY == leftPos -3 || ballY == leftPos - 4) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					oldBallY = ballY;
					++ballX;
					--ballY;
				}
				else if (ballY == leftPos + 1 || ballY ==leftPos + 2 || ballY == leftPos + 3 || ballY == leftPos + 4) {
					mvprintw(ballY, ballX, "%c", SPACE);
					oldBallX = ballX;
					oldBallY = ballY;
					++ballX;
					++ballY;
				}
				else {
					++rightScore;
					erase();
					mvprintw(MAXLENGTH / 2, MAXWIDTH / 2, "Left score: %d          Right score: %d", leftScore, rightScore);
					refresh();
					delay(1500);
					erase();
					for (i = leftPos - 3; i <= leftPos + 3; i++) {
						mvprintw(i, 1, "%c", SPACE);
					}
					for (i = rightPos - 3; i <= rightPos + 3; i++) {
					mvprintw(i, MAXWIDTH, "%c", SPACE);
					}
					
					mvprintw(ballY, ballX, "%c", SPACE);
					ballX = MAXWIDTH / 2;
					ballY = MAXLENGTH / 2;
					leftPos = MAXLENGTH / 2;
					rightPos = MAXLENGTH / 2;
					for (i = leftPos - 3; i <= leftPos + 3; i++) {
						mvprintw(i, 1, "%c", PADDLE);
					}
					for (i = rightPos - 3; i <= rightPos + 3; i++) {
					mvprintw(i, MAXWIDTH, "%c", PADDLE);
					}
					
					if (r % 2) ++ballX;
					else --ballX;
				}
					
			}
				delay(difficulty);
			
			//mvprintw(25, 25, "%d", currentTime - oldTime);
			//if (currentTime - oldTime > 500) {
				
		
			if (ballY == 1) {
				mvprintw(ballY, ballX, "%c", SPACE);
				oldBallY = ballY;
				++ballY;
				if (ballX > oldBallX) {
					oldBallX = ballX;
					++ballX;
				}
				else --ballX;
			}
			if (ballY == MAXLENGTH - 1) {
				mvprintw(ballY, ballX, "%c", SPACE);
				oldBallY = ballY;
				--ballY;
				if (ballX > oldBallX) {
					oldBallX = ballX;
					++ballX;
				}
				else --ballX;
			}
					
				if (ballX > oldBallX) {
					oldBallX = ballX;
					++ballX;
				}
				else if(ballX < oldBallX) {
					oldBallX = ballX;
					--ballX;
				}
				if (ballY > oldBallY) {
					oldBallY = ballY;
					++ballY;
				}
				else if (ballY < oldBallY) {
					oldBallY = ballY;
					--ballY;
				}
				//mvprintw(20, 20, "7");
			//}
				refresh();
				mvprintw(oldBallY, oldBallX, "%c", SPACE);
				mvprintw(oldBallY -1, oldBallX - 1, "%c", SPACE);
				mvprintw(oldBallY + 1, oldBallX + 1, "%c", SPACE);
				mvprintw(oldBallY - 1, oldBallX + 1, "%c", SPACE);
				mvprintw(oldBallY + 1, oldBallX - 1, "%c", SPACE);
				mvprintw(oldBallY, oldBallX - 1, "%c", SPACE);
				mvprintw(oldBallY, oldBallX + 1, "%c", SPACE);
				mvprintw(oldBallY + 1, oldBallX, "%c", SPACE);
				mvprintw(oldBallY - 1, oldBallX, "%c", SPACE);
				if (leftScore < 10 && rightScore < 10) mvprintw(1, MAXWIDTH /2 + 25, "%c", SPACE);
				mvprintw(ballY, ballX, "%c", BALL);
				//mvprintw(50, 50, "%d", oldTime);
				//thing();
				refresh();
			
			
			ftime(&tmb);
			currentTime = tmb.millitm;		
		}
	
	}
	return 0;
}

void generateGame(char PADDLE, char BALL, int leftPos, int rightPos) {
	int i;
	for (i = leftPos - 3; i <= leftPos + 3; i++) {
		mvprintw(i, 1, "%c", PADDLE);
	}
	for (i = rightPos - 3; i <= rightPos + 3; i++) {
		mvprintw(i, MAXWIDTH, "%c", PADDLE);
	}
	mvprintw(MAXLENGTH / 2, MAXWIDTH / 2, "%c", BALL);
	refresh();
	
}

void drawPaddle(char PADDLE, int pos, int oldPos, char SPACE, int side) {
	int i;
	for (i = pos - 3; i <= pos + 3; i++) {
		mvprintw(i, side-1, "%c", SPACE);
	}
	for (i = oldPos - 3; i <= oldPos + 3; i++) {
		mvprintw(i, side-1, "%c", SPACE);
	}
	for (i = pos - 3; i <= pos + 3; i++) {
		mvprintw(i, side+1, "%c", SPACE);
	}
	for (i = oldPos - 3; i <= oldPos + 3; i++) {
		mvprintw(i, side+1, "%c", SPACE);
	}
	for (i = oldPos - 3; i <= oldPos + 3; i++) {
		mvprintw(i, side, "%c", SPACE);
	}
	for (i = pos - 3; i <= pos + 3; i++) {
		mvprintw(i, side, "%c", PADDLE);
	}
}

/* void startBall(int r, char BALL, int* ballX) {
	
	if (r % 2 == 0) 
		*ballX++;
	else *ballX--;
}
 */
 
 static void initGame() {
	initscr();
	
	//attron(COLOR_PAIR(1));
	//WINDOW *win = newwin(10, 10, 10, 10);
	start_color();
	init_pair(1, COLOR_GREEN, COLOR_BLACK);
	wbkgd(stdscr, COLOR_PAIR(1));
	refresh();
	
	erase();
	noecho();
	mvprintw(MAXLENGTH / 2, MAXWIDTH / 2, "Ready to play? Press 'y' to continue");
	
	while (getch() != 'y') {
	
	
	}
	
	mvprintw(MAXLENGTH / 2, MAXWIDTH / 2, "Input a difficulty level from 0 to 100:  ");
	refresh();
	delay(1000);
	char difficultyChar[4];
	
	char nextChar = '\0';
	char nextCharString[2];
	int position = 0;
	
	echo();
	
	
	scanw("%d", &difficulty);
	
	
	noecho();
	difficulty = 100 - difficulty;
	erase();
	mvprintw(MAXLENGTH /2, MAXWIDTH /2, "Use W/S to control left paddle and O/L to control right paddle.  HAVE FUN!");
	refresh();
	int i, j;
	/*for (i = 0; i < 10000; i++) {
		for (j = 0; j < 20000; j++) {
			
		
		}
	
	
	}*/
	
	delay(1000);
	erase();
	
	
	
 
 }
 
 
void delay(int milliseconds)
{
    long pause;
    clock_t now,then;

    pause = milliseconds*(CLOCKS_PER_SEC/1000);
    now = then = clock();
    while( (now-then) < pause )
        now = clock();
}
 
 
 int thing()
{
  struct timeb tmb;
 
  ftime(&tmb);
  printf("tmb.time     = %ld (seconds)\n", tmb.time);
  printf("tmb.millitm  = %d (mlliseconds)\n", tmb.millitm);
 
  return 0;
}