import gifAnimation.*;

PShape sun, mercury, venus, earth, mars, moon, jupiter, ship;

float angleSun, angleMercury, angleEarth, angleVenus, angleMoon, angleJupiter, angleMars;

float x = 0;
float y = 0;

boolean upPressed,downPressed,leftPressed,rigthPressed,wPressed,aPressed,sPressed,dPressed;
private PVector posicion,direccion,vertical;

boolean mode;

PImage galaxia;
PImage sunImage, mercuryImage, venusImage, earthImage, moonImage, jupiterImage, marsImage, shipImage;

GifMaker ficherogif;


void drawSolarSystem(){
  
  beginShape();
  
  sun = createShape(SPHERE,60);
  sun.setStroke(255);
  sun.setTexture(sunImage);
  
  earth = createShape(SPHERE,12);
  earth.setStroke(255);
  earth.setTexture(earthImage);
  
  mercury = createShape(SPHERE,8);
  mercury.setStroke(255);
  mercury.setTexture(mercuryImage);
  
  venus = createShape(SPHERE,15);
  venus.setStroke(255);
  venus.setTexture(venusImage);
  
  moon = createShape(SPHERE,5);
  moon.setStroke(255);
  moon.setTexture(moonImage);
  
  jupiter = createShape(SPHERE,20);
  jupiter.setStroke(255);
  jupiter.setTexture(jupiterImage);
  
  mars = createShape(SPHERE,20);
  mars.setStroke(255);
  mars.setTexture(marsImage);
  
  ship = createShape(SPHERE,8);
  ship.setStroke(255);
  ship.setTexture(shipImage);
  
  endShape();
  
}



void setSolarSystemRotatio(){
  
  pushMatrix();
  rotateY(radians(angleSun));
  shape(sun);
  angleSun=(angleSun%360)+0.1;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleEarth));
  translate(175,0);
  rotateY(radians(angleEarth));
  shape(earth);
  text("Tierra", 11, 2);
  angleEarth=(angleEarth%360)+0.4;
  
  rotateZ(radians(angleMoon));
  translate(23, 0);
  rotateY(radians(angleMoon));
  shape(moon);
  text("Luna", 11, 2);
  angleMoon=(angleMoon%360)+0.2;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleMercury));
  translate(80,0);
  rotateY(radians(angleMercury));
  shape(mercury);
  text("Mercurio", 11, 2);
  angleMercury=(angleMercury%360)+0.8;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleVenus));
  translate(125,0);
  rotateY(radians(angleVenus)); 
  shape(venus);
  text("Venus", 15, 2);
  angleVenus=(angleVenus%360)+0.75;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleJupiter));
  translate(280,0);
  rotateY(radians(angleJupiter));
  shape(jupiter);
  text("Jupiter", 21, 2);
  angleJupiter=(angleJupiter%360)+0.2;
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(angleMars));
  translate(200,0);
  rotateY(radians(angleMars));
  shape(mars);
  text("Marte", 21, 2);
  angleMars=(angleMars%360)+0.2;
  popMatrix();
  
  if(!mode){
    pushMatrix();
    translate(100 + x, 100 + y);
    shape(ship);
    text("Ship", 21, 2);
    popMatrix();
  }
}

void keyPressed() {
  if((key == 'v') || (key == 'V') ){
      mode = true;
  }
  if((key == 'c') || (key == 'C') ){
      mode = false;
  }
  if((key == 'w') || (key == 'W') ){
      wPressed=true;
  }
  if((key == 's') || (key == 'S') ){
      sPressed=true;
  }
  if((key == 'a') || (key == 'A') ){
      aPressed=true;
  }
  if((key == 'd') || (key == 'D') ){
      dPressed=true;
  }
  
  if ( key == CODED) {
    if ( keyCode == UP) {
      upPressed=true;
    } else if ( keyCode == DOWN) { 
      downPressed=true;
    } else if ( keyCode == LEFT ) { 
      leftPressed=true;
    } else if ( keyCode == RIGHT) { 
      rigthPressed=true;
    }
  }
  if(mode == false){
    if((key == 'a') || (key == 'A') ){
      x = x - 20;
    }else if((key == 'd') || (key == 'D') ){
      x = x + 20;
    }else if((key == 'w') || (key == 'W') ){
      y = y - 20;
    }else if((key == 's') || (key == 'S') ){
      y = y + 20;
    }
  
    if((x+920)<=0){
    x = x + 10;
    }
    if((x+920)>=width){
      x = x - 10;
    }
    if((y+50)<=0){
      y = y + 10;
    }
    if((y+100)<=height){
      y = y - 10;
    }
  }
}

    
/*if (key == 'k' || key == 'K') {
    ficherogif.finish();
  }*/

