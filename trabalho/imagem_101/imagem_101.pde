void setup() { 
  size(400, 267); 
  noLoop(); 
}

void draw() {
  PImage img = loadImage("0101.jpg"); 
  PImage imgPB = createImage(img.width, img.height, RGB); 
  PImage seg_PA = createImage(img.width, img.height, RGB);
  PImage seg_PB = createImage(img.width, img.height, RGB);
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
       if(green(imgPB.pixels[pos]) < 40) seg_PB.pixels[pos] = color(255);
       else seg_PB.pixels[pos] = color(0);
    }
  }
  
  image(seg_PB, 0, 0); 
  save("seg_PB.jpg");
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
       if(green(imgPB.pixels[pos]) > 195) seg_PA.pixels[pos] = color(255);
       else seg_PA.pixels[pos] = color(0);
    }
  }
  
  image(seg_PA, 0, 0); 
  save("seg_PA.jpg");
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) { 
      int pos = (y)*img.width + (x); 
      if(red(seg_PA.pixels[pos]) == 255 || red(seg_PB.pixels[pos]) == 255) {
        seg_Fin.pixels[pos] = color(255);
      } else {
        seg_Fin.pixels[pos] = color(0); 
      }
    }
  }
  
  image(seg_Fin, 0, 0); 
  save("0101_gerado.jpg");
 

}
