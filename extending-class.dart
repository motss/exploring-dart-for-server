class Television {
  void turnOn() {
    print('tv turned on');
  }
}

class SmartTelevision extends Television {
  void turnOn2() {
    super.turnOn();

    print('smart tv turned on 2');
  }

  @override
  String turnOn() {
    const msg = 'SmartTelevision turned on';

    print('$msg');

    return msg;
  }
}

void main() {
  SmartTelevision().turnOn();
  SmartTelevision().turnOn2();
}