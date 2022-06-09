// trabajo practico n°2 tecnologia multimedial
// profesor: josé luis bugiolachi
// alumno: bautista miranda n° de legajo: 88916/5
// link al video de youtube: https://youtu.be/-LJgpfeGxTI
// 

void setup () {
  size(600, 600);
  background (1);
}

void draw () {
  blendMode(BLEND);
  fill(1);
  stroke (140, 138, 140);
  strokeWeight(peso); 
  fill (255, 0, 1);
  noStroke ();  
  circle(600 - diam, 600 - diam, diam);
  
  stroke (140, 138, 140);

  for (int i= 0; i <= filas + 1; i ++) {
    line(dist * (i), 0, dist * (i), 600);
    line (0, dist * (i), 600, dist * (i));
    //hace las filas y columnas
  }

  noStroke();
  fill(255);
  for (int i= 0; i <= filas + 1; i ++) {
    for (int j= 0; j <= filas + 1; j ++) {
      circle(dist * (i), dist * (j), dist(0, 0, peso, peso));
      //círculos en los vértices
    }
  }


  noStroke();
  blendMode(DIFFERENCE);
  if (hizoClick) {
    circle(tocX, tocY, rad);
    rad += 6;
    //onda expansiva 
 }
}



void mousePressed() {
  tocX = mouseX;
  tocY = mouseY;
  rad = 0;
  float d = dist(tocX, tocY, 600 - diam, 600 - diam);
  // para ver si estás arriba del botón o no 
  hizoClick = !(d <= diam/2);
  //si hizo click sobre el boton
  if (!hizoClick) background(1);
  // si hiciste click sobre el boton lo reinicia 
  
  
}
