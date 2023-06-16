/* autogenerated by Processing revision 1292 on 2023-06-16 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class GameOfLife extends PApplet {

GOL gol;

public void setup() {
  background(0xFF161C28);
  /* size commented out by preprocessor */;
  gol = new GOL();
}

public void draw() {
  background(0xFF161C28);
  gol.display();
}
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

    state = PApplet.parseInt(random(2));
    previous = state;
  }

  public void savePrevious() {
    previous = state;
  }

  public void display() {
    if(state == 1) {
      fill(255);
    } else {
      fill(0xFF161C28);
    }
    noStroke();
    rect(x, y, size, size);
  }
}
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

  public void init() {
    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        grid[y][x] = new Cell(x*size, y*size, size);
      }
    }
  }

  public void generate() {
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

  public void display() {
    for (int y = 0; y < rows; ++y) {
      for (int x = 0; x < cols; ++x) {
        grid[y][x].display();
      }
    }
  }
}


  public void settings() { size(800, 800); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GameOfLife" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
