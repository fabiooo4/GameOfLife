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
    // if(state == 1) {
    //   fill(255);
    // } else {
    //   fill(#161c28);
    // }

    if(previous == 1 && state == 1) { // Stall
      fill(255);
    } else if (previous == 0 && state == 1){ // Birth
      fill(#B1DCFF);
    } else if (previous == 1 && state == 0) { // Death
      fill(#271625);
    } else { // Background
      fill(#161c28);
    }

    noStroke();
    rect(x, y, size, size);
  }
}