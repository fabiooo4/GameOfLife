class Cell {
  int x;
  int y;
  int size;
  int state;
  int previous;

  Cell (int x_, int y_, int size_) {
    x = x_;
    y = y_;
    size = size_;

    state = int(random(2));
    previous = state;
  }

  void savePrevious() {
    previous = state;
  }

  void newState(int newState) {
    state = newState;
  }

  void display() {
    if(state == 1) {
      fill(255);
    } else {
      fill(#161c28);
    }
    noStroke();
    rect(x, y, size, size);
  }
}