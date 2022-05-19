//estudiante: bautista miranda 
//profesor: josé luis bugiolachi
//tecnología multimedia I TPN1

void setup() {
  opacidad = 0;
  posV = -mX;
  fuente = createFont ("plakette-serial-bold.ttf", 80);
  Victoria = loadImage("pixlr-bg-result (3).png");
  Marisa = loadImage ("MarisaParedes.jpg");
  Miguel = loadImage ("miguelbose19.png");
  Ryuchi = loadImage ("ryuchiii.png"); 
  Pedro = loadImage ("pedro-almodovar.png");
  size(600, 400);
  textAlign (CENTER, CENTER);
  textFont (fuente);
  textSize (300);
  textLeading(0);
}

void draw() {
  background(0);
  if (etapa == 1) {
    fill (0, 0, 255, opacidad);
    text ("tacones", mX, mY);
    opacidad += 2.7;
    if (opacidad > (300)) {
      etapa++;
    }
  }

  if (etapa == 2) {
    fill (0, 0, 255, opacidad);
    text ("tacones", mX, mY );
    fill (255, 0, 0, 100 - opacidad);
    text ("lejanos", mX, mY );
    opacidad -= 1.1;
    if (opacidad < (-200)) {
      etapa++;
    }
  }

  if (etapa == 3) {
    image(Victoria, posV, 0);
    textSize(300);
    textAlign (CENTER, CENTER);
    fill (255, 0, 0, 100 - opacidad);
    text ("lejanos", mX, mY );
    textSize(140);
    textAlign (LEFT, CENTER);
    fill (255, 255, 0, opacidad);
    text ("victoria\nabril", 0, mY );
    opacidad += 1.7;
    posV += 3;
    if (posV > (600-323)) {
      etapa++;
    }
  }

  if (etapa == 4) {
    image(Victoria, posV, 0);
    textSize(140);
    fill (255, 255, 0, opacidad);
    textAlign (LEFT, CENTER);
    text ("victoria\nabril", 0, mY );
    opacidad += 1.5;
    if (opacidad > 200) {
      etapa ++;
    }
  }
  if (etapa == 5) {
    image(Victoria, posV, 0);
    textSize(140);
    fill (255, 255, 0, opacidad);
    textAlign (LEFT, CENTER);
    text ("victoria\nabril", 0, mY );
    image(Marisa, posV/4 + 505, 0);
    textSize(300);
    textAlign (CENTER, CENTER);
    textSize(140);
    fill (255, 0, 0, 200 - opacidad);
    textAlign (LEFT, CENTER);
    text ("marisa\nparedes", 0, mY );
    opacidad -= 2.0;
    posV -= 8;
    if (opacidad < -400) {
      etapa ++;
      opacidad = -10;
      posV = 0;
    }
  }
  if (etapa == 6) {
    image(Miguel, posV + 200, 0);
    textSize(300);
    textAlign (CENTER, CENTER);
    fill (255, 0, 0, 100 - opacidad);
    textSize(140);
    fill (199,36,177, opacidad);
    textAlign (LEFT, CENTER);
    text ("miguel\nbosé", 0, mY );
    opacidad += 2.1;
    posV += 0.6;
    if (opacidad > 600) {
      etapa ++;
      posV = 0;
    }
  }
  if (etapa == 7) {
    image(Ryuchi, 200 - posV, 70);
    textAlign (CENTER, CENTER);
    fill (219,62,177, 100 - opacidad);
    textSize(140);
    fill (255,173,0, opacidad);
    textAlign (LEFT, CENTER);
    textLeading(140);
    text ("música:\nryuichi\nsakamoto", 0, mY );
    opacidad += 2.1;
    posV -= 0.6;
    if (opacidad > 1000) {
      etapa ++;
      posV = 0;
    }
  }
  if (etapa == 8) {
    image(Pedro, 400 - posV, 70, 400, 400);
    textSize(300);
    textAlign (CENTER, CENTER);
    fill (255, 87, 51 - opacidad);
    textSize(140);
    fill (70, 255, 0, opacidad);
    textAlign (LEFT, CENTER);
    textLeading(140);
    text ("dirección: \npedro\nalmodovar", 0, mY );
    opacidad += 2.1;
    posV += 0.6;
    if (opacidad > 2000) {
      etapa ++;
    }
  }

  if (etapa > 1)
    circle(600 - diam/2, 400 - diam/2, diam);
}

//botón 
void mouseClicked() {
  float distX = (600 - diam/2) - mouseX;
  float distY = (400 - diam/2) - mouseY;
  float distR = sqrt(distX * distX + distY * distY);

  if ((distR <= diam/2) && !(etapa <= 2)) {
    setup();
    etapa = 1;
  }
}
