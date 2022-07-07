//Link al video de Youtube: https: youtu.be/VttdsV3Rb6E 
// Comisión 1; Profesor: Bugiolachi, José Luis; Estudiante: MIRANDA, Bautista; Tecnología Multimedial I

void inicializarEnemigos() {
  for (int i = 0; i < cantBolas; i++) {
    enemX[i] = random(width - 30);
    enemY[i] = -random(height);
    enemV[i] = random(6) + 3;
  }
}

void setup() {
  puntos = 0;
  estado = 0;
  fondo = loadImage("leaf.jpg");
  enemigo = loadImage ("escarabajo.png");
  mariposa = loadImage("butterfly.png"); 
  enemX = new float[cantBolas];
  enemY = new float[cantBolas];
  enemV = new float[cantBolas];
  size(500, 700);
  posGX = width / 2;
  posGY = height / 2 + 200;
  posFondo = height / 2;
  inicializarEnemigos();
}

void draw() {
  background(0);
  if (estado == 0) {
    image(fondo, 0, 0, width, height);
    fill(128, 0, 64);
    textSize(35);
    textAlign(CENTER);
    text("Ayuda a Mariposa\na encontrar a su amiga", width / 2, height / 2 - 250);
    fill(160, 0, 80);
    textSize(25);
    text("Muevete con las flechas direccionales\nEsquiva los escarabajos", width/2, height/2 - 50);
    fill(255, 0, 0);
    circle(width/2, height - 200, 100);
    fill(255);
    textSize(20);
    text("Empezar", width/2, height- 190);
  }

  if (estado == 1) {

    image(fondo, 0, posFondo, width, height);
    image(fondo, 0, posFondo - height, width, height);
    image(mariposa, posGX - 90, posGY - 60, 180, 120 );
    fill(255);  
    generarEnemigos();
    if (detectarColisiones()) {
      estado = 3;
    }
    posFondo += 3;
    sumarPuntos(1);
    if (posFondo >= height) {
      posFondo = 0;
    }
  }

  if (estado == 2) {
    image(fondo, 0, 0, width, height);
    fill(128, 0, 64);
    textSize(35);
    textAlign(CENTER);
    text("Felicidades Cariño", width / 2, height / 2 - 250);
    fill(160, 0, 80);
    textSize(25);
    text("Has ayudado a Mariposa\na encontrar a su amiga", width/2, height/2 - 50);
    fill(255, 0, 0);
    circle(width/2, height - 200, 100);
    fill(255);
    textSize(20);
    text("Volver a\nJugar", width/2, height- 190);
  }

  if (estado == 3) {
    image(fondo, 0, 0, width, height);
    fill(128, 0, 64);
    textSize(35);
    textAlign(CENTER);
    text("Perdiste", width / 2, height / 2 - 250);
    fill(160, 0, 80);
    textSize(25);
    text("Te comió un bicho", width/2, height/2 - 50);
    fill(255, 0, 0);
    circle(width/2, height - 200, 100);
    fill(255);
    textSize(15);
    text("Reintentar", width/2, height- 190);
  }
}

void generarEnemigos() {
  for (int i = 0; i < cantBolas; i++) {
    enemY[i] += enemV[i];
    if (enemY[i] > (height + 30)) {
      enemX[i] = random(width - 30);
      enemY[i] = -random(height);
      enemV[i] = random(6) + 3;
    }
    dibujarEnemigo(enemX[i], enemY[i]);
  }
}

void dibujarEnemigo(float x, float y) {
  image (enemigo, x, y, 60, 60);
}


boolean detectarColisiones() {
  boolean toco = false;
  for (int i = 0; i < cantBolas; i++) {
    if (dist(enemX[i], enemY[i], posGX - 20, posGY) < 60)
      toco = true;
  }
  return toco;
}

void keyPressed() {
  if (keyCode == UP) {
    if (posGY > height/2)
      posGY -= velG;
    else
      bajarEnemigos();
  }
  if (keyCode == DOWN) {
    posGY += velG;
  }
  if (keyCode == LEFT) {
    posGX -= velG;
  }
  if (keyCode == RIGHT) {
    posGX += velG;
  }
  posGX = constrain(posGX, 60, width - 60);
  posGY = constrain(posGY, 0, height - 60);
}

void bajarEnemigos() {
  for (int i = 0; i < cantBolas; i++) {
    enemY[i] += velG;
  }
  posFondo += velG;
  sumarPuntos((int) velG / 3);
}

void sumarPuntos(int p) {
  puntos += p;
  if (puntos >= meta) {
    estado = 2;
  }
}

void mousePressed() {
  if (estado == 0) {
    if (dist(mouseX, mouseY, width/2, height - 200) < 100) {
      estado = 1;
    }
  }
  if ((estado == 2) || (estado == 3)) {
    if (dist(mouseX, mouseY, width/2, height - 200) < 100) {
      setup();
    }
  }
};
