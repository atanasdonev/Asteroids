boolean upKey, downKey, leftKey, rightKey, spaceKey, enter;
Ship ship;
Bullet bullet;
Asteroid asteroid;

ArrayList<Bullet> bulletsToRemove;
ArrayList<Asteroid> asteroidsToRemove;
ArrayList<Asteroid> asteroidsToAdd;
ArrayList<Asteroid> asteroids;

boolean gameState;
int score;
float gameTime;

void setup() {
  size(920, 720);
  ship = new Ship(new PVector(width/2, height/2), new PVector(0, 0), 55);
  bullet = new Bullet(new PVector(ship.location.x, ship.location.y), new PVector(ship.direction.x, ship.direction.y), 10);
  asteroids = new ArrayList<Asteroid>();
  gameState = true;
  asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
  asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
  asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
}//end setup

void draw() {
  background(0);
  bulletsToRemove = new ArrayList<Bullet>();
  asteroidsToAdd = new ArrayList<Asteroid>();
  asteroidsToRemove = new ArrayList<Asteroid>();

  //playing game
  if (gameState) {
    for (Asteroid a : asteroids) {
      a.display();
      a.update();
    }

    ship.display();
    ship.update();

    bullet.update();
    for (Bullet b : bullet.bullets) {
      b.display();
      b.update();
    }

    for (Asteroid a : asteroidsToRemove) {
      asteroids.remove(a);
    }

    for (Asteroid a : asteroidsToAdd) {
      asteroids.add(a);
    }

    for (Bullet b : bulletsToRemove) {
      bullet.bullets.remove(b);
    }

    if (asteroids.size() == 0) {
      asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
      asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
      asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
    }

    textAlign(RIGHT, TOP);
    textSize(24);
    text("Score: " + score, width - 100, 20);
  } else if (gameState == false) {
    fill(255);
    textAlign(CENTER, BOTTOM);
    text("GAME OVER", width/2, height/2 - 50);
    textSize(50);
    //display score
    text("Your score was " + score, width/2, height/2);
    textSize(24);
    text("Press enter to restart.", width/2, height/2 + 50);
  }

  gameTime += 1/frameRate;
  addAsteroids();
}//end draw

void keyPressed() {
  if (keyCode == UP) upKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
  if (keyCode == ' ') spaceKey = true;

  if (keyCode == ENTER) {
    ship = new Ship(new PVector(width/2, height/2), new PVector(0, 0), 55);
    asteroids = new ArrayList<Asteroid>();

    asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
    asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));
    asteroids.add(new Asteroid(new PVector(random(0, width), random(0, height)), new PVector(0, 2), 100));

    gameState = true;
  }
}//end keyPressed

void keyReleased() {
  if (keyCode == UP) upKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (keyCode == ' ') spaceKey = false;
}//end keyReleased
