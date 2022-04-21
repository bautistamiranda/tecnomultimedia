//Bautista Miranda; Comisión 1, Tecnología Multimedial 1,// 
void setup() {
  background(0);
  size(800, 800);
}

void draw() {
  trianguloDeCirculos(153, 275, 280, 139, 70, 100, width / 12);
  trianguloDeCirculos(width - 153, 275, width - 280, 139, width - 70, 100, width / 12);
  fill (255);
  circle (width/2, height/2, width *3/4);
  noFill();
  strokeWeight (height * 0.075);
  stroke(200, 0, 0);
  arc (width/2, height/2 + height/10, width/3, height/4, 0, PI);
  line(width/2 - width/6, height/2 + height/10, width/2 + width/6, height/2 + height/10);
  stroke(0);
  strokeWeight(0);
  fill (100, 0, 0);
  circle (width/2, height/2, width *1/5);
  fill (0);
  circle (width/2 - width/7, height/2 - width/10, width *1/10);
  circle (width/2 + width/7, height/2 - width/10, width *1/10);

  triangle(width/2 - width/7, height/2 - width/6 - 40, width/2 - width/7 + 20, height/2 - width/6, width/2 - width/7 - 20, height/2 - width/6 );
  triangle(width/2 - width/7, height/2 + 10, width/2 - width/7 + 20, height/2 - 30, width/2 - width/7 - 20, height/2 - 30 );

  triangle(width/2 + width/7, height/2 - width/6 - 40, width/2 + width/7 + 20, height/2 - width/6, width/2 + width/7 - 20, height/2 - width/6 );
  triangle(width/2 + width/7, height/2 + 10, width/2 + width/7 + 20, height/2 - 30, width/2 + width/7 - 20, height/2 - 30 );
  
  strokeWeight(15);
  noFill();
  arc (width/2, height/2 - 100, width/2, height / 3, PI + PI / 7 , PI + HALF_PI - PI/8);
  arc (width/2, height/2 - 100, width/2, height / 3, PI + HALF_PI + PI/8 , 2* PI - PI / 7);
  
}

float modulo (float x1, float y1, float x2, float y2){
  return sqrt(pow(x1 - x2, 2) + pow (y1 - y2, 2));
}

void ladoDeCirculos(float x1, float y1, float x2, float y2, float diametro){
 float dX = x2 - x1; float dY = y2 - y1;
 float distancia =  modulo(x1, y1, x2, y2);
 int cantCirculos = round(distancia / diametro) * 2;
 
 float deltaX = dX / cantCirculos;
 float deltaY = dY / cantCirculos;
 
 for (int i = 0; i <= cantCirculos; i++) {
    circle(x1 + i * deltaX, y1 + i * deltaY, diametro);
  }
}

float area (float lado1, float lado2, float lado3) {
  float s = (lado1 + lado2 + lado3) / 2;
  return sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
}

void trianguloDeCirculos (float x1, float y1, float x2, float y2, float x3, float y3, float diametro){
  strokeWeight(0);
  fill(0,0,255);
  
  ladoDeCirculos(x1, y1, x2, y2, diametro);
  ladoDeCirculos(x1, y1, x3, y3, diametro);
  ladoDeCirculos(x2, y2, x3, y3, diametro);
  
  float lado1 = modulo(x1,y1,x2,y2);
  float lado2 = modulo(x1,y1,x3,y3);
  float lado3 = modulo(x2,y2,x3,y3);
  
  float centroX = (x1 + x2 + x3) / 3;
  float centroY = (y1 + y2 + y3) / 3;
  
  float desp1 = round(modulo(x1,y1, centroX, centroY) / diametro);
  float desp2 = round(modulo(x2,y2, centroX, centroY) / diametro);
  float desp3 = round(modulo(x3,y3, centroX, centroY) / diametro);
  
  float dx1 = diametro/desp1, dy1 = diametro / desp1, dx2 = diametro / desp2, dy2 = diametro/desp2, dx3 = diametro/desp3, dy3 = diametro/desp3;
  
  
  if (x1 > centroX) dx1 *= -1;
  if (y1 > centroY) dy1 += -1;
  if (x2 > centroX) dx2 *= -1;
  if (y2 > centroY) dy2 += -1;
  if (x3 > centroX) dx3 *= -1;
  if (y3 > centroY) dy3 += -1;

  
  if (area(lado1, lado2, lado3) > (PI * pow(diametro/2, 2))){
    trianguloDeCirculos(x1 + dx1, y1 + dy1, x2 + dx2, y2 + dy2, x3 + dx3, y3 + dy3, diametro );
  }
  
  //if (lado > 2 * diametro) trianguloDeCirculos(x, y, lado - diametro, diametro);
}
