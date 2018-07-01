void main() {
  var names = List<String>();

  names.addAll(['Seth', 'Kathy', 'Lars']);

  print(names.toString() == '[Seth, Kathy, Lars]');
  print(names is List<String>);
}