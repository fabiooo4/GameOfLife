GOL gol;
boolean play = false;

void setup() {
  size(900, 900);
  background(#161c28);

  rectMode(CENTER);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Press spacebar to play or pause the simulation", width/2, height/2);
  text("Press right arrow increment one generation", width/2, height/2 + 35);

  
  frameRate(30);
  gol = new GOL();
}

void draw() {  
  if (play) {
    gol.display();
    gol.generate();
  }
}

void keyPressed() {
  if(key == ' ') {
    play = !play;
  } else if (key == CODED) {
    if (keyCode == RIGHT) {
      gol.display();
      gol.generate();
    }
  } 
}