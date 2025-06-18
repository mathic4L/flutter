import 'package:flutter/material.dart';

enum MyColor {
  red(Colors.red),
  green(Colors.green),
  blue(Colors.blue);

  const MyColor(this.materialColor);

  final MaterialColor materialColor;
}
