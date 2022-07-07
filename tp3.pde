
void inicializarEnemigos(){
  for (int i = 0; i < cantBolas; i++){
    enemX[i] = random(width - 30);
    enemY[i] = -random(height);
    enemV[i] = random(6) + 3;
  }
}

void setup(){
  puntos = 0;
  fondo = loadImage("leaf.jpg");
  enemigo = loadImage ("escarabajo.png");
  mariposa = loadImage("butterfly.png"); 
  enemX = new float[cantBolas];
  enemY = new float[cantBolas];
  enemV = new float[cantBolas];
  size(500 , 700);
  posGX = width / 2;
  posGY = height / 2 + 200;
  posFondo = height / 2;
  inicializarEnemigos();
}

void draw(){
  background(0);
  image(fondo, 0, posFondo, width, height);
  image(fondo, 0, posFondo - height, width, height);
  image(mariposa, posGX - 90, posGY - 60, 180, 120 );
  fill(255);  
  generarEnemigos();
  if (detectarColisiones()) {
    setup();
  }
  posFondo += 3;
  puntos += 1;
  if (posFondo >= height){
    posFondo = 0;
  }
  text("Puntos: " + puntos, 50, 50);
  if (puntos >= 1000){
    text("Ganaste bro", width / 2, height / 2);
    noLoop();
  }
}

void generarEnemigos(){
  for (int i = 0; i < cantBolas; i++){
    enemY[i] += enemV[i];
    if (enemY[i] > (height + 30)){
      enemX[i] = random(width - 30);
      enemY[i] = -random(height);
      enemV[i] = random(6) + 3; 
    }
    image (enemigo,enemX[i], enemY[i], 60, 60);
  }
}

boolean detectarColisiones(){
  boolean toco = false;
  for (int i = 0; i < cantBolas; i++){
    if (dist(enemX[i], enemY[i], posGX - 30, posGY) < 60)
      toco = true;
  }
  return toco;
}

void keyPressed(){
  if (keyCode == UP){
    if (posGY > height/2)
      posGY -= velG;
    else
      bajarEnemigos();
  }
  if (keyCode == DOWN){
    posGY += velG;
  }
  if (keyCode == LEFT){
    posGX -= velG;
  }
  if (keyCode == RIGHT){
    posGX += velG;
  }
  posGX = constrain(posGX, 25, width - 25);
  posGY = constrain(posGY, 0, height - 60);
}

void bajarEnemigos(){
  for (int i = 0; i < cantBolas; i++){
    enemY[i] += velG;
  }
  posFondo += velG;
  puntos += (int) (velG / 3);
}
