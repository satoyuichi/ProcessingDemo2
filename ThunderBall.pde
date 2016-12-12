class ThunderBall extends DisplayObject {
  int divideY = 24;
  float stepY = 360.0f / divideY;
  float size = 10.0f;
  
  float px, py, pz;
  float rz = 0.0f;
  
  ThunderBall() {
    super();
    
    limit = random(3, 8);
    size = random(13, 34);
  }
  
  void display() {
    blendMode(ADD); 
    stroke(5, 8, 233, 13);
    fill(55, 55, 144, 34);

    for(float ry = 0.0f; ry < 360.0f * 8.0f; ry += stepY, rz += 6.0f) {
      pushMatrix(); {
        translate(centerX, centerY);
        rotateX(radians(frameCount));
        rotateY(radians(ry + frameCount));
        rotateZ(radians(rz + frameCount));
        translate(0.0f, radius, 0.0f);
        rotateX(radians(noise(life) * 360.0f));
        ellipse(0, 0, size, size);
      } popMatrix();
    }
  }
}