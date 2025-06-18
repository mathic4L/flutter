/*
mixins can't instantiate their own members
since they don't have any constructors;
but they sometimes need to access instance members
 */

void test() {
  var employee = Employee('John', 'developer');
  employee.introduce(); // setter and getter
}

/*
solution 1 - getters and setters in mixins
they are
 */
mixin PersonMixin {
  int age = 1;

  String get name;

  set name(String value);

  void introduce() {
    print(name);
    print(age);
  }
}

class Employee with PersonMixin {
  Employee(this.name, this.occupation);

  @override
  String name;
  String occupation;

  /*
   age is inherited with its setter, getter
   and ALSO default value
   */
  @override
  introduce() {
    print('''hello, my name is $name. 
    I am $occupation 
    and I am $age years old''');
  }
}
