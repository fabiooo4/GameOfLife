class GOL {
  int size = 10;
  int cols;
  int rows;

  Cell[][] grid;

  GOL() {
    cols = width/size;
    rows = height/size;
    grid = new Cell[cols][rows];
    init();
  }

  void init() {
    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        grid[y][x] = new Cell(x*size, y*size, size);
      }
    }
  }

  void generate() {
    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        grid[y][x].savePrevious();
      }
    }

    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        int neighbors = 0;
        for (int i = -1; i <= 1; ++i) {
          for (int j = -1; j <= 1; ++j) {
            neighbors += grid[(x+i+cols)%cols][(y+i+rows)%rows].previous;
          }
        }
      }
    }
  }

  void display() {
    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        grid[y][x].display();
      }
    }
  }
}