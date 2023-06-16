GOL gol;
boolean play = false;

void setup() {
  size(800, 800);
  background(#161c28);

  rectMode(CENTER);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Press any key to play or pause the simulation", width/2, height/2);
  
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
  play = !play;
}