import 'dart:math';

/*
dart doesn't have 'equal()'

'==' overridden? -> 'hashcode' MUST be overridden to keep consistency;
'hashcode' overridden? -> '==' is preferred be overridden

'a == b' is effectively 'identical(a,b)' given '==' isn't overridden for a's class
 */

void equality() {
  var person = Person(name: 'John', age: 30);
}

class Person {
  Person({required this.name, required this.age})
      : geneticCode = initializeGenetics();

  final String geneticCode;
  final String name;
  int age;

  static String initializeGenetics() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(
        15, (_) => chars[Random.secure().nextInt(chars.length)]).join();
  }

  @override
  bool operator ==(Object other) {
    if (other is Person) {
      return geneticCode == other.geneticCode;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => geneticCode.hashCode;
}
