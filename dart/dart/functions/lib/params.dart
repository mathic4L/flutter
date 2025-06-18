void paramsTest() {
  parametersTypeTest();
  paramsPassingTest();
}

/*

 */
parametersTypeTest() {
  personalInfo(42, name: "John", surname: "Doe");
}

void personalInfo(
  int age, {
  required String name,
  required String surname,
  String? secondName,
}) {
  print("personal info: "
      "age: $age, "
      "name: $name, "
      "surname: $surname, "
      "second name: $secondName");
}

/*
params are passed by value;
copying is shallow
 */
void paramsPassingTest() {
  var a = 42;
  var b = MyLaptop(model: 'macbook air', year: 2021);
  increment(a, b);
  print('a: $a; b: $b');
}

void increment(int a, MyLaptop laptop) {
  a++;
  laptop.year++;
}

class MyLaptop {
  MyLaptop({required this.model, required this.year});

  final String model;
  int year;

  @override
  String toString() {
    return 'MyLaptop{model: $model, year: $year}';
  }
}
