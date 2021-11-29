boolean timeReset = true;

void addAsteroids() {
  if ((int)gameTime % 10 == 1 && timeReset) {
    asteroids.add(new Asteroid(new PVector(random(0,width), random(0,height)), new PVector(0,2), 100));
    asteroids.add(new Asteroid(new PVector(random(0,width), random(0,height)), new PVector(0,2), 100));
    asteroids.add(new Asteroid(new PVector(random(0,width), random(0,height)), new PVector(0,2), 100));
    timeReset = false;
  }

  if ((int)gameTime % 5 == 4) {
    timeReset = true;
  }//end addAsteroids
}
