int [][] mass;
int spacer=30;
int x=10;
int y=90;
int dx;
int dy;
boolean boo; 
boolean xboo;
boolean yboo;

int num = 20;
float mx[] = new float[num];
float my[] = new float[num];
int px;
void setup(){
size(201,201);
mass=new int[width][height/4];
 for (int j = 0; j < height/4; j += spacer) {
    for (int i = 0; i < width; i += spacer) {
      mass[i][j]=1;
    }}
}
void draw(){
 background(100);
 if (x<10 || x+10>200)  {if(!xboo) xboo=true;  else xboo=false;}
 if (y<10 )  {if(!yboo) yboo=true;  else yboo=false;}
  if (y>250) 
 { y=250;x=100;
  textSize(12);
  fill(220);    
text("Press mouse button", 45, 100);
fill(100);
}
 if(x>px && x<px+50 && y+10>180)  {if(!yboo) yboo=true;  else yboo=false;}
if (x>px && x<px+50 && y+10>182) {if(!yboo) yboo=true;  else yboo=false;}
if ((y+10>180 && x>px-10 && x<px) || 
(y+10>180 && x>px+50 && x<px+50+10))  {if(!xboo) xboo=true;  else xboo=false;}

 if(boo) {
 if(!xboo) dx=1; else dx=-1;
 if(!yboo) dy=-3; else dy=3;
 } 
 else {dx=0;dy=0;}
 if(dx==0) { textSize(12);
 fill(220);    //    //
text("Press mouse button", 45, 100);
fill(100);
}
x=x+dx;
 y=y+dy;
for (int j = 0; j < height/4; j += spacer) {
    for (int i = 0; i < width; i += spacer) {
     if(( x+10>i && x+10<i+20) || (x-10>i && x-10<i+20))
     if (( y-10>j && y-10<j+20) || ( y+10>j && y+10<j+20))
  if(mass[i][j]==1)   {mass[i][j]=0;
yboo=true;}
    }}
point_dro();

ellipse(x, y, 20, 20);
translate(px,0);
fill(100);
stroke(220);
line(0,180,50,180);
if(x>px && x<px+50 && y+10>180)  dy=-dy;
if (x>px && x<px+50 && y+10>182) dy=-dy;
if ((y+10>180 && x>px-10 && x<px) || 
(y+10>180 && x>px+50 && x<px+50+10)) dx=-dx;
}
void point_dro(){
 for (int j = 0; j < height/4; j += spacer) {
    for (int i = 0; i < width; i += spacer) {
      if(mass[i][j]==1)
      
      rect(i , j ,20,20);
    }}
}
void mousePressed() {
 x=10;
 y=90;
  if(!boo) boo=true;
  else boo=false;
}
void keyPressed() {
  if (key == CODED) {
    if(px<1) px=px+5;if(px+50>199) px=px-5;
    if (keyCode == LEFT) {
      px=px-5;
    } else if (keyCode == RIGHT) {
      px=px+5;
    } 
  }
}
   
