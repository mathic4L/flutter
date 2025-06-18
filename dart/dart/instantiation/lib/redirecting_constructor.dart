class Student extends Person {
  Student({
    required this.university,
    required super.name,
    required super.sex,
  });

  Student.mit({
    required String name,
    required Sex sex,
  }) : this(university: 'mit', name: name, sex: sex);

  final String university;
}

class Person {
  Person({
    required this.sex,
    required this.name,
  });

  final String name;
  final Sex sex;
}

enum Sex { male, female }
