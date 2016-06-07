class DLAController {
  
  private View particlesView;
  private ParticlesModel particlesModel;
  
  public DLAController (float particleRadius, int limitParticles, float pricipitation, int division) {
    this.particlesModel = new ParticlesModel (particleRadius, limitParticles, pricipitation, division, 1);
    println ("setting up dla");
    this.particlesView = new View (particlesModel);
    println ("done");
  }
  
  public void update () {
    particlesModel.update();
  }
  
  public void display () {
    particlesView.display();
  }
  
  public void setPricipitation (float pricp) {
    this.particlesModel.setPricipitation (pricp);
  }
  
  public void setTimes (float times) {
    this.particlesModel.setTimes (times);
  }
  
  public void setEffectRange (float x1, float x2) {
    this.particlesModel.effectRangeX1 = x1;
    this.particlesModel.effectRangeX2 = x2;
  }
  
  public PGraphics getGraphics () {
    return this.particlesView.getGraphics ();
  }
  
  public void drawGraphics () {
    this.particlesView.drawGraphics ();
  }
}