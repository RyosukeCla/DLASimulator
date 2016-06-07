class Slider {
  private float xpos, ypos;
  private float rangeA, rangeB;
  private float sliderPosition;
  private float sliderWidth;
  private float sliderHeight;
  private boolean isInteger;
  private String name;

  Slider(String name) {
    this.name = name;
    this.xpos = 0.0;
    this.ypos = 0.0;
    this.rangeA = 0.0;
    this.rangeB = 1.0;
    this.sliderPosition = 50.0;
    this.sliderWidth = 100.0;
    this.sliderHeight = 16.0;
  }
  void setPosition(float x, float y) {
    this.xpos = x;
    this.ypos = y;
  }
  float getPositionX() {
    return this.xpos;
  }
  float getPositionY() {
    return this.ypos;
  }
  void setRange(float ra, float rb) {
    this.rangeA = ra;
    this.rangeB = rb;
  }
  void isIntegerSlider(Boolean isI) {
    isInteger = isI;
  }
  void setInitialValue(float x) {
    sliderPosition = sliderWidth * (x - rangeA) / (rangeB - rangeA);
  }
  float getValue() {
    return rangeA + (rangeB - rangeA) * sliderPosition / sliderWidth;
  }
  boolean isInsideSlider() {
    if (mouseX>=xpos-8 && mouseX<=xpos+sliderWidth+8 && mouseY>=ypos-sliderHeight/2.0 && mouseY<=ypos+sliderHeight*3.8/2.0) return true;
    else return false;
  }
  void mouseListener() {
    if (isInsideSlider() == true) {
      if (mousePressed) {
        sliderPosition = mouseX - xpos - 1;
        if (isInteger == true) setInitialValue((int)getValue());
        if (sliderPosition > sliderWidth) sliderPosition = sliderWidth;
        if (sliderPosition < 0) sliderPosition = 0;
      }
    }
  }
  void update() {
    pushMatrix();
    stroke(255, 255, 255, 255);
    strokeWeight(1);
    fill(255, 255, 255, 100);
    translate(xpos, ypos);
    line(0, 0, 0, sliderHeight);
    line(0, sliderHeight/2.0, sliderWidth, sliderHeight/2.0);
    line(sliderWidth, 0, sliderWidth, sliderHeight);
    line(sliderWidth/2.0, sliderHeight*0.2, sliderWidth/2.0, sliderHeight*0.8);
    rect(sliderPosition-sliderWidth/30.0+1.0/2.0, 0, sliderWidth/15.0, sliderHeight);
    fill(255, 230);
    textSize(sliderHeight/1.5);
    textAlign(LEFT, CENTER);
    text(name, sliderWidth*1.1, sliderHeight/2.0);
    textSize(sliderHeight/1.8);
    textAlign(CENTER, TOP);
    text(rangeA, 0, sliderHeight*1.1);
    text(rangeB, sliderWidth, sliderHeight*1.1);
    textAlign(CENTER, BOTTOM);
    text(getValue(), sliderPosition, 0);
    popMatrix();
  }
}

class Button {
  private PVector pos;
  private String name;
  private float buttonHeight;
  private float buttonWidth;
  private Listener listener;
  private color textCol;

  public Button (String name) {
    this.name = name;
    this.pos = new PVector (0, 0);
    this.buttonWidth = 100.0;
    this.buttonHeight = 16.0;
    this.textCol = color (250, 230);
  }

  public void setPosition(float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }

  public void setName (String name) {
    this.name = name;
  }

  public void setTextColor (color col) {
    this.textCol = col;
  }

  public void setListener (Listener li) {
    this.listener = li;
  }

  boolean isInside() {
    if (mouseX>=pos.x && mouseX<=pos.x+buttonWidth && mouseY>=pos.y && mouseY<=pos.y+buttonHeight) return true;
    else return false;
  }

  void mouseListener() {
    if (isInside() == true) {
      if (mousePressed) {
        if (this.listener != null) {
          this.listener.action ();
        } else {
          println ("is not set callback");
        }
        update ();
      }
    }
  }

