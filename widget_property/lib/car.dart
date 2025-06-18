import 'package:flutter/material.dart';

class Car {
  Car(this.wheelSize, this.color);

  WheelSize wheelSize;
  MaterialColor color;
}

enum WheelSize { big, medium, small }
