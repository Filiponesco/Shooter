class Player {
  float speed = 5;
  float hp = 100;
  float shield = 0;
  float x = width/2;
  float y = height/2;
  int xVelocity = 0;
  int yVelocity = 0;
  float angle=0;
  PVector location;
  int size = 40;
  Guns gun = new Guns();

  void move() {
    x += xVelocity * speed;
    y += yVelocity * speed;

    if (x < 0 + (size/2)) x = 0 + (size/2);
    if (x > width - (size/2)) x = width - (size/2);
    if (y < 0 + (size/2)) y = 0 + (size/2);
    if (y > height - (size/2)) y = height - (size/2);
  }

  void show() {
    rotating();
    pushMatrix();
    translate(x, y);
    rotate(angle);
    fill(255, 0, 0);
    ellipse(0, 0, size, size);
    popMatrix();

    textSize(40);
    text("HP "+ (int)hp, width-150, height-40);
    text("SH "+ (int)shield, width-150, height-8);
  }

  boolean collisionWithPowerUp(float a, float b) {
    if ( (x > a-20 && x < a+20) && (y > b-20 && y < b+20)) {
      return true;
    } else return false;
  }

  void setXVelocity(int vel) {
    this.xVelocity = vel;
  }

  void setYVelocity(int vel) {
    this.yVelocity = vel;
  }

  void rotating() {
    if (mouseX != x) {
      angle = (mouseY - y)/( mouseX - x);
      angle = atan(angle);
    }
  }

  float getX() {
    return this.x;
  }

  void setX(float x) {
    this.x = x;
  }

  float getY() {
    return this.y;
  }

  void setY(float y) {
    this.y = y;
  }
  int getXVelocity() {
    return this.xVelocity;
  }
  int getYVelocity() {
    return this.yVelocity;
  }

  float getAngle() {
    return this.angle;
  }

  float getHp() {
    return this.hp;
  }

  void setHp(float h) {
    this.hp = h;
  }

  float getShield() {
    return this.shield;
  }

  void setShield(float h) {
    this.shield = h;
  }

  float getSpeed() {
    return this.speed;
  }

  void setSpeed(float s) {
    this.speed = s;
  }

  float getSize() {
    return this.size;
  }

  boolean collisionWtihZombie(Zombie z) {
    float dist = sqrt( pow(this.x-z.getX(), 2) + pow(this.y-z.getY(), 2));
    if ( this.size/2 + z.getSize()/2 >= dist ) {
      return true;
    } else
      return false;
  }
}