void keyReleased() {
    if((key == 'w') || (key == 'W') ){
        wPressed=false;
    }
    if((key == 's') || (key == 'S') ){
        sPressed=false;
    }
    if((key == 'a') || (key == 'A') ){
        aPressed=false;
    }
    if((key == 'd') || (key == 'D') ){
        dPressed=false;
    }
    
    if ( key == CODED) {
      if ( keyCode == UP) {
        upPressed=false;
      } else if ( keyCode == DOWN) { 
        downPressed=false;
      } else if ( keyCode == LEFT ) { 
        leftPressed=false;
      } else if ( keyCode == RIGHT) { 
        rigthPressed=false;
      }
    }
  
}


void updateShipCamera(){
  if (wPressed) {
     posicion.add(PVector.mult(direccion, 5));
  }
     
  if (sPressed) {
    posicion.sub(PVector.mult(direccion, 5));
  }  
  if (aPressed) {
    PVector producto = new PVector();
    PVector.cross(direccion, vertical, producto);
    producto.normalize();
    posicion.sub(PVector.mult(producto, 5));
  }
     
  if (dPressed) {
    PVector producto = new PVector();
    PVector.cross(direccion, vertical, producto);
    producto.normalize();
    posicion.add(PVector.mult(producto, 5));
 }
  if(upPressed){
    y -= 1;
    y = y % 360;
  }
  if(downPressed){
    y += 1;
    y = y % 360;
  }
  if(leftPressed){
    x -= 1;
    x = x % 360;
  }
  if(rigthPressed){
    x += 1;
    x = x % 360;
  }
  PVector dir = new PVector(
       cos(radians(x)) * cos(radians(y)),
       sin(radians(y)),
       sin(radians(x)) * cos(radians(y))
  );
  dir.normalize();
  direccion = dir;
}

void setup()
{
  size(920,600,P3D);
  stroke(0);
  galaxia=loadImage("./images/galaxia.jpg");
  sunImage=loadImage("./images/sol.png");
  mercuryImage = loadImage("./images/mercurio.png");
  venusImage = loadImage("./images/venus.png");
  earthImage = loadImage("./images/tierra.png");
  moonImage = loadImage("./images/luna.png");
  marsImage = loadImage("./images/marte.png");
  jupiterImage = loadImage("./images/jupiter.png");
  shipImage = loadImage("./images/ship.png");
  drawSolarSystem();
  posicion = new PVector(width/2,height/2,150);
  direccion = new PVector(0,0,1);
  vertical = new PVector(0,1,0);
  mode = false;
  fill(255);
  noStroke();
  
  /*ficherogif = new GifMaker(this, "sistema_solar.gif");
  ficherogif.setRepeat(0);
  ficherogif.setTransparent(0,0,0);*/
  
}

void draw()
{
  background(galaxia);
  translate(width/2,height/2);
  setSolarSystemRotatio();
  text("Cambio de cámara a primera persona: V ",150,-250,1);
  text("Cambio de cámara a tercera persona: C ",150,-230,1);
  text("Controles: W A S D Flecha arriba Flecha abajo ",150,-210,1);

  
  if(mode){
     updateShipCamera();
     PVector dir = PVector.add(posicion,direccion);
     camera(posicion.x,posicion.y,posicion.z,
           dir.x,dir.y,dir.z,
           vertical.x,vertical.y,vertical.z);
    pushMatrix();
     translate(posicion.x,posicion.y,posicion.z);
     popMatrix();
   }else{
     camera();
   }
  
  /*ficherogif.setDelay(1);
  ficherogif.addFrame();*/
}
