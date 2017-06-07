Spot sp1;
int Size = 100;

void setup() {
size(640, 360);
  background(204);
 // noLoop();
  // Run the constructor without parameters
  sp1 = new Spot();
  rectMode(RADIUS);  
}

void draw() { 
  sp1.display();
  println(Size);

}

 void mousePressed() {
Size= Size + 10;
  }

class Spot {
  float dx, dy, boxSize, Color;
  
  // First version of the Spot constructor;
  // the fields are assigned default values
  Spot() {
    Color = 155;
    //boxSize = 80;
    boxSize = Size;
    dx = width*0.25;
    dy = height*0.5;
  }
  
  // Second version of the Spot constructor;
  // the fields are assigned with parameters
 // Spot(float xpos, float ypos, float r,float xColor) {
    Spot(float xpos, float ypos, float r) {
    dx = xpos;
    dy = ypos;
    boxSize = r;
    //Color = xColor;
  }
 
 
  void display() {
    // rect(dx, dy, boxSize, boxSize);
    rect(dx, dy, Size, Size);
   }
  
}
