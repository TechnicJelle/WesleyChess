float w, h;
ArrayList<Piece> pieces;

final int SIZE = 8; //amount of squares (√)
float OFFSET;
boolean USE_ICONS = false;

boolean btnSwitch = false;
boolean btnReset  = false;

//color(R, G, B);
final color white = color(250, 142, 200);
final color black = color(5, 113, 55);

final color offwhite = color(252, 244, 225);
final color offblack = color(3, 11, 30);

void setup() {
  fullScreen();
  frameRate(60);
  //aaaa

  w = width/SIZE;
  OFFSET = w*SIZE/2;
  setPieces();
}

void setPieces() {
  pieces = new ArrayList<Piece>();

  pieces.add(new Piece(0*w, 0*w, false, 'R'));
  pieces.add(new Piece(1*w, 0*w, false, 'K'));
  pieces.add(new Piece(2*w, 0*w, false, 'B'));
  pieces.add(new Piece(3*w, 0*w, false, 'Q'));
  pieces.add(new Piece(4*w, 0*w, false, 'L'));
  pieces.add(new Piece(5*w, 0*w, false, 'B'));
  pieces.add(new Piece(6*w, 0*w, false, 'K'));
  pieces.add(new Piece(7*w, 0*w, false, 'R'));

  pieces.add(new Piece(0*w, 1*w, false, '.'));
  pieces.add(new Piece(1*w, 1*w, false, '.'));
  pieces.add(new Piece(2*w, 1*w, false, '.'));
  pieces.add(new Piece(3*w, 1*w, false, '.'));
  pieces.add(new Piece(4*w, 1*w, false, '.'));
  pieces.add(new Piece(5*w, 1*w, false, '.'));
  pieces.add(new Piece(6*w, 1*w, false, '.'));
  pieces.add(new Piece(7*w, 1*w, false, '.'));

  pieces.add(new Piece(0*w, 6*w, true, '.'));
  pieces.add(new Piece(1*w, 6*w, true, '.'));
  pieces.add(new Piece(2*w, 6*w, true, '.'));
  pieces.add(new Piece(3*w, 6*w, true, '.'));
  pieces.add(new Piece(4*w, 6*w, true, '.'));
  pieces.add(new Piece(5*w, 6*w, true, '.'));
  pieces.add(new Piece(6*w, 6*w, true, '.'));
  pieces.add(new Piece(7*w, 6*w, true, '.'));

  pieces.add(new Piece(0*w, 7*w, true, 'R'));
  pieces.add(new Piece(1*w, 7*w, true, 'K'));
  pieces.add(new Piece(2*w, 7*w, true, 'B'));
  pieces.add(new Piece(3*w, 7*w, true, 'Q'));
  pieces.add(new Piece(4*w, 7*w, true, 'L'));
  pieces.add(new Piece(5*w, 7*w, true, 'B'));
  pieces.add(new Piece(6*w, 7*w, true, 'K'));
  pieces.add(new Piece(7*w, 7*w, true, 'R'));
}

void draw() {
  background(100); //"table" colour

  buttons();
  
  translate(0, OFFSET);
  board();
  for (Piece p : pieces) {
    p.render();
    p.update();
  }
  //fpsCount();
}

void buttons() {
  //rectangles
  strokeWeight(2);
  stroke(offblack);
  btnSwitch = mousePressed && mouseY < w && mouseX < w;
  btnReset  = mousePressed && mouseY < w && mouseX > w && mouseX < w*2;
  fill(255, btnSwitch ? 50 : 100);
  rect(0, 0, w, w, w/10);
  fill(255, btnReset ? 50 : 100);
  rect(w, 0, w, w, w/10);
  
  //text
  fill(255, 100);
  textSize(w*.9);
  textAlign(CENTER, CENTER);
  text("S", w*0.5, w*.5);
  text("R", w*1.5, w*.5);
}

void board() {
  stroke(10); //colour of grid lines
  strokeWeight(2); //thickness of grid lines
  boolean col = false;
  for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
      fill(col ? black : white);
      rect(i*w, j*w, w, w);
      col = !col;
    }
    col = !col;
  }
}

int movingP = -1;

void mousePressed() {
  for (int i = 0; i < pieces.size(); i++) {
    Piece p = pieces.get(i);
    if (mouseX > p.x && mouseX < p.x + w && mouseY - OFFSET > p.y && mouseY - OFFSET < p.y + w) {
      p.moving = true;
      movingP = i;
      return;
    }
  }
}

void mouseReleased() {
  if (movingP > -1) {
    Piece p = pieces.get(movingP);
    p.moving = false;
    p.x = round(p.x / w) * w;
    p.y = round(p.y / w) * w;
    movingP = -1;
  }

  if (btnSwitch) {
    USE_ICONS = !USE_ICONS;
  }
  
  if (btnReset) {
    pieces.clear();
    setPieces();
  }
}

float txtSize = 64;
void fpsCount() {
  pushStyle();
  String fps = str(round(frameRate));
  noStroke();
  fill(0);
  rect(10, 10, textWidth(fps), txtSize*0.8);
  textSize(txtSize);
  textAlign(LEFT, TOP);
  fill(255, 255, 0);
  text(fps, 10, 10);
  popStyle();
}



















