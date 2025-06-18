import 'package:oop/gettersAndSetters.dart';

void gettersAndSettersWithInheritance() {}

class VerticalRectangle extends VerticalLine {
  VerticalRectangle(super.top, super.height, this.width);

  double width;

  /*
  dart allows to override fields, however it's discouraged
   */
  /*
  @override
  double height = 10.0;
   */

  (double, double) get topLeft => (0.0, top);

  (double, double) get topRight => (width, top);

  (double, double) get bottomLeft => (0.0, bottom);

  (double, double) get bottomRight => (width, bottom);

  (double, double) get center => ((top - bottom) / 2, middle);
}
