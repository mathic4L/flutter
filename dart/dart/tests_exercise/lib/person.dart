class Person {
  Person(
      {required this.sex,
      required this.name,
      required this.age,
      required this.favoriteColor});

  final String name;
  final Sex sex;
  int age;
  String favoriteColor;

  void birthday() {
    age++;
  }



}

enum Sex { male, female }
