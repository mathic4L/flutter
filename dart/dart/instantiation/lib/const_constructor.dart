void constConstructor() {
  const person = Person(name: "alex", sex: Sex.male);
}

class Person {
  /*
  const constructors is constrained to no body;
    parameter list, initializer list and super()
   */
  const Person({required this.name, required this.sex});

  final String name;
  final Sex sex;

  String get bio {
    return "$name, ${sex.name}";
  }
}

enum Sex { male, female }

