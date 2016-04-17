PImage platform,pers; 
int wideCount = 4;
int highCount = 3;
int count;
int px, py =0;
float dy;
Module[] mods;

void setup() {
 frameRate(40); 
 platform = loadImage("platform.bmp");
 pers = loadImage("pers.bmp");
  size(300,400);
   count = wideCount * highCount;
   mods = new Module[count];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
   for (int x = 0; x < wideCount; x++) {
        mods[index++] = new Module(x,y);
    }
  }
}

void draw() {
  dy=dy+0.9;
 int rdy=round(dy);
  py=py+rdy;
    background(0);
  image(pers,px,py);
  for (Module mod : mods) {
   mod.display();
 if (py>0) 
   {
   py = 20;
     mod.y=mod.y-rdy;
     if (mod.y>400)
   {
   mod.y=0;
   mod.x=round(random(200));
   }
      }

    if ((px+50>mod.x) && (px+20<mod.x+68) && (py+60>mod.y) && (py+60<mod.y+14) && (dy>0)) dy=-18;
     }
}
void keyPressed() {
   if (key == CODED) {
    if (keyCode == LEFT) {
        px=px-20;
    } else if (keyCode == RIGHT) {
          px=px+20;
    } 
  }
}
class Module {
  int x, y;
  // Contructor
  Module(int xTemp, int yTemp ) {
    x = xTemp;
    y = yTemp;
 x =int(random(300));
 y= int(random(400));
      }
 // Custom method for drawing the object
  void display() {
    fill(255);
    image(platform,x,y);
  
     }
}
