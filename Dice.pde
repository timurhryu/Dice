Die aDie;
int rows = 3;
int cols = 3;
int total = 0;
//int screenWidth = 800;
//int screenHeight = 500;


void setup() {
  size(1000, 700);
  noLoop();
}

void draw() {
  total = 0;

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      Die aDie = new Die();
      aDie.roll();
      aDie.draw((width/cols)*x, (height/rows)*y, width/cols, height/rows);
      total += aDie.getCurrentValue();
    }
  }
  

  textSize(40);
  text("Total = " + String.valueOf(total), width*0.45, height*0.4);

  //System.out.println(total);
}

void mouseClicked(){
   redraw();
}

	class Die {
  int faces;
  int value;
  int r, g, b, a;
  int wid, hig;

  Die() { //constructor
    faces = 6;
    wid = 20;
    hig = 20;
    r = (int) (Math.random()*256);
    g = (int) (Math.random()*256);
    b = (int) (Math.random()*256);
    a = (int) (Math.random()*956);
    value = 0;
  }

  int roll() { // roll the die
    value = (int) (Math.random() * faces) +1;
    return value;
  }
  
  int getCurrentValue() {
    return value;
  }
  
  void draw(int x, int y, int width, int height) {
    fill(r*2, g*2, b*2, a*2);
    rect(x, y, width, height);
    for (int i = 0; i < value; i++) {
      fill(r, g, b, a/2);
      ellipse(x + width/(value + 1)*(i + 1), y + height/(value + 1)*(i + 1), wid, hig);
    }
  }

  // print state to console
  void print() {
    System.out.println("current value: " + value);
  }
}

