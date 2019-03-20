class Zombie {
  float hp;
  float size;
  float shield = 0;
  int attackPower = 0;
  int attackSpeed = 0;
  float x;
  float y;
  float angle = 0;
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector separation;
  float maxForce = 0.5;
  float maxSpeed = 2;
  float distanceToPlayer = 0;
  float damage;
  float kolor;

  Zombie() {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    float h=height-size/2;
    float w=width-size/2;
    int pom = (int)random(0, 3+1);
    if (pom==0) {
      position = new PVector(size/2, (int)random(size/2, h+1));
    }
    if (pom==1) {
      position = new PVector((int)random(size/2, w+1), size/2);
    }
    if (pom==2) {
      position = new PVector(w, (int)random(size/2, h+1));
    }
    if (pom==3) {
      position = new PVector((int)random(size/2, w+1), h);
    }
    float rand = (int)random(1, 4);
    hp = map(rand, 1, 3, 60, 100); //hp od 60 do 100 co 20
    //size = map(rand, 1, 3, 40, 50); //hp od 35 do 45 co 5
    size = 40;
    damage = map(rand, 1, 3, 0.3, 0.9); //dane zombie ma zawsze taki sam damage nawet jesli zostanie postrzelony
    //maxSpeed = map(rand, 1, 3, 3, 1);
    maxSpeed = 2;
  }
  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxSpeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }
  void show() {
    rotating();
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    noStroke();
    ellipseMode(CENTER);
    kolor = map(hp, 0, 100, 0, 255);
    fill(255 - kolor, kolor, 0);
    ellipse(0, 0, size, size);
    popMatrix();
  }
  void rotating() {
    if (guy.getX() != x) {
      angle = (guy.getY() - position.y) / (guy.getX() - position.x);
      angle = atan(angle);
    }
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  void applyBehaviors(ArrayList<Zombie> zombies) {
    PVector separateForce = separate(zombies);
    PVector seekForce = seek(new PVector(guy.getX(), guy.getY()));
    separateForce.mult(1.5);
    seekForce.mult(0.5); //!!!!bylo 1
    applyForce(separateForce);
    applyForce(seekForce);
    PVector player = new PVector(guy.getX(), guy.getY());
    PVector toPlayer = player.sub(position);
    distanceToPlayer = toPlayer.mag();

    if (collisionWithPlayer()) {
      velocity.mult(0);
      acceleration.mult(0);
      attack();
    }
  }
  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the location to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxSpeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);  // Limit to maximum steering force

    return steer;
  }
  // Separation
  // Method checks for nearby vehicles and steers away
  PVector separate (ArrayList<Zombie> zombies) {
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Zombie other : zombies) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      float desiredseparation = size; //!!!!!!!!!NALEZY ZWROCIC UWAGE 
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxSpeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxForce);
    }
    return sum;
  }
  Boolean intersects(Zombie other) {
    float d = dist(this.x, this.y, other.x, other.y);
    if (d < this.size) return true;
    else return false;
  }
  void attack() {
    if (guy.getShield() > 0) {
      guy.setShield(guy.getShield() - damage);
    } else {
      guy.setHp(guy.getHp() - damage);
    }
  }
  boolean collisionWithBullets(Bullet b, Zombie z) {
    float d = dist(position.x, position.y, b.getX(), b.getY());
    if (d < z.getSize()/2 + b.getYsize()/2) {
      z.setHp(z.getHp() - guy.gun.getDamage());
      return true;
    } else return false;
  }
  boolean death(Zombie z) {
    if (z.getHp() <= 0) {
      return true;
    } else return false;
  }
  boolean collisionWithPlayer() {
    if (distanceToPlayer < (guy.getSize() + this.size) / 2)
      return true;
    else
      return false;
  }
  PVector getPosition() {
    return this.position;
  }
  float getX() {
    return this.position.x;
  }
  float getY() {
    return this.position.y;
  }
  void setX(float x) {
    this.position.x = x;
  }
  void setY(float y) {
    this.position.y = y;
  }
  void setHp(float hp) {
    this.hp = hp;
  }
  float getHp() {
    return this.hp;
  }
  float getSize() {
    return this.size;
  }
  void setSize(float size) {
    this.size = size;
  }

  float getDamage() {
    return this.damage;
  }
}
