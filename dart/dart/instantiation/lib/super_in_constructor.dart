void superInConstructor() {
  superParametersForwarding();
  orderOfExecution();
}

void superParametersForwarding() {
  var student = Student.superInitializerParameters(
      name: "wain", age: 22, university: "MIT", sex: Sex.male);
}

void orderOfExecution() {
  var student = Student.order(university: 'stanford', age: 21);
}

class Student extends Person {
  /*
  Arguments to the superclass constructor can't access this
  super arguments can't refer to 'this'
   */

  /*
  order of execution:
    initializing formal parameters & initializer list
    super constructor arguments evaluation if they're expressions
    super constructor & forwarded super parameters
    this class' constructor body
   */
  Student.order({required String university, required super.age})
      : university = (() {
          print('initializing this.university');
          return university;
        }).call(),
        super(
            sex: (() {
              print('evaluating super\'s arguments');
              return Sex.male;
            }).call(),
            name: 'bill');

  /*
  super-initializer parameters
  the same is:
  Student({required String name, required int age, required this.university})
      : super(name: name, age: age);

  you can't use this with redirecting constructor
   */
  Student.superInitializerParameters(
      {required super.name,
      required super.age,
      required super.sex,
      required this.university});

  String university;

  @override
  String get bio {
    return "${super.bio}, study at $university";
  }
}

class Person {
  Person({required this.name, required this.age, required this.sex}) {
    print("initializing person...");
  }

  Person.namedAlex({required this.age})
      : name = 'alex',
        sex = Sex.male {
    print("initializing person named Alex...");
  }

  final String name;
  final Sex sex;
  int age;

  String get bio {
    return "$name, $age y.o.";
  }
}

enum Sex { male, female }
