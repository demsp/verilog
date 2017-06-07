float bx_switch;
float by_switch;
float bx_sign;
float by_sign;
int boxSize = 50;
int Grey = 153;
int White = 255;
boolean overBox = false;
boolean locked = false;

void setup() {
  size(640, 360);
  bx_switch = 100;
  by_switch = 100;
  bx_sign = 400;
  by_sign = 100;
  rectMode(RADIUS);  
}

void draw() { 
  background(0);
 println(locked);
fill(Grey);

if(locked){
fill(White);
      }
  // Draw the box
  rect(bx_switch, by_switch, boxSize, boxSize);
  rect(bx_sign, by_sign, boxSize, boxSize);
}

void mousePressed() {
   //locked = true; 
   // fill(255);
if (mouseX > bx_switch-boxSize && mouseX < bx_switch+boxSize && 
      mouseY > by_switch-boxSize && mouseY < by_switch+boxSize) {
 
    if(!locked){    locked = true;}
    else {    locked = false;}
    }
 }
