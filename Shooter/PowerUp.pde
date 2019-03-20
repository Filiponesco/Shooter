class PowerUp{
  int hp;
  float speed;
  int shield;
  float x = (int)random(0, width-19);
  float y = (int)random(0, height-19);
  String txt;
  int number = (int)random(1, 4);
  
  PowerUp(){
    switch(number){
      case 1:
        hp = 50;
        txt = "HP";
        break;
      case 2:
        shield = 50;
        txt = "SH";
        break;
      case 3:
        speed = 5;
        txt = ">>";
        break;
    }
  }
    
    void show(){
      rect(this.x, this.y, 20, 20);
      textSize(12);
      fill(255, 0, 0);
      text(txt, this.x-10, this.y+10);
      fill(255, 255, 255);
    }
    
    float getX(){
      return this.x;
    }
    
    float getY(){
      return this.y;
    }
    
    void use(Player guy){
      float p;
      float s;
      
      switch(number){
      case 1:
        p = guy.getHp();
        p += hp;
        if(p > 100) p = 100;
        guy.setHp(p);
        break;
      case 2:
        p = guy.getShield();
        p += shield;
        if(p > 100) p = 100;
        guy.setShield(p);
        break;
      case 3:
        s = guy.getSpeed();
        s += speed;
        guy.setSpeed(s);
        thread("speed");
        break;
    }
  }
}
