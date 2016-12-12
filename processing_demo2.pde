ArrayList<DisplayObject> displayObjectList = new ArrayList<DisplayObject>();
float centerX, centerY;

// 1 1 2 3 5 8 13 21 34 55 89 144 233
void setup() {  
  centerX = width * 0.5f;
  centerY = height * 0.5f;
  
//  size(512, 512, P3D);
  fullScreen(P3D);
  background(0);
  
}

void draw() {
  blendMode(SUBTRACT); 
  noStroke();
  fill(5, 5, 5, 144);
  rect(0, 0, width, height);
  
  displayObjectList.add( new ThunderBall() );
  
  int listSize = displayObjectList.size();
  for(int i = listSize - 1; i > 0; i--) {
    DisplayObject obj = displayObjectList.get(i);
    obj.update();
    obj.display();
    
    if(obj.isDead()) {
      displayObjectList.remove(i);
    }
  }
}

void mouseMoved() {
  displayObjectList.add( new Lightning() );
}