GOL gol;

void setup() {
  background(#161c28);
  size(800, 800);
  gol = new GOL();
}

void draw() {
  background(#161c28);
  gol.display();
  gol.generate();
}
