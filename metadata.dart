library todo;

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);

  toString() => '$who, $what';
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

class Television {
  @deprecated
  void activate() {
    turnOn();
  }

  void turnOn() {
    print('turned on');
  }
}

void main() {
  var tv = Television();

  // tv.activate();
  tv.turnOn();

  doSomething();
}