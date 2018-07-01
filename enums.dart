enum Color { red, green, blue }

void main() {
  List<Color> colors = Color.values;

  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);
  print(colors[2] == Color.blue);
}

