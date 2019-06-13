ArrayList<PVector> def_points;
ArrayList<PVector> points;
float n = 3;
float prop = 0.5f;
int w = 700;

void setup() {
  size(700, 700);
  
  def_points = new ArrayList<PVector>();
  points = new ArrayList<PVector>();
  
  float theta = 0;
  float d_theta = 2*PI/n;
  for (int i = 0; i < n; i++) {
    float radius = random(w*.45, w*.5);
    float rand_theta = random(-PI/(4*n), PI/(4*n));
    def_points.add(new PVector(radius*cos(theta+rand_theta) + width/2, radius*sin(theta+rand_theta) + height/2));
    theta += d_theta;
  }
  points.add(new PVector(random(0, width), random(0, height)));
}

void add_point() {
  PVector p = points.get(points.size()-1);
  PVector dp = def_points.get(floor(random(0, 1)*n));
  PVector diff = PVector.sub(dp, p).mult(prop);
  PVector new_p = PVector.add(p, diff);
  points.add(new_p);
}

void draw() {
  background(0);
  fill(255, 0, 0);
  strokeWeight(0);
  for (PVector p : def_points) {
    ellipse(p.x, p.y, 12, 12);
  }
  fill(255);
  for (PVector p : points) {
    ellipse(p.x, p.y, 3, 3);
  }
  for (int i = 0; i < 10; i++) {
    add_point();
  }
}
