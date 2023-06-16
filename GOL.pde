class GOL {
  int size = 20;
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
        grid[x][y].savePrevious();
      }
    }

    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {

        int neighbors = 0;
        for (int i = -1; i <= 1; ++i) {
          for (int j = -1; j <= 1; ++j) {
            neighbors += grid[(x+i+cols)%cols][(y+j+rows)%rows].previous;
          }
        }

        neighbors -= grid[x][y].previous;

        //? Debug
        // fill(0);
        // textSize(size);
        // text(neighbors, x*size, y*size + size);

        // Game of life rules
        if      ((grid[x][y].state == 1) && (neighbors <  2)) grid[x][y].newState(0);
        else if ((grid[x][y].state == 1) && (neighbors >  3)) grid[x][y].newState(0);
        else if ((grid[x][y].state == 0) && (neighbors == 3)) grid[x][y].newState(1);
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