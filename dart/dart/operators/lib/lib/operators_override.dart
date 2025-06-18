/*
only operators considered instance members could be overridden:
+, -, *, /, ~/
|, &, ^,  >>, >>>, <<
- (negation)
[], []=
>(=), <(=), ==, ~-
 */

class Person {
  Person({
    required this.name,
    required this.age,
    required this.sex,
  });

  final String name;
  final Sex sex;
  int age;

  Family operator +(Person person) {
    return sex == Sex.male
        ? Family(female: person, male: this)
        : Family(female: this, male: person);
  }
}

class Family {
  Family({this.female, this.male});

  Person? female;
  Person? male;
  List<Person> children = [];
}

enum Sex { male, female }
