class Particle implements Task {
  private PVector position;
  private int chainNumber;
  private boolean isConnected;
  private float radius;
  private Callback callback;
  private DividedArea dividedArea;
  private PVector velocity;
  
  public Particle (PVector position, boolean isConnected, float radius) {
    this.position = position;
    if (isConnected) {
      this.chainNumber = 0;
    } else {
      this.chainNumber = -1;
    }
    this.isConnected = isConnected;
    this.radius = radius;
    this.velocity = new PVector (0.0, 0.0);
  }
  
  @Override
  public void setCallback (Callback callback) {
    this.callback = callback;
  }
  
  @Override
  public void excute (ArrayList<Particle> particles, float pricipitation, float times) {
    if (this.isConnected) {
      return;
    }
    this.randomWalk (times);
    this.collisionDetect (particles, pricipitation, times);
  }
  
  public void setDividedArea (DividedArea da) {
    this.dividedArea = da;
  }
  
  
  public PVector getPosition () {
    return this.position;
  }
  
  public int getChainNumber () {
    return this.chainNumber;
  }
  
  public boolean isCluster () {
    return this.isConnected;
  }
  
  public void addForce (PVector f) {
    this.position.add (f);
  }
  
  private void randomWalk (float times) {
    if (frameCount % times == 0) {
      velocity = PVector.random2D();
      velocity.mult(this.radius/3.0);
    }
    this.position.add(velocity);
  }
  
  private void collisionDetect (ArrayList<Particle> particles, float pricipitation, float times) {
    float distance = 0;
    
    for (Iterator<Particle> i = particles.iterator(); i.hasNext();) {
      Particle particle = i.next();
      if (this == particle) {
        continue;
      }
      
      if (particle.isConnected) {
        if (!this.dividedArea.areInSameArea(this.position, particle.position)) {
          continue;
        }
        distance = pow (position.x - particle.position.x, 2) + pow (position.y - particle.position.y, 2);
        if (distance < radius * radius) {
          float rand = random (0.0, 1.0);
          if (rand < pricipitation) {
            this.chainNumber = particle.chainNumber + 1;
            this.isConnected = true;
            // envoke callback
            this.callback.callback (this.position);
            return;
          } else {
            PVector col = new PVector (this.position.x, this.position.y);
            col.sub (particle.position);
            this.velocity = col;
            this.position.add (this.velocity);
          }
        }
      }
    }
  }
  
}