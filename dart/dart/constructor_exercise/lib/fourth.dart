class Rectangle {
  final double width;
  final double height;

  const Rectangle(this.width, this.height);

  Rectangle.square(double size) : this(size, size);

  factory Rectangle.fromJson(Map<String, dynamic> json) {
    final double width = json['width'];
    final double height = json['height'];
    return Rectangle(width, height);
  }

  @override
  String toString() => 'Rectangle($width, $height)';
}