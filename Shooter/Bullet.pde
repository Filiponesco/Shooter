class Bullet{
  float x;
  float y;
  float velX;
  float velY;
  float angle;
  float damage;
  int xsize = 20;
  int ysize = 10;
  
  Bullet(float a, float b, float vx, float vy, float ang, float d){
    this.x = a;
    this.y = b;
    this.velX = vx;
    this.velY = vy;
    this.angle = ang;
    this.damage = d;
  }
  
  void move(){
    x += velX;
    y += velY;
  }
  
  void show(){
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rectMode(CENTER);
    fill(255,0,0);
    rect(0, 0, xsize, ysize);
    popMatrix();
  }
  
  void update(){
    this.move();
    this.show();
  }
  
  boolean outOfRange(){
    if(this.x > width || this.x < 0 || this.y > height || this.y < 0){
      return true;
    }
    else return false;
  }
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  
  int getXsize() {
    return this.xsize;
  }
  
  int getYsize() {
    return this.ysize;
  }
}
