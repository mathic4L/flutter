class Person {
  Person(this.name, this.age, this.sex);

  String name;
  int age;
  String sex;

  void sexChange() {
    this
      ..name = 'Jane'
      ..sex = sex == 'male' ? 'female' : 'male';
  }
}
