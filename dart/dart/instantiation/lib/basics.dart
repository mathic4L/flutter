void basics() {
  /*
  objects could be constructed either with constructor or literal or both depending on type
   */
  String message = "hello";

  List<String> messagesList = ["a", "b"];
  List<String> messagesList2 = List<String>.filled(2, "", growable: true);

  Person person = Person(name: "John", age: 18);
}

// ------------------------

class Person {
  Person({required this.name, required this.age});

  final String name;
  int age;

}


