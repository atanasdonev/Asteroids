class GameObject {
  PVector velocity;
  PVector location;
  int diameter;

  GameObject(PVector loc, PVector vel, int d) {
    location = loc;
    velocity = vel;
    diameter = d;
  }

  void display() {
  }

  void update() {
    location.add(velocity);

    if (location.y < -50) location.y = height+50;
    if (location.y > height+50) location.y = -50;

    if (location.x < -50) location.x = width+50;
    if (location.x > width+50) location.x = -50;
  }
}
