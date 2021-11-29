class Asteroid extends GameObject {

  Asteroid(PVector loc, PVector vel, int d) {
    super(loc, vel, d);
    velocity.rotate(random(0, TWO_PI));
  }//end constructor


  void display() {
    noFill();
    stroke(255);
    circle(location.x, location.y, diameter);
  }//end display

  void update() {
    super.update();
    collide();
  }//end update

  void collide() {
    float d = this.location.dist(ship.location);
    if (d < this.diameter/2 + ship.diameter/2) {
      gameState = false;
      println("dead");
    }
  }//end collide
}
