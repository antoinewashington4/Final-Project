ArrayList<ball> esplosions = new ArrayList<ball>();
ArrayList<ball> sneezes = new ArrayList<ball>();
ArrayList<sneezie> sneezies = new ArrayList<sneezie>();
int maxBalls=50;
PVector mousexplosion;
boolean firstClick;
float[] h = new float[12];
boolean idfk;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 25, 100);
  firstClick = true;
  for (int i=0; i<50; i++) {
    sneezies.add(new sneezie());
  }
}
void draw() {
  background(0, 0, 25, 100);
  PVector mouse=new PVector(mouseX, mouseY);
  if (esplosions.size() >= maxBalls) {
    firstClick=false;
  }

  if (firstClick) {
    if (mousePressed) {
      esplosions.add(new  ball());
      sneezes.add(new ball());
    }
  }
  for (int i=0; i<esplosions.size (); i++) {
    ball debris = esplosions.get(i);
    debris.display();
    debris.move();
    debris.age();
    debris.slowmoving(mouse);
    debris.stopmoving(mouse);
    if (debris.dead()) {
      esplosions.remove(i);
    }
  }
  for (int i=0; i<sneezies.size (); i++) {
    sneezie yeezie = sneezies.get(i);
    fill(random(360), 99, 99, 50);
    yeezie.display();
    yeezie.floatyo();
    yeezie.bounce();
    for (int k=0; k<esplosions.size (); k++) {
      ball debris2 = esplosions.get(k);
      if (yeezie.sneezing(debris2)) {
        sneezies.remove(i);
      }
    }
  }
  fill(#E71AE8);
  text("#PinkprintOniTunes", width-150, height-20);
  if (idfk) {
    println("tittysprinkles");
    for (int i=0; i < sneezes.size (); i++) {
      ball debros = sneezes.get(i);
      debros.display();
      debros.move();
      debros.age();
      debros.slowmoving(mouse);
      debros.stopmoving(mouse);
      if (debros.dead()) {
        sneezes.remove(i);
      }
    }
  }
}

void explode(PVector loc_) {
  idfk=true;
}

void mouseClicked() {
  mousexplosion = new PVector(mouseX, mouseY);
  explode(mousexplosion);
}

