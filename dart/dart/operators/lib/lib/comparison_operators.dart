/*
comparison operators override allows custom comparison, sorting and filtering behavior
'bool operator <comparison operator> (ComparedType value){...}'

'<(=)', '>(=)' overrides must be consistent with '==' behavior
Comparable makes override easier
 */

class Employee implements Comparable<Employee> {
  Employee({required this.name, required this.experience});

  final String name;
  int experience;

  @override
  int compareTo(Employee other) {
    return experience - other.experience;
  }

  bool operator >(Employee other) {
    return compareTo(other) > 0;
  }
  bool operator <(Employee other) {
    return compareTo(other) < 0;
  }
  bool operator >=(Employee other) {
    return compareTo(other) >= 0;
  }
  bool operator <=(Employee other) {
    return compareTo(other) <= 0;
  }
}
