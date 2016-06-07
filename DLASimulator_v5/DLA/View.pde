class View {

  private ColorSetting colorSetting;
  private ParticlesModel particlesModel;
  private PGraphics pg;
  
  public View (ParticlesModel pm) {
    this.particlesModel = pm;
    this.setColorSetting();
    pg = createGraphics (width, height);
  }
  
  public void display () {
    
    stroke (20, 100, 200);
    noFill();
    float rangeX = particlesModel.effectRangeX1;
    ellipse (width/2, height/2, rangeX, rangeX);
    rangeX = particlesModel.effectRangeX2;
    stroke (200, 100, 20);
    ellipse (width/2, height/2, rangeX, rangeX);
    noStroke();
    float maxDistance = particlesModel.getMaxDistance ();
    float radius = particlesModel.getRadius();
    fill(200.0, 200.0, 200.0, 25.0);
    ellipse (width/2, height/2, maxDistance * 2 + radius, maxDistance * 2 + radius);
    
    Particle particle;
    strokeWeight(radius);
    for (Iterator<Particle> i = this.particlesModel.getParticles().iterator (); i.hasNext ();) {
      particle = i.next ();
      if (particle.getChainNumber () == 0) {
        stroke (this.colorSetting.getSpecialColor(0));
      } else if (particle.getChainNumber () == -1) {
        stroke (this.colorSetting.getSpecialColor(1));
      } else {
        stroke (this.colorSetting.getOrderedColor(particle.chainNumber));
      }
      PVector pos = particle.getPosition ();    
      point (pos.x, pos.y);
    }
  }
  
  public void drawGraphics () {
    pg = createGraphics (width, height);
    pg.beginDraw();
    pg.stroke (20, 100, 200);
    pg.noFill();
    float rangeX = particlesModel.effectRangeX1;
    pg.ellipse (width/2, height/2, rangeX, rangeX);
    rangeX = particlesModel.effectRangeX2;
    pg.stroke (200, 100, 20);
    pg.ellipse (width/2, height/2, rangeX, rangeX);
    pg.noStroke();
    float maxDistance = particlesModel.getMaxDistance ();
    float radius = particlesModel.getRadius();
    pg.fill(200.0, 200.0, 200.0, 25.0);
    pg.ellipse (width/2, height/2, maxDistance * 2 + radius, maxDistance * 2 + radius);
    Particle particle;
    for (Iterator<Particle> i = this.particlesModel.getParticles().iterator (); i.hasNext ();) {
      particle = i.next ();
      if (particle.getChainNumber () == 0) {
        pg.fill (this.colorSetting.getSpecialColor(0));
      } else if (particle.getChainNumber () == -1) {
        pg.fill (this.colorSetting.getSpecialColor(1));
      } else {
        pg.fill (this.colorSetting.getOrderedColor(particle.chainNumber));
      }
      PVector pos = particle.getPosition ();    
      pg.ellipse (pos.x, pos.y, radius, radius);
    }
    pg.endDraw();
  }
  
  public PGraphics getGraphics () {
    return this.pg;
  }
  
  private void setColorSetting () {
    this.colorSetting = new ColorSetting ();
    
    this.colorSetting.addSpecialColor (new Color (176, 67, 255));
    this.colorSetting.addSpecialColor (new Color (255, 255, 255));
    
    color from = color (200, 20, 140);
    color to = color (20, 255, 200);
    
    for (int i = 0; i < 10; i++) {
      float rate = 1/float(i+1);
      Color col = new Color (lerpColor(from, to, rate));
      this.colorSetting.addOrderedColor (col);
    }
    
    this.colorSetting.addOrderedColor (new Color(lerpColor(from, to, 0.0)));
  }
  
}