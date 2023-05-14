//Estudiante: MIRANDA, Bautista
//Profesor: BEDOIAN, David
//Comisión: 3
//TrabajoPráctico: 1

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PFont letra;
int estado;
float x;

void setup() {
  size(640, 480);
  estado = 0;
  letra = loadFont("Orbitron-Bold-48.vlw");
  img1 = loadImage("MessaDiVoce01.jpg");
  img2 = loadImage("MessaDiVoce02.jpg");
  img3 = loadImage("MessaDiVoce03.jpg");
  img4 = loadImage("MessaDiVoce04.jpg");
  img5 = loadImage("tecla-r.png");
  x = 0;
}

void draw() {
  background(255);

  if (estado == 0) {
    image(img1, -40, 0);
    fill(0);
    textFont(letra);
    textSize(40);
    text("Messa Di Voce", 320, 220);
    textAlign(CENTER, CENTER);
  } else if (estado == 1) {
    fill(0);
    image(img2, CENTER, CENTER, 630, 480);
    textSize(25);
    fill(x*255/640); //regla de tres
    text("Es una obra de arte interactiva,\n combina la voz, el movimiento y la tecnología \n para crear una experiencia \n única.", x, 200, CENTER);

    x += 3;

    if (x > width+300) {
      estado = 2;
      x = 1000;
    }
  } else if (estado == 2) {

    image(img3, CENTER, CENTER, 640, 480);
    fill(250);
    textSize(17);
    text("Invita a explorar la expresión vocal de una manera innovadora.\n Mediante sensores de movimiento y software personalizado,\n transforma las voces en patrones visuales en tiempo real.", x, 250);
    x -= 2;
    if (x < -10) {
      estado = 3;
      x = 0;
    }
  } else if (estado == 3) {
    image(img4, CENTER, CENTER, 635, 480);
    fill(255);
    textSize(19);
    text("La instalación ha dejado una fuerte impresión\nen la escena del arte electrónico e interactivo,\n siendo reconocida por su innovación\ny su capacidad para involucrar a los espectadores", 350, x, CENTER);

    x += 2;
    if (x > height+200) { 
      estado = 4;
    }
  } 

  if (estado == 4) {
    
image (img5, CENTER, CENTER+25);
background (255);
fill (0);
textSize(25);
textAlign(CENTER, CENTER);
    text("Presiona la tecla R para reiniciar", width/2, height/2);
  }
}

void keyPressed() {  
  if (estado == 4) { 
    if (key == 'r' || key == 'R') {
      reiniciarPresentacion();
    }
  }
}

void reiniciarPresentacion() {
  estado = 0;
  x = 0;
}

void mousePressed() {
  if (estado == 0) {
    estado = 1;
    x = -300;
  } else if (estado == 1) {
    estado = 2;
  }
}
