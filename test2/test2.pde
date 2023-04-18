int PIXEL_SIZE = 2;
int REP_RECT_COUNT;
int REP_COUNT = 2;

particleEffects fireEff;


void setup() {
  size(640, 480);
 
  fireEff = new particleEffects(width, height, REP_COUNT);
  
}

void draw() {
  background(122,122,122);
   
  
  //Decrement to cover up overhang issue
  for(int k = REP_COUNT-1; k >= 0 ; k--) {
    fireEff.display(k*(width/REP_COUNT - PIXEL_SIZE), 0);
  }
}
