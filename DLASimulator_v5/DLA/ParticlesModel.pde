class ParticlesModel implements Callback {
  private ArrayList<Particle> particles;
  private float maxDistance;
  private boolean hasFinishedEmitting;
  private float size;
  private int limitParticle;
  private float pricipitation;
  private DividedArea dividedArea;
  private float times;
  
  public float effectRangeX1;
  public float effectRangeX2;
  
  public ParticlesModel (float size, int limit, float pricipitation, int division, float times) {
    this.dividedArea = new DividedArea (division);
    this.particles = new ArrayList<Particle> ();
    this.maxDistance = 0.0;
    this.hasFinishedEmitting = false;
    this.size = size;
    this.limitParticle = limit;
    this.pricipitation = pricipitation;
    this.initializeParticles ();
    this.times = times;
    this.effectRangeX1 = 0.0;
    this.effectRangeX2 = 0.0;
  }
  
  @Override
  public void callback (PVector position) {
    float distance = PVector.dist(position, particles.get(0).position);
    if (distance > maxDistance) {
      maxDistance = distance;  
    }
    if (!hasFinishedEmitting) {
      emitParticle (maxDistance + size * 3, size * 8);
      println ("current number of particles is " + particles.size());
      println ("max radius: " + maxDistance);
      if (particles.size () >= limitParticle) {
        this.hasFinishedEmitting = true;
        println ("Emitting particles Finished.");
      }
    }
  }
  
  public void initializeParticles () {
    Particle cluster = new Particle (new PVector(width/2.0, height/2.0), true, this.size);
    cluster.setCallback (this);
    cluster.setDividedArea (this.dividedArea);
    particles.add (cluster);
    for (int i = 0; i < 400; i++) {
      emitParticle (size * 5, size * 30);
    }
  }
  
  public void update () {
    Particle particle;
    for (int i = 0; i < particles.size (); i++) {
      particle = particles.get(i);
      if (particle.isCluster()) {
        continue;
      } else {
        PVector dist = new PVector (width/2, height/2);
        dist.sub (particle.getPosition());
        float distance = dist.magSq ();
        if (distance < effectRangeX1 * effectRangeX1 || distance > effectRangeX2 * effectRangeX2) {
          dist.normalize ();
          dist.mult (0.1);
          particle.addForce (dist);
        }
      }
      particle.excute (this.particles, this.pricipitation, this.times);
    }
  }
  
  public void setPricipitation (float pri) {
    this.pricipitation = pri;
  }
  
  public void setTimes (float time) {
    this.times = time;
  }
  
  public ArrayList<Particle> getParticles () {
    return this.particles;
  }
  
  public float getMaxDistance () {
    return this.maxDistance;
  }
  
  public float getRadius () {
    return this.size;
  }
  
  public void emitParticle (float offset, float distance) {
    PVector randPos = PVector.random2D();
    float range = random (offset, offset + distance);
    randPos.mult (range);
    randPos.add (new PVector (width/2.0, height/2.0));
    Particle particle = new Particle (randPos, false, this.size);
    particle.setCallback(this);
    particle.setDividedArea (this.dividedArea);
    this.particles.add (particle);
  }
  
}