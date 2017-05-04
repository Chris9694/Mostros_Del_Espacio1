import ddf.minim.*;

float x;
float y;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;

Minim minim;
AudioSample golpe1, golpe2, golpex,
resultado, premio, fondo; 

Mostro brocoli;
Mostro foco;
Mostro horno;
Mostro magisun;
Mostro ojo;
Mostro mostro1;
Mostro mostro2;

PImage bro, foc, hor, mag, eye, 
  bro1, foc1, hor1, mag1, eye1, 
  titulo, inst, sel, fb, fl, h, ms, 
  fe, com, bu, cha, cho, co, 
  pa, po, pr, ta, proyectil;

PFont title;
int turno = 0;
int pantalla = 0;
int mos1, mos2;
int hbarra = 40;
int hturno = 25;

int a = 100;
int b = 100;

color a1 = #4682B4;
color a2 = #0000ff;
color r1 = #E57971;
color r2 = #ff0000;

float r = random(0,8);
    
void setup() {
 
  size (1280, 680);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0, -10);

  // Create ArrayLists  
  boxes = new ArrayList<Box>();
  //MOSTROS
  brocoli = new Mostro("Funky Brocoli", 500, 28, 29, 30, 0);
  foco = new Mostro("Foco Loco", 500, 28, 28, 31, 1);
  horno = new Mostro("Hornitorrinco", 500, 28, 28, 39, 2);
  magisun = new Mostro("Magi-sun", 500, 28, 29, 32, 3);
  ojo = new Mostro("Fly Eye", 500, 28, 29, 39, 4);

  //IMAGENES
  bro = loadImage("brocoli.png");
  foc = loadImage("foco.png");
  hor = loadImage("hornitorrinco.png");
  mag = loadImage("magisun.png");
  eye = loadImage("ojo.png");

  bro1 = loadImage("brocoli1.png");
  foc1 = loadImage("foco1.png");
  hor1 = loadImage("hornitorrinco1.png");
  mag1 = loadImage("magisun1.png");
  eye1 = loadImage("ojo1.png");

  fb = loadImage("fb.png");
  fl = loadImage("fl.png");
  h = loadImage("h.png");
  ms = loadImage("ms.png");
  fe = loadImage("fe.png");

  titulo = loadImage("titulo.jpg");
  inst = loadImage("fondo1.jpg");
  sel = loadImage("fondo2.jpg");
  com = loadImage("fondo3.jpg");

  bu = loadImage("buki.png");
  cha = loadImage("chalino.jpg"); 
  cho = loadImage("chorizo.png"); 
  co = loadImage("coca.png");
  pa = loadImage("pau.png");
  po = loadImage("pollo.png");
  pr = loadImage("pri.png"); 
  ta = loadImage("taco.png");
  
  proyectil = loadImage("proyectil.png");
 
 //TEXTO
  title = createFont("Supersonic Rocketship.ttf", 200);


  //AUDIO
  minim = new Minim(this);
  golpe1 = minim.loadSample("golpe1.mp3",1024);
  golpe2 = minim.loadSample("golpe2.mp3",1024);
  golpex = minim.loadSample("golpex.mp3",1024);
  resultado = minim.loadSample("resultado.mp3",1024);
  premio = minim.loadSample("premio.mp3",1024);
  fondo = minim.loadSample("X.mp3",1024);

  fondo.trigger();
}

void draw() {
  
  
  switch(pantalla) {
  case 0:
    titulo();
    break;

  case 1:
    instrucciones();
    break;

  case 2:
    seleccion();
    break;

  case 3:
    seleccion1();
    break;

  case 4:
    duelo();
     box2d.step();
  for (Box b: boxes) {
    b.display();
  
  }
    break;

  case 5:
    resultado();
    break;

  case 6:
    premio();
    break;
  }
}

