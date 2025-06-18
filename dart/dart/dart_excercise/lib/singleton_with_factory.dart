class Person {
  factory Person({String? name, int? age}) {
    if (instance != null) {
      return instance!;
    } else if(name != null && age != null) {
        instance = Person._initialize(name: name, age: age);
        return instance!;
    } else {
      throw Exception("null");
    }
  }

  Person._initialize({required this.name, required this.age});

  static Person? instance;
  final String name;
  final int age;
}
