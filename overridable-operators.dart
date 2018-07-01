class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  print('v + w: (${(v + w).x}, ${(v + w).y})');
  print('v - w: (${(v - w).x}, ${(v - w).y})');
}