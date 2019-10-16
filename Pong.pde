int BALL_SIZE = 50;
int BALL_SPEED = 1;

int PADDLE_WIDTH = 200;
int PADDLE_HEIGHT = 50;
int PADDLE_MOVE_SPEED = 5;

int BALL_COLOR = #ED03FF;
int PADDLE_COLOR = #0AF0A0;
int BACKGROUND_COLOR = #00AAFF;

int playerScore = 0;

int ballXPosition = 500;
int ballYPosition = 350;

int paddleXPosition = 400;
int paddleYPosition = 600;

int ballXSpeed = (int)random(3) + 1;
int ballYSpeed = (int)random(3) + 1;

boolean paddleMoveLeft = false;
boolean paddleMoveRight = false;


void setup() {
  //ADJUST THE SIZE OF THE WINDOW HERE
  size(1000, 700);
  textSize(25);
}

void draw() {
  background(BACKGROUND_COLOR);
  checkCollision();
  updateBall();
  // updatePaddle();
  // drawScore();
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddleMoveLeft = true;
  }
  if (keyCode == RIGHT) {
    paddleMoveRight = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    paddleMoveLeft = false;
  }
  if (keyCode == RIGHT) {
    paddleMoveRight = false;
  }
}

void updateBall() {
  ballXPosition += ballXSpeed;
  ballYPosition += ballYSpeed;
  if (ballXPosition <= 0 || ballXPosition >= width) {
    ballXSpeed = -ballXSpeed;
  }
  if (ballYPosition <= 0) {
    ballYSpeed = -ballYSpeed;
  }
  if(ballYPosition >= height){
    ballYSpeed = -ballYSpeed;
  }
  fill(BALL_COLOR);
  ellipse(ballXPosition, ballYPosition, BALL_SIZE, BALL_SIZE);
}

void updatePaddle() {
  if(paddleMoveLeft){
     paddleXPosition -= PADDLE_MOVE_SPEED; 
  }
    if(paddleMoveRight){
     paddleXPosition += PADDLE_MOVE_SPEED; 
  }
  fill(PADDLE_COLOR);
  rect(paddleXPosition, paddleYPosition, PADDLE_WIDTH, PADDLE_HEIGHT);
}

void drawScore(){
  fill(0);
  text("SCORE: " + playerScore, 100, 100);
}

void checkCollision(){
  int hbs = BALL_SIZE / 2;
  if(ballXPosition + hbs > paddleXPosition && ballXPosition - hbs < paddleXPosition + PADDLE_WIDTH && 
     ballYPosition + hbs > paddleYPosition && ballYPosition - hbs < paddleYPosition + PADDLE_HEIGHT){
       ballYSpeed += ballYSpeed / Math.abs(ballYSpeed);
       ballXSpeed += ballXSpeed / Math.abs(ballXSpeed);
       ballYSpeed = -ballYSpeed;
       playerScore++;
  }
}
