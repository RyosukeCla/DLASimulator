class ColorSetting {
  private ArrayList<Color> colors;
  private ArrayList<Color> specialColors;
  
  public ColorSetting () {
    colors = new ArrayList<Color> ();
    specialColors = new ArrayList<Color> ();
  }
  
  public void addOrderedColor (Color col) {
    colors.add(col);
  }
  
  public void addSpecialColor (Color col) {
    specialColors.add(col);
  }
  
  public color getSpecialColor (int index) {
    int specialIndex = index % specialColors.size();
    return this.specialColors.get(specialIndex).getColor();
  }
  
  public color getOrderedColor (int index) {
    int orderedIndex = index % colors.size();
    return this.colors.get(orderedIndex).getColor();
  }
  
}

class Color {
  private color col;
  
  public Color (float R, float G, float B) {
    this.col = color (R, G, B);
  }
  
  public Color (float R, float G, float B, float A) {
    this.col = color (R, G, B, A);
  }
  
  public Color (color col) {
    this.col = col;
  }
  
  public color getColor () {
    return col;
  }
  
}