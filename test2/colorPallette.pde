class colorPallette {
  int MAIN_COLOR_COUNT;
  int STEP_SIZE_COLOR;
  
  int PIXEL_SIZE = 10; //TODO: Just testing purposes
  color[] pallette;

  colorPallette() {
    color[] cArray;
    
    //Default to fire, because fire...
    cArray = new color[]{color(0,0,0), //Black
                           color(204,0,0), //Red
                           color(255,153,51), //Orange
                           color(255,255,51), //Yellow
                           color(255,255,255) //White
                          };
    
    
    STEP_SIZE_COLOR = 9;
    MAIN_COLOR_COUNT = cArray.length;
    
    create_pallette(cArray);
  }
  
  colorPallette(color[] cArray, int step) {
    STEP_SIZE_COLOR = step;
    MAIN_COLOR_COUNT = cArray.length;
    
    create_pallette(cArray);
  }  
  
  
  
  private void create_pallette(color[] cArray) {
    pallette = new color[(cArray.length-1)*STEP_SIZE_COLOR+1];
    
    for(int i = 0; i < cArray.length-1; i++) {
      pallette[i * STEP_SIZE_COLOR] = cArray[i];
    }
    
    pallette[pallette.length-1] = cArray[cArray.length-1];
    
    int[] step_size = new int[3];
    
    for(int i = 0; i < cArray.length-1; i++) {
      step_size[0] = int(red(cArray[i+1])-red(cArray[i]))/STEP_SIZE_COLOR;
      step_size[1] = int(green(cArray[i+1])-green(cArray[i]))/STEP_SIZE_COLOR;
      step_size[2] = int(blue(cArray[i+1])-blue(cArray[i]))/STEP_SIZE_COLOR;
      
      for(int j = 1; j < STEP_SIZE_COLOR; j++) {
        pallette[i*STEP_SIZE_COLOR + j] = color(red(cArray[i]) + j*step_size[0],
                        green(cArray[i]) + j*step_size[1],
                        blue(cArray[i]) + j*step_size[2]);
      }
    }
  }
  
  public void display_pallette() {
    for(int i = 0; i < pallette.length; i++) {
          fill(pallette[i]);
          rect(i*PIXEL_SIZE, 0, PIXEL_SIZE, PIXEL_SIZE); 
     }
  }
  
  public color[] get_pallette() {
    return pallette;
  }
  
}
