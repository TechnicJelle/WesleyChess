class Piece {
  float x, y;
  boolean col;
  char type;
  
  PImage icon;

  boolean moving;

  Piece(float x, float y, boolean col, char type) {
    this.x = x;
    this.y = y;
    this.col = col;
    this.type = type;

    icon = loadImage((col ? "w" : "b") + type + "_.png");
    icon.resize(0, int(w*.9));

    moving = false;
  }

  void render() {
    pushMatrix();
    translate(x + w/2, y + w/2);
    if (!col) rotate(PI);

    if (USE_ICONS) {
      //image
      imageMode(CENTER);
      image(icon, 0, 0);
    } else {
      //circle
      fill(col ? white : black);
      stroke(!col ? offwhite : offblack);
      strokeWeight(3);
      ellipse(0, 0, w*.9, w*.9);

      //text
      textAlign(CENTER, CENTER);
      fill(!col ? offwhite : offblack);
      textSize(w*.9);
      text(type, 0, 0);
    }

    popMatrix();
  }

  void update() {
    if (moving) {
      x = mouseX - w/2;
      y = mouseY - w/2 - OFFSET;
    }
  }
}























