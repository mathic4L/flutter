abstract class Shape {
  final String name;
  const Shape(this.name);
}

class Circle extends Shape {
  final double radius;
  late final double area;

  Circle(double r)
      : radius = r,
        super('circle') {
    assert(r > 0);
    area = 3.14 * radius  * radius;
  }

  @override
  String toString() {
    Null nl = null;
    String? str = nl;
    return '$name(radius: $radius, area: $area)';
  }
}