class Bullet extends GameObject {
  ArrayList<Bullet> bullets;

  Bullet(PVector loc, PVector vel, int d) {
    super(loc, vel, d);
    velocity.setMag(10);
    bullets = new ArrayList<Bullet>();
  }//end constructor

  void display() {
    stroke(255);
    noFill();
    circle(location.x, location.y, diameter);
  }//end display

  void update() {
    location.add(velocity);

    if (spaceKey && ship.shotTimer > ship.threshold) {
      bullets.add(new Bullet(new PVector(ship.location.x, ship.location.y), new PVector(ship.direction.x, ship.direction.y), 10));
      //println("pew pew");
      ship.shotTimer = 0;
    }

    bulletOfScreen();
    collide();
  }//end update

  void collide() {
    for (Asteroid a : asteroids) {
      float d = this.location.dist(a.location);
      if (d < a.diameter/2 + bullet.diameter) {
        bulletsToRemove.add(this);
        if (a.diameter > 25) {
          Asteroid child1 = new Asteroid(new PVector(a.location.x, a.location.y), new PVector(0,2), a.diameter/2);
          asteroidsToAdd.add(child1);
          Asteroid child2 = new Asteroid(new PVector(a.location.x, a.location.y), new PVector(0,2), a.diameter/2);
          asteroidsToAdd.add(child2);
        }
        asteroidsToRemove.add(a);
        addScore(a.diameter);
      }
    }
  }//end collide

  void bulletOfScreen() {
    if (location.x > width + 10) {
      bulletsToRemove.add(this);
    } else if (location.x < -10) {
      bulletsToRemove.add(this);
    }

    if (location.y > height + 10) {
      bulletsToRemove.add(this);
    } else if (location.y < -10) {
      bulletsToRemove.add(this);
    }
  }//end bulletOfScreen

  void addScore(int diameter) {
    if(diameter <= 30){
      score += 200;
    }else if(diameter <= 60){
      score += 150;
    }else if(diameter <= 100){
      score += 100;   
    }
  }//end addScore
  
}
