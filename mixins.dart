/** To implement a mixin, create a class that extends Object, declares no constructors, and has no calls to super */
abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canCompose) {
      print('Humming to self');
    } else {
      print('Waving hands');
    }
  }
}

class Performer {
  perform() {
    print('Dancing');
  }
}

class Musician extends Performer with Musical {
  sing() {
    print('Singing');
  }
}

void main() {
  var msc = Musician();

  msc.sing();
}