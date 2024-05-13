void setup() { 
  size(400, 267); 
  noLoop(); 
}

void draw() {
  PImage img = loadImage("0004.jpg"); 
  PImage imgPB = createImage(img.width, img.height, RGB); 
  PImage imgLim = createImage(img.width, img.height, RGB);  
  PImage seg_PB = createImage(img.width, img.height, RGB);
  PImage seg_PA = createImage(img.width, img.height, RGB);
  PImage seg_Fin = createImage(img.width, img.height, RGB);
  
  // Filtro escala de cinza 
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
      float media = green(img.pixels[pos]);
      imgPB.pixels[pos] = color(media);
    }
  }
  
  image(imgPB, 0, 0); 
  save("imgPB.jpg");
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
       if(green(imgLim.pixels[pos]) > 90) seg_PA.pixels[pos] = color(255);
       else seg_PA.pixels[pos] = color(0);
    }
  }
  
  image(seg_PA, 0, 0); 
  save("seg_PA.jpg");
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
      if(red(seg_PB.pixels[pos]) == 255 || red(seg_PA.pixels[pos]) == 255) {
        seg_Fin.pixels[pos] = color(255);
      } else {
        seg_Fin.pixels[pos] = color(0); 
      }
    }
  }
  
  //limitar imagem
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
      if(y <= 100 || y >= 190 || x >= 320 || x <= 18) {
        imgLim.pixels[pos] = color(0);
      } else {
        imgLim.pixels[pos] = seg_Fin.pixels[pos]; 
      }
    }
  }
  
  image(imgLim, 0, 0); 
  save("0004_gerado.jpg");

}
