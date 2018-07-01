import 'dart:math';

abstract class Shapes {
  void doSomething() {}
}

class Rectangle extends Shapes {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;

  num get bottom => top + height;
  set bottom(num value) => top = value - height;

  String doSomething() {
    return 'top has ${this.top}';
  }
}

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  Logger._internal(this.name);

  /** Equivalent to static method in JS */
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class ImmutablePoint {
  /** static member */
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

class FinalPoint {
  final x;
  final y;
  final num distanceFromOrigin;

  FinalPoint(x, y): x = x, y = y, distanceFromOrigin = sqrt(x * x + y * y);

  FinalPoint.alongXAxis(num x): this(x, 0);
}

class Person {
  String firstName;

  Person.fromJson(Map data): firstName = 'Mike', assert(firstName == 'Mike') {
    print('in Person: $data, $firstName');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data): super.fromJson(data) {
    print('in Employee: $data');
  }
}

class Point {
  num x;
  num y;
  num z = 0;

  /** named constructor */
  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }

  Map<String, num> toJSON() {
    return {
      'x': x,
      'y': y,
      'z': z,
    };
  }

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;

    return sqrt(dx * dx + dy * dy);
  }
}

printInteger(num aNumber) {
  print('The number is $aNumber. ${aNumber.runtimeType}');
}

void doStuff({
  List<num> list = const [1,2,3],
  Map<String, String> gifts = const {
    'first': 'paper',
    'second': 'cotton',
    'third': 'leather',
  }
}) {
  print('list: $list');
  print('gifts: $gifts');
}

main(List <String> args) {
  const number = 42.0;
  const list = [1,2,3];
  var printString = () => 'haha';

  printInteger(number);
  doStuff();
  print('args: $args');
  print(printString());
  print(100 ~/ 3);
  print(.2 + .4);
  print(.2.toString().runtimeType);

  var a = list.where((n) => n > 1).toSet();
  print(a);

  var b = () {
    switch (true) {
      case (1 == 1): {
        return 'a';
      }
      default:
        return 'b';
    }
  };
  print(b());

  var point = Point(2, 4);
  print('point.toJSON: ${point.toJSON()}');
  print('point.distanceTo: ${point.distanceTo(Point(4, 2))}');

  var emp = Employee.fromJson({});

  if (emp is! Person) {
    emp.firstName = 'Bob';
  }

  if (emp is Employee) {
    emp.firstName = 'Jane';
  }

  print(emp.firstName);

  var fp = FinalPoint(2, 3);
  var fpx = FinalPoint.alongXAxis(12);

  print(num.parse(fp.distanceFromOrigin.toStringAsFixed(3)).runtimeType);
  print('fp has: ${fp.x}, ${fp.y}, ${fp.distanceFromOrigin}');
  print('fpx has: ${fpx.x}, ${fpx.y}, ${fpx.distanceFromOrigin}');

  var ip = ImmutablePoint(1, 2);
  print('ip has ${ip.x} ${ip.y}');
  print('ip.origin has ${ImmutablePoint.origin.x} ${ImmutablePoint.origin.y}');

  var logger = Logger('UI');
  logger.log('Button clicked: ${logger.name}');

  var rect = Rectangle(3, 4, 20, 15);
  rect.right = 12;
  print('''rect has {
  top: ${rect.top},
  bottom: ${rect.bottom},
  left: ${rect.left},
  right: ${rect.right},
  width: ${rect.width},
  height: ${rect.height}
}''');
  print(rect.doSomething());
}