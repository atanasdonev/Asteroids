class Ship extends GameObject {
  PVector direction;
  int shotTimer, threshold;

  Ship(PVector loc, PVector vel, int d) {
    super(loc,vel,d);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 10;
  }//end constructor

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    stroke(255);
    triangle(-25, -15, -25, 15, 25, 0);
    popMatrix();
    //circle(location.x, location.y, diameter); //ship hitbox 
  }//end display

  void update() {
    super.update();
    shotTimer++;

    if (upKey) velocity.add(direction);

    if (downKey) velocity.sub(direction);

    if (leftKey) direction.rotate(-radians(5));

    if (rightKey) direction.rotate(radians(5));
  }//end update
}
