void test() {
  var vl = VerticalLine(20, 15);
  print(vl.bottom);

  vl.bottom = 0;
  // vl.middle = 1; // error, no setter declared
}

class VerticalLine {
  double top, height;

  VerticalLine(this.top, this.height);

  double get bottom => top - height;

  set bottom(double bottom) {
    print("setting 'bottom'");
    top = bottom + height;
  }

  double get middle => top + height / 2;
}


