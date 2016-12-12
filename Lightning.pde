class Lightning extends DisplayObject {
  PVector originV;
  PVector positionV;
  PVector dirV;
  float weight;

  Lightning() {
    super();
    
    step = 0.1f;
    limit = random(2, 3);
    weight = random(1, 5);
    
    originV = new PVector(0.0f, 0.0f, 0.0f);
    positionV = new PVector(cos(random(0.0f, TWO_PI)), sin(random(0.0f, TWO_PI)), cos(random(0.0f, -PI)));
    positionV.mult(radius * 0.85f);
    
    dirV = PVector.sub(positionV, originV);
    dirV.normalize();
  }
  
  void display() {
    blendMode(ADD); 
    stroke(64, 64, 196, 144);
    strokeWeight(weight);

    noFill();    
    pushMatrix(); {
      translate(centerX, centerY);
      
      PVector tv = positionV.copy();
      beginShape();
      vertex(positionV.x, positionV.y, positionV.z);
      for(int i = 0; i < 5; i++) {
        tv = PVector.add(tv,PVector.mult(PVector.random3D(dirV), noise(life) * 89.0f));
        vertex(tv.x, tv.y, tv.z);
      }
      endShape();
    } popMatrix();
  }
}