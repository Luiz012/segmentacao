void setup() { 
  size(400, 267); 
  noLoop(); 
}

void draw() {
  PImage gr_test = loadImage("0101.png"); 
  PImage gr_test_gerado = loadImage("0101_gerado.jpg"); 
  
  int false_positive = 0;
  int false_negative = 0;
  int correct = 0;
  int tam = gr_test.height * gr_test.width;
  
  // Comparar Ground Truths 
  for (int y = 0; y < gr_test.height; y++) {
    for (int x = 0; x < gr_test.width; x++) {
      
      int pos = (y)*gr_test.width + (x);
                  
      if(red(gr_test_gerado.pixels[pos]) > red(gr_test.pixels[pos])){
        false_positive++;
      }
      if(red(gr_test_gerado.pixels[pos]) < red(gr_test.pixels[pos])){
        false_negative++;
      }
      if(red(gr_test_gerado.pixels[pos]) == red(gr_test.pixels[pos])){
        correct++;
      }
    }
  }
  
  println("Total: "+tam+" pixels");
  println("Correto: "+correct+" pixels");
  println("Falso Positivo: "+false_positive+" pixels");
  println("Falso Negativo: "+false_negative+" pixels");
  
}
