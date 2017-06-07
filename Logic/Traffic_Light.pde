float bx;
float by;
int boxSize = 75;
int Color = 153;
boolean overBox = false;
boolean locked = false;
void setup() {
  size(640, 360);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS);  
}
void draw() { 
  background(0);
fill(Color);
if(locked){
fill(255);
      }
  // Draw the box
  rect(bx, by, boxSize, boxSize);
}

void mousePressed() {
 if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
 
    if(!locked){    locked = true;}
    else {    locked = false;}
   }
 }
