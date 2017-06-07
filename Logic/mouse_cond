int col=50; 

float bx;
float by;
int boxSize = 75;
boolean overBox = false;

void setup() {
  size(640, 360);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}

void draw() { 
  background(0);

  fill(col);

  // Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    col=100;
   }
   // Draw the box
  rect(bx, by, boxSize, boxSize);
}

void mousePressed() {
     col= 200;
}
