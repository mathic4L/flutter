/*
'[]' & '[]=' override allows to operate this class instances in a collection way

usecases:
Custom collection types
Wrappers for Map or List
Matrix/grid-like structures
DSLs or config objects with flexible access (config['theme'] = 'dark')
 */

import 'package:dart_exercise/dart_exercise.dart';

class ThemeConfig {
  ThemeConfig({
    required this.lightness,
    required this.name,
    required this.basicFontSize,
  });

  String name;
  String lightness;
  String basicFontSize;

  // ReturnType operator [](IndexType index){...}
  String operator [](String key) {
    switch (key) {
      case "name":
        return name;
      case "lightness":
        return lightness;
      case "basic font size":
        return basicFontSize;
      default:
        throw Exception();
    }
  }

  // void operator []=(IndexType index, ValueType value){...}
  void operator []=(int index, String value) {
    //...
  }
}
