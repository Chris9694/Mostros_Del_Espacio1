

class Mostro{
  String nombre;
  int vida;
  int hit1;
  int hit2;
  int hitx;
  int aspect;
  
  Mostro(String nombre_, int vida_, int hit1_, int hit2_, int hitx_, int aspect_)
  {
  nombre = nombre_;
  vida = vida_;
  hit1 = hit1_;
  hit2 = hit2_;
  hitx = hitx_;
  aspect = aspect_;
  }
  
  void Dibujo(){
  
  switch(aspect){
  case 0:
  image(bro,b,100);
  break;
  
  case 1:
  image(foc,b,100);
  break;
  
  case 2:
  image(hor,b,100);
  break;
  
  case 3:
  image(mag,a,100);
  break;
  
  case 4:
  image(eye,a,100);  
  break;  
    }
  }
  void Dibujo1(){
  
  switch(aspect){
  case 0:
  image(bro1,a,100);
  break;
  
  case 1:
  image(foc1,a,100);
  break;
  
  case 2:
  image(hor1,a,100);
  break;
  
  case 3:
  image(mag1,b,100);
  break;
  
  case 4:
  image(eye1,b,100);  
  break;  
    }
  }
}