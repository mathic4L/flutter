void tearoff() {
  staticMethodTearoff();
  instanceMethodTearoff();
  constructorTearOff();
}

void staticMethodTearoff() {
  final strings = Iterable<int>.generate(4, (x) => 100 + x)
      .map(String.fromCharCode)
      .toList();
}

/*
dart doesn't support that
 */
void instanceMethodTearoff() {}

/*
constructor could be passed if the expected function is
  - has the same return type
  - has the same parameters list

<ClassName>.new - unnamed
<ClassName>.<identifier> - named
 */
void constructorTearOff() {
  Person childhood(Person Function(String name, int age) personCreator,
      String name, int age) {
    var personInstance = personCreator(name, age);
    personInstance.age = 14;
    return personInstance;
  }

  childhood(Person.new, 'jessica', 0);
}

class Person {
  static int previousId = 0;

  Person(this.name, this.age) : _id = ++previousId;

  String name;
  int age;
  final int _id;
}
