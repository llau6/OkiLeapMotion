//class pts
//{
//  int nv=0;
//  int pv=0;
//  int maxnv=100*2*2*2*2*2*2*2*2;
//  pt[] G = new pt [maxnv];
  
//  pts() {}
//  //void declare() {for (int i=0; i<maxnv; i++) G[i]=P(0,0); }
//  void addPt(pt P) { G[nv].setTo(P); pv=nv; nv++;  }  
//  void addPt(float x,float y) { G[nv].x=x; G[nv].y=y; pv=nv; nv++; }
//}

class pts {
  int max = 100;
  int num = 0;
  pt[] P;
  pts() {
    P = new pt[max];
  }
  void add(pt X) {
    P[num++] = X;
  }
  int getNum() {
    return num;
  }
  void update() {
    for (int i = 0; i < num; i++) {
      P[i].update();
    }
  }
}

class pt {
  PVector pos;
  PVector vel;
  PVector acc;
  pt(float x, float y) {
    pos = new PVector(x, y);
  }
  pt(float x, float y, float vx, float vy) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
  }
  pt(float x, float y, float vx, float vy, float ax, float ay) {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector(ax, ay);
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    //Check screen border collisions
    if (pos.x > width) {
      pos.x = width;
      vel.x = -vel.x;
    }
    if (pos.x < 0) {
      pos.x = 0;
      vel.x = -vel.x;
    }
    if (pos.y > height) {
      pos.y = height;
      vel.y = -vel.y;
    }
    
  }
}

class edge {
  pt A,B;
  edge(pt A, pt B) {
    this.A = A;
    this.B = B;
  }
  void show() {
    line(A.pos.x, A.pos.y, B.pos.x, B.pos.y);
  }
  float mag() {
    return (sqrt(pow(B.pos.y - A.pos.y,2) + pow(B.pos.x - A.pos.x, 2)));
  }
  pt mid() {
    return new pt((A.pos.x + B.pos.x)/2, (A.pos.y + B.pos.y)/2);
  }
}

void show(pt X) {
  fill(color(255,0,0));
  ellipse(X.pos.x, X.pos.y, 1, 1);
}

float dist(pt A, pt B) {
  return PVector.dist(A.pos, B.pos);
}