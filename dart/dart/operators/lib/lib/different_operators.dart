void typeOperators() {
  /*
  as: down-casting
   */
  Object message = "hello world!";
  String string = message as String;

  /*
  is & is!: type-check
  'is' and 'is!'checks whether the obj HAS the specified type, not whether it's of that type
   */
  dynamic employeeJohn = Employee(name: "John", age: 30, department: "IT");
  if (employeeJohn is! Person) {
    print("john is not a person!");
  }
}

void nullSafetyOperators() {
  /*
  '??=': assigns the right operand if the left operand is null
   */
  String? message;
  print(message ??= "hello world!");

  String? message2 = " hello ";
  print(message2?.trim());
}

void cascadeOperator() {
  var person = Animal()
    ..name = "rick"
    ..favouriteToy = "stick";

  /*
  cascade operator returns the modified object, not the called method's return value
   */
  var trimmedStr = " hello "..trim(); // -> trimmedStr = " hello ", not "hello"
}

// ------------------------

class Person {
  Person({
    required this.name,
    required this.age,
  });

  final String name;
  int age;
}

class Employee extends Person {
  Employee({required super.name, required super.age, required this.department});

  String department;
}

class Animal {
  String? name;
  String? favouriteToy;
}
