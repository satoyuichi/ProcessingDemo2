class DisplayObject {
  float life = 0.0f;
  float step = 1.0f;
  float limit = 3.0f;
  float radius = 200.0f;
  
  DisplayObject() {
    noiseSeed(mouseX);
  }
  
  void update() {
    life += step;
  }
  
  void display() {
  }
  
  boolean isDead() {
    return life >= limit;
  }
}