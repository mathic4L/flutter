void abstractInterfaceClass() {
  /*
  doesn't compile; can't be instantiated
   */
  // var furniture = Furniture(10, 10,10);
}

abstract interface class Furniture {
  Furniture(this.width, this.length, this.height);

  final double width;
  final double length;
  final double height;

  String get manufacturerInfo;
}