  public void update () {
    pushMatrix ();
    fill (255, 255, 255, 100);
    translate (this.pos.x, this.pos.y);
    rect (0, 0, buttonWidth, buttonHeight);

    textAlign (CENTER, CENTER);
    textSize (buttonHeight/1.8);
    fill (this.textCol);
    text (name, buttonWidth/2.0, buttonHeight/2.0 - 2.0);
    popMatrix();
  }
}

class Graph {
  private PVector pos;
  private PVector size;
  private color textCol;
  private String name;
  private Function function;
  private float delta;
  private PVector rangeX;
  private PVector rangeY;

  private String axisNameX;
  private String axisNameY;

  private color lineCol;

  public Graph (String name) {
    this.name = name;
    this.pos = new PVector (0, 0);
    this.size = new PVector (100, 50);
    this.textCol = color (255, 230);
    this.delta = 1.0;
    this.rangeX = new PVector (0.0, 1.0);
    this.rangeY = new PVector (0.0, 1.0);
    this.lineCol = color (180, 50, 70);
    this.axisNameX = "x";
    this.axisNameY = "y";
  }

  public void setFunction (Function function) {
    this.function = function;
  }

  public void setRangeX (float left, float right) {
    this.rangeX.x = left;
    this.rangeX.y = right;
  }

  public void setRangeY (float left, float right) {
    this.rangeY.x = left;
    this.rangeY.y = right;
  }

  public void setAxisName (String x, String y) {
    this.axisNameX = x;
    this.axisNameY = y;
  }

  public void setDelta (float delta) {
    this.delta = delta;
  }

  public void setPosition (float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }

  public void setSize (float x, float y) {
    this.size.x = x;
    this.size.y = y;
  }

  public void setTextColor (color col) {
    this.textCol = col;
  }

  public void setName (String name) {
    this.name = name;
  }

  public void update () {
    pushMatrix ();
    translate (this.pos.x, this.pos.y);
    strokeWeight (1);
    fill(255, 255, 255, 20);
    rect (0, 0, this.size.x, this.size.y);
    stroke (this.lineCol);

    if (this.function != null) {
      for (float x = this.rangeX.x; x < this.rangeX.y; x += this.delta) {
        float y1 = this.function.function (x);
        float y2 = this.function.function (x+this.delta);
        y1 = map (y1, this.rangeY.x, this.rangeY.y, 0.0, this.size.y);
        y2 = map (y2, this.rangeY.x, this.rangeY.y, 0.0, this.size.y);
        if (y1 < 0) {
          y1 = 0;
        }
        if (y2 < 0) {
          y2 = 0;
        }
        if (y1 > this.size.y) {
          y1 = this.size.y;
        }
        if (y2 > this.size.y) {
          y2 = this.size.y;
        }
        float x1 = map (x, this.rangeX.x, this.rangeX.y, 0.0, this.size.x);
        float x2 = map (x+this.delta, this.rangeX.x, this.rangeX.y, 0.0, this.size.x);
        line (x1, this.size.y - y1, x2, this.size.y - y2);
      }
    }

    stroke(255, 255, 255, 255);
    fill (0, 0);
    rect (0, 0, this.size.x, this.size.y);

    fill(this.textCol);
    textSize(10);
    textAlign(CENTER, CENTER);
    text (this.axisNameX, this.size.x / 2, this.size.y + 10.0);
    pushMatrix();
    rotate (-PI/2.0);
    translate (-this.size.y / 2.0, -10.0);
    text (this.axisNameY, 0.0, 0.0);
    popMatrix();
    textSize (10);
    text (this.rangeX.x, 0.0, -10.0);
    text (this.rangeX.y, this.size.x, -10.0);
    textAlign (LEFT, CENTER);
    text (this.rangeY.x, this.size.x, this.size.y - 5.0);
    text (this.rangeY.y, this.size.x, 5.0);
    textSize (12);
    text (this.name, this.size.x + 10.0, this.size.y / 2.0);

    popMatrix ();
  }
}

// gomi menu class.
class Menu {
  private PVector pos;

  public Slider pSl;
  public Slider vSl;
  public Slider eSl;
  public Graph eGraph;
  public Button stop;
  public Button pict;
  public Button regene;
  public Button generateMicro;

  private float slideX;
  private float initialX;
  private boolean isCollapsed;
  
  private Listener list;

  public Menu () {
    pos = new PVector (0.0, 0.0);
    pSl = new Slider ("deposition rate");
    vSl = new Slider ("particle velocity");
    eSl = new Slider ("delta");
    eGraph = new Graph ("potential difference");
    stop = new Button ("stop");
    pict = new Button ("take picture");
    regene = new Button ("regenerate");
    generateMicro = new Button ("generate micro");
    isCollapsed = true;
    slideX = 0;
    initialX = 0;
    initialize ();
  }

  void initialize () {
    initialX = -260;
    setAllPos (-260);
    pSl.setInitialValue (1.0);
    vSl.isIntegerSlider (true);
    vSl.setRange (1.0, 4.0);
    vSl.setInitialValue (1);
    eGraph.setAxisName ("distance", "potential");
    eGraph.setDelta (0.01);
    eSl.setRange (0.0, 0.5);
    eSl.setInitialValue (0.0);
  }

  private void setAllPos (float x) {
    pSl.setPosition (x, 80.0);
    vSl.setPosition (x, 140.0);
    eGraph.setPosition (x, 200.0);
    eSl.setPosition (x, 280.0);
    stop.setPosition (x, 340);
    pict.setPosition (x, 380);
    regene.setPosition (x, 420);
    generateMicro.setPosition (x + 110, 420);
  }

  public void setPosition (float x, float y) {
    this.pos.x = x;
    this.pos.y = y;
  }

  public void update () {

    pushMatrix();
    stroke (255);
    strokeWeight (1);
    translate (initialX + slideX, 0);
    fill (40, 180);
    rect (-100, -10, 350, height + 10);
    popMatrix();
    pushMatrix();

    if (isCollapsed == true) {
      if (slideX > 0) {
        slideX -= 10.0  + 100.0 / frameRate;
        setAllPos (initialX + slideX);
      }
    } else {
      if (slideX < 300) {
        slideX += 10.0;
        setAllPos (initialX + slideX);
      }
    }
    if (slideX > 0) {

      pSl.update ();
      vSl.update ();
      eGraph.update ();
      eSl.update ();
      stop.update ();
      pict.update ();
      regene.update ();
      generateMicro.update ();
    }

    translate (pos.x, pos.y);
    strokeWeight (1);
    stroke (255);
    fill (255, 100);
    ellipse (10.0, 7.0, 30.0, 30.0);
    if (isCollapsed == true) {
      rect (0.0, 0.0, 20.0, 2.0);
      rect (0.0, 6.0, 20.0, 2.0);
      rect (0.0, 12.0, 20.0, 2.0);
    } else {
      rect (2.0, 2.0, 16.0, 10.0);
    }
    popMatrix();
  }
  
  public void setListener (Listener ls) {
    this.list = ls;
  }

  public void mousePressedListener () {
    if (mouseX > 290) {
      isCollapsed = true;
    }
    float dist = (mouseX - pos.x)*(mouseX - pos.x)+(mouseY - pos.y)*(mouseY - pos.y);
    if (dist < 900) {
      if (isCollapsed == true) {
        isCollapsed = false;
      } else {
        isCollapsed = true;
      }
    }
    if (isCollapsed == false) {
      stop.mouseListener ();
      pict.mouseListener ();
      pSl.mouseListener ();
      vSl.mouseListener ();
      eSl.mouseListener ();
      regene.mouseListener ();
      generateMicro.mouseListener ();
      list.action ();
    }
  }

  public void mouseDraggedListener () {
    if (isCollapsed == false) {
      pSl.mouseListener ();
      vSl.mouseListener ();
      eSl.mouseListener ();
      list.action ();
    }
  }
}