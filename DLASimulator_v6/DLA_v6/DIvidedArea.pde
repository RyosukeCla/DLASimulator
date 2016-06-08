class DividedArea {
  private float widthDiv;
  private float heightDiv;
  private int division;
  
  public DividedArea (int division) {
    this.division = division;
    this.widthDiv = this.division/(float)width;
    this.heightDiv = this.division/(float)height;
    println ("width/division = " + this.widthDiv);
    println (this.widthDiv);
  }
  
  public boolean areInSameArea (PVector particlePos, PVector clusterPos) {
    float px = (particlePos.x * widthDiv);
    float cx = (clusterPos.x * widthDiv);
    if ( px >= (int)cx - 0.1 && px <= (int)cx + 1.1) {
      float py = (particlePos.y * heightDiv);
      float cy = (clusterPos.y * heightDiv);
      if (py >= (int)cy - 0.1 && py <= (int)cy + 1.1) {
        return true;
      }
    }
    return false;
  }
}