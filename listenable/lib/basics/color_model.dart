import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  ColorModel(MaterialColor color): _color = color;

  MaterialColor _color;

  MaterialColor get color => _color;

  void changeColor(MaterialColor value) {
    _color = value;
    notifyListeners();
  }
}