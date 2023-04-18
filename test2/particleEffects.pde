import java.util.*;
  
class particleEffects { 
  color[] colPallette;
  PGraphics particlesPG;
  
  int PIXEL_SIZE = 2;
  int REP_COUNT;
  int SCREEN_HEIGHT;
  int SCREEN_WIDTH;
  
  int arrayWIDTH, 
      arrayHEIGHT;
      
  int GLOBAL_TIMER = 0;
      
  
  int[][] particleArray;
  
  
  colorPallette cPal;    
  Random rand;
  
  particleEffects(int w, int h, int rep) {
    SCREEN_HEIGHT = h;
    SCREEN_WIDTH = w;
    rand = new Random();
    
    cPal = new colorPallette(new color[] {color(0,0,0), color(56,0,68), color(79,6,90), color(127,86,135), color(190,127,193), color(255,255,255)}, 9);
    colPallette = cPal.get_pallette();
    
    REP_COUNT = rep;
    
    particlesPG = createGraphics(SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //TODO: fire specific
    particleArray = new int[SCREEN_HEIGHT/PIXEL_SIZE][SCREEN_WIDTH/(PIXEL_SIZE * REP_COUNT) + 1]; //for some overhang since left most is weird
  
    for(int x = 0; x < particleArray[0].length; x++) {
      particleArray[0][x] = colPallette.length - 1;
    }
  }
    
  public void update() {
    update_particle_array();
    update_particle_graphics();
    update_timer();
  }
  
  //TODO: temp?
  private void update_timer()
  {
    if(GLOBAL_TIMER < 100*30) {
      GLOBAL_TIMER += 1;
    } else {
      GLOBAL_TIMER = 0;
    }
  }
      
  private void update_particle_array() {
    int color_index;
    int rInt;
    
    //Because overhang.
    for(int x = 1; x < particleArray[0].length; x++) {
      for(int y = 0; y < particleArray.length-1; y++) {
        
        rInt = rand.nextInt(3); //Amazing wavy-ness occurs when this is altered (TODO)
        color_index = particleArray[y][x];
        rInt = rand.nextInt(3); //Amazing wavy-ness occurs when this is altered (TODO)
       if(color_index > 0) {
          particleArray[y+1][(x + rInt - 1) % particleArray[0].length] = (color_index - rInt % 2)%colPallette.length;
        } else if (rInt >= 1) {
          particleArray[y+1][x] = 0;
        }
      }
    }
  }
  
  private void update_particle_graphics() {
   particlesPG.beginDraw();
   for(int x = 0; x < particleArray[0].length; x++) {
    for(int y = 0; y < particleArray.length; y++) {
      
      particlesPG.noStroke();
      particlesPG.fill(colPallette[particleArray[y][x]]);
      particlesPG.rect(x*PIXEL_SIZE,
             SCREEN_HEIGHT-(y+1)*PIXEL_SIZE, 
             PIXEL_SIZE,
             PIXEL_SIZE); 
    }
  }
  
    particlesPG.endDraw();
  }
  
  public void display(int x_OFFSET, int y_OFFSET) {
    update();
    
    image(particlesPG, x_OFFSET, y_OFFSET);
  }
  
}