void titulo() {
  background(0);
  pushMatrix();
  scale(0.8);
  image(titulo, -170, 0);
  popMatrix();
  fill(#0077cc);
  textFont(title);
  textSize(100);
  text("Mostros del", 340, 300);
  textSize(173);
  text("Espacio", 340, 470);
  fill(#ff0500);
  textSize(100);
  text("Mostros del", 350, 310);
  textSize(173);
  text("Espacio", 350, 480);
  fill(#ffff00);
  textSize(100);
  text("Mostros del", 360, 320);
  textSize(173);
  text("Espacio", 360, 490);
  rectMode(CENTER);
  noStroke();
  fill(#000fff);
  rect(640, 630, 240, 30);
  fill(0);
  textSize(20);
  text("Click para Continuar", 545, height-42);
  if (mousePressed) {
    pantalla = 1;
  }
}

void instrucciones() {
  pushMatrix();
  scale(0.4);
  image(inst, 0, 0);
  popMatrix();
  textFont(title);
  textSize(100);
  fill(255);
  text("Instrucciones", 350, 120);
  textSize(50);
  fill(#0000ff);
  text("Jugador 1", 120, 220);
  fill(255);
  text("Golpe 1:  A", 120, 320);
  text("Golpe 2:  S", 120, 420);
  text("Golpe especial:  D", 120, 520);
  fill(#ff0000);
  text("Jugador 2", 860, 220);
  fill(255);
  text("Golpe 1:  L", 860, 320);
  text("Golpe 2:  K", 860, 420);
  text("Golpe especial:  J", 860, 520);
  textSize(40);
  fill(#ff00ff);
  text("Pulsa C para continuar", 450, 620);

  if (keyPressed) {
    if (key == 'c') {
      pantalla  = 2;
    }
  }
}

void seleccion() {
  pushMatrix();
  scale(0.7);
  image(sel, 0, 0);
  popMatrix();
  textFont(title);
  textSize(70);
  fill(255);
  text("Selección Jugador 1", 370, 80);
  textSize(30);
  fill(0);
  text("Arrastra el cursor y suelta sobre el cuadro", 160, 120);
  text("para seleccionar", 875, 120);
  fill(#0000ff);
  text("AZUL", 795, 120); 
  textSize(40);
  fill(0);
  pushMatrix();
  scale(0.5);
  image(fb, 240, 315);
  popMatrix();
  text("Funky Brocoli", 90, 340);
  pushMatrix();
  scale(0.35);
  image(fl, 1560, 720);
  popMatrix();
  text("Foco Loco", 545, 440);
  pushMatrix();
  scale(0.4);
  image(h, 2400, 320);
  popMatrix();
  text("Hornitorrinco", 960, 340);
  pushMatrix();
  scale(0.3);
  image(ms, 790, 1400);
  popMatrix();
  text("Magi-sun", 230, 640);
  pushMatrix();
  scale(0.4);
  image(fe, 2040, 950);
  popMatrix();
  text("Fly Eye", 870, 640);
  fill(#0000ff);
  rect(340, 200, 40, 40);//br
  rect(770, 300, 40, 40);//fl
  rect(1220, 200, 40, 40);//h
  rect(500, 500, 40, 40);//ms
  rect(1100, 500, 40, 40);//fe
  fill(#ff0000);
  rect(340, 260, 40, 40);//br
  rect(770, 360, 40, 40);//fl
  rect(1220, 260, 40, 40);//h
  rect(500, 560, 40, 40);//ms
  rect(1100, 560, 40, 40);//fe
  //brocoli
  if (mouseX > 320 && mouseX < 360 && mouseY > 180 && mouseY < 220) {
    mostro1 = brocoli;
    mos1 = 0;
    pantalla = 3;
  }
  //foco
  if (mouseX > 750 && mouseX < 790 && mouseY > 280 && mouseY < 320) {
    mostro1 = foco;
    mos1 = 1;
    pantalla = 3;
  }
  //hornitorrinco
  if (mouseX > 1200 && mouseX < 1240 && mouseY > 180 && mouseY < 220) {
    mostro1 = horno;
    mos1 = 2;
    pantalla = 3;
  }
  //magisun
  if (mouseX > 480 && mouseX < 520 && mouseY > 480 && mouseY < 520) {
    mostro1 = magisun;
    mos1 = 3;
    pantalla = 3;
  }
  //fly eye
  if (mouseX > 1080 && mouseX < 1120 && mouseY > 480 && mouseY < 520) {
    mostro1 = ojo;
    mos1 = 4;
    pantalla = 3;
  }
}


void seleccion1() {
  pushMatrix();
  scale(0.7);
  image(sel, 0, 0);
  popMatrix();
  textFont(title);
  textSize(70);
  fill(255);
  text("Selección Jugador 2", 370, 80);
  textSize(30);
  fill(0);
  text("Arrastra el cursor y suelta sobre el cuadro", 160, 120);
  text("para seleccionar", 875, 120);
  fill(#ff0000);
  text("ROJO", 795, 120);
  textSize(40);
  fill(0);
  pushMatrix();
  scale(0.5);
  image(fb, 240, 315);
  popMatrix();
  text("Funky Brocoli", 90, 340);
  pushMatrix();
  scale(0.35);
  image(fl, 1560, 720);
  popMatrix();
  text("Foco Loco", 545, 440);
  pushMatrix();
  scale(0.4);
  image(h, 2400, 320);
  popMatrix();
  text("Hornitorrinco", 960, 340);
  pushMatrix();
  scale(0.3);
  image(ms, 790, 1400);
  popMatrix();
  text("Magi-sun", 230, 640);
  pushMatrix();
  scale(0.4);
  image(fe, 2040, 950);
  popMatrix();
  text("Fly Eye", 870, 640);
  fill(#0000ff);
  rect(340, 200, 40, 40);//br
  rect(770, 300, 40, 40);//fl
  rect(1220, 200, 40, 40);//h
  rect(500, 500, 40, 40);//ms
  rect(1100, 500, 40, 40);//fe
  fill(#ff0000);
  rect(340, 260, 40, 40);//br
  rect(770, 360, 40, 40);//fl
  rect(1220, 260, 40, 40);//h
  rect(500, 560, 40, 40);//ms
  rect(1100, 560, 40, 40);//fe
  //brocoli
  if (mouseX > 320 && mouseX < 360 && mouseY > 240 && mouseY < 280) {
    mostro2 = brocoli;
    mos2 = 0;
    pantalla = 4;
  }
  //foco
  if (mouseX > 750 && mouseX < 790 && mouseY > 340 && mouseY < 380) {
    mostro2 = foco;
    mos2 = 1;
    pantalla = 4;
  }
  //hornitorrinco
  if (mouseX > 1200 && mouseX < 1240 && mouseY > 240 && mouseY < 280) {
    mostro2 = horno;
    mos2 = 2;
    pantalla = 4;
  }
  //magisun
  if (mouseX > 480 && mouseX < 520 && mouseY > 540 && mouseY < 580) {
    mostro2 = magisun;
    mos2 = 3;
    pantalla = 4;
  }
  //fly eye
  if (mouseX > 1080 && mouseX < 1120 && mouseY > 540 && mouseY < 580) {
    mostro2 = ojo;
    mos2 = 4;
    pantalla = 4;
  }
}

void duelo() {
  //DIBUJA AL PERSONAJE SELECCIONADO
  noStroke();
  image(com, -350, -60);
  if (mos1 == 0) {
    pushMatrix();
    translate(-70, 150);
    brocoli.Dibujo1();
    popMatrix();
  }
  if (mos2 == 0) {
    pushMatrix();
    translate(650, 150);
    brocoli.Dibujo();
    popMatrix();
  }
  if (mos1 == 1) {
    pushMatrix();
    translate(50, 150);
    foco.Dibujo1();
    popMatrix();
  }
  if (mos2 == 1) {
    pushMatrix();
    translate(840, 150);
    foco.Dibujo();
    popMatrix();
  }
  if (mos1 == 2) {
    pushMatrix();
    translate(0, 250);
    scale(0.7);
    horno.Dibujo1();
    popMatrix();
  }
  if (mos2 == 2) {
    pushMatrix();
    translate(800, 250);
    scale(0.7);
    horno.Dibujo();
    popMatrix();
  }
  if (mos1 == 3) {
    pushMatrix();
    translate(-40, 200);
    scale(0.8);
    magisun.Dibujo();
    popMatrix();
  }
  if (mos2 == 3) {
    pushMatrix();
    translate(760, 200);
    scale(0.8);
    magisun.Dibujo1();
    popMatrix();
  }
  if (mos1 == 4) {
    pushMatrix();
    translate(-20, 150);
    scale(0.8);
    ojo.Dibujo();
    popMatrix();
  }
  if (mos2 == 4) {
    pushMatrix();
    translate(740, 150);
    scale(0.8);
    ojo.Dibujo1();
    popMatrix();
  }

  //MARCADOR DE TURNOS
  if (turno == 0) {
    fill(#0000ff);
    textSize(hturno);
    text("TU TURNO", 10, 130);
  } else {
    fill(#ff0000);
    textSize(hturno);
    text("TU TURNO", 790, 130);
  }

  //BARRAS DE VIDA Y NOMBRES
  //NOMBRE 1
  if (turno == 0) {
    fill(a1);
  } else {
    fill(a2);
  }
  rect(0, 0, 1000, 150);
  textSize(40);
  fill(255);
  text(mostro1.nombre, 190, 50);

  //NOMBRE 2
  if (turno == 1) {
    fill(r1);
  } else {
    fill(r2);
  }
  rect(1030, 0, 500, 150);

  fill(255);
  text(mostro2.nombre, 830, 50);

  //MOSTRO 1 VIDA
  if (mostro1.vida >= 0 && mostro1.vida <= 100) {
    fill(#ff0000);
  } else if (mostro1.vida > 100 && mostro1.vida <= 250) {
    fill(#ffff00);
  } else {
    fill(#00ff00);
  }
  rect(280, 80, mostro1.vida, hbarra);

  //MOSTRO 2 VIDA
  if (mostro2.vida >= 0 && mostro2.vida <= 100) {
    fill(#ff0000);
  } else if (mostro2.vida > 100 && mostro2.vida <= 250) {
    fill(#ffff00);
  } else {
    fill(#00ff00);
  }
  rect(1000, 80, mostro2.vida, hbarra);

  //PUNTOS DE VIDA
 
  if (turno == 0) {
    if (keyPressed) {
      if (key == 'a') {
        golpe1.trigger();
        a = a + 200;
        mostro2.vida = mostro2.vida- mostro1.hit1;
        turno = 1;
       
      } 
      else if (key == 's') {
        golpe2.trigger();
        a = a + 200;
        mostro2.vida = mostro2.vida - mostro1.hit2;
        turno = 1;
      } 
      else if (key == 'd') {
        golpex.trigger();
        mostro2.vida = mostro2.vida - mostro1.hitx;
        turno = 1;
      }
    }
  }

  if (turno == 1) {
    if (keyPressed) {
      if (key == 'l') {
        golpe1.trigger();
        b = b - 200;
        mostro1.vida = mostro1.vida- mostro2.hit1;
        turno = 0;
      } 
      else if (key == 'k') {
        golpe2.trigger();
        b = b - 200;
        mostro1.vida = mostro1.vida - mostro2.hit2;
        turno = 0;
      } 
      else if (key == 'j') {
        golpex.trigger();
        mostro1.vida = mostro1.vida - mostro2.hitx;
        turno = 0;
      }
    }
  }
 
  if (mostro1.vida <= 0 || mostro2.vida <= 0) {
    hbarra = 0;
    hturno = 1;
    a1 = a2;
    r1 = r2;
    fill(#ff00ff);
    textSize(150);
    text("FIN DEL COMBATE", width/2-550, height/2+50);
    fill(#0077cc);
    text("FIN DEL COMBATE", width/2-540, height/2+40);
    fill(#ffff00);
    text("FIN DEL COMBATE", width/2-530, height/2+30);
    textSize(50);
    fill(0);
    text("Pulsa C para continuar", width/2-260, height-40);
    if (keyPressed) {
      if (key == 'c')
      {
        fondo.stop();
        resultado.trigger();
        pantalla = 5;
      }
    }
  }
}

void resultado() {
  noStroke();
  background(#ffff00);
  ellipseMode(CENTER);
  fill(#ff77cc);
  ellipse(width/2, height/2, 1000, 1000);
  fill(#E57971);
  ellipse(width/2, height/2, 800, 800);
  fill(#ff00ff);
  ellipse(width/2, height/2, 600, 600);
  fill(#ff00cc);
  ellipse(width/2, height/2, 400, 400);

  textSize(70);
  fill(#0000ff);
  text("Felicidades", 30, 100);
  text("Has Ganado", 160, 300);

  if (mostro1.vida > 0) {
    textSize(70);
    text(mostro1.nombre, 80, 200);
    pushMatrix();
    translate(500, 80);
    mostro1.Dibujo();
    popMatrix();
  } else {
    textSize(70);
    text(mostro2.nombre, 80, 200);
    pushMatrix();
    translate(500, 80);
    mostro2.Dibujo();
    popMatrix();
  }

  fill(0);
  textSize(40);
  text("pulsa P para ver tu premio", width/2-270, height-40);
  if (keyPressed) {
    if (key == 'p') {
      premio.trigger();
      pantalla = 6;
    }
  }
}

void premio() {
  noStroke();
  background(#ffff00);
  ellipseMode(CENTER);
  fill(#ff77cc);
  ellipse(width/2, height/2, 1000, 1000);
  fill(#E57971);
  ellipse(width/2, height/2, 800, 800);
  fill(#ff00ff);
  ellipse(width/2, height/2, 600, 600);
  fill(#ff00cc);
  ellipse(width/2, height/2, 400, 400);

  textSize(90);
  fill(#0000ff);
  text("Has Ganado", 30, 100);

  if (r >= 0 && r <1) {
    pushMatrix();
    scale(0.6);
    translate(650, 80);
    image(bu, 200, 200);
    popMatrix();
    textSize(60);
    text("Una estampita de Jesús", width/2-300, height-80);
  } else if (r >= 1 && r < 2) {
    pushMatrix();
    scale(0.9);
    translate(300, -30);
    image(cha, 200, 200);
    popMatrix();
    textSize(60);
    text("Un disco de Chalino", width/2-250, height-80);
  } else if (r >= 2 && r < 3) {
    pushMatrix();
    scale(0.7);
    translate(300, -90);
    image(cho, 200, 200);
    popMatrix();
    textSize(60);
    text("1Kg de Chorizo", width/2-185, height-80);
  } else if (r >= 3 && r < 4) {
    pushMatrix();
    scale(0.5);
    image(co, width/2+140, 180);
    popMatrix();
    textSize(60);
    text("Una Coca de 3 lts", width/2-230, height-80);
  } else if (r >= 4 && r < 5) {
    pushMatrix();
    scale(0.5);
    image(pa, width/2+170, 200);
    popMatrix();
    textSize(60);
    text("Un Pau-Pau", width/2-145, height-80);
  } else if (r >= 5 && r < 6) {
    pushMatrix();
    image(po, width/2-160, 250);
    popMatrix();
    textSize(60);
    text("Una caja de Riko Pollo", width/2-320, height-80);
  } else if (r >= 6 && r < 7) {
    pushMatrix();
    image(pr, 400, 150);
    popMatrix();
    textSize(60);
    text("Un exclusivo lunch-pack", width/2-335, height-80);
  } else if (r >= 7 && r < 8) {
    pushMatrix();
    image(ta, 370, 200);
    popMatrix();
    textSize(60);
    text("Un taco al pastor", width/2-230, height-80);
  }



  fill(0);
  textSize(40);
  text("pulsa I para reiniciar", width/2-180, height-40);

  //AQUI RESETEAMOS TODAS LAS VARIABLES QUE SE HAN MODIFICADO
  if (keyPressed) {
    if (key == 'i') {
      fondo.trigger();
      hbarra = 40; 
      hturno = 25;

      a1 = #4682B4;
      a2 = #0000ff;
      r1 = #E57971;
      r2 = #ff0000;

      turno = 0;
      pantalla = 0;
      
      r= random(0,8);
      println(int(r));

      brocoli = new Mostro("Funky Brocoli", 500, 28, 29, 30, 0);
      foco = new Mostro("Foco Loco", 500, 28, 28, 31, 1);
      horno = new Mostro("Hornitorrinco", 500, 28, 28, 39, 2);
      magisun = new Mostro("Magi-sun", 500, 28, 29, 32, 3);
      ojo = new Mostro("Fly Eye", 500, 28, 29, 39, 4);
    }
  }
}

void keyReleased(){
 
  
if(key == 'a' || key == 's' || key == 'l' || key == 'k'){
a = 100;
b = 100;
}
if(key == 'j'){
   
    Box p = new Box(50);
    boxes.add(p);
    x = 500;
    y = 0;
}


if(key == 'd'){
   
    Box p = new Box(50);
    boxes.add(p);
    x =  -500;
    y = 0;
}

}