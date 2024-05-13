void setup() { 
  size(400, 267); 
  noLoop(); 
}

void draw() {
  PImage imgOriginal = loadImage("0101.jpg"); 
  PImage imgGerada = loadImage("0101_gerado.jpg"); 
  PImage imgSegmentada = createImage(imgOriginal.width, imgOriginal.height, RGB);
  
  // Segmentar imagem 
  for (int y = 0; y < imgOriginal.height; y++) {
    for (int x = 0; x < imgOriginal.width; x++) { 
      int pos = (y)*imgOriginal.width + (x); 
      if(red(imgGerada.pixels[pos]) == 0){
          imgSegmentada.pixels[pos] = color(0);
      }
      else{
        imgSegmentada.pixels[pos] = imgOriginal.pixels[pos];
      }
    }
  }
  
  image(imgSegmentada, 0, 0); 
  save("0101_segmentado.jpg");

}
