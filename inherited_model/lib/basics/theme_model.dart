import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeModel extends InheritedModel<ThemeModelAspect> {
  const ThemeModel({super.key,  required MyThemeData data,required super.child,})
      : _data = data;

  final MyThemeData _data;

  @override
  bool updateShouldNotify(ThemeModel oldWidget) {
    return oldWidget._data != _data;
  }

  static MaterialColor colorOf(BuildContext context) {
    return InheritedModel.inheritFrom<ThemeModel>(context,
            aspect: ThemeModelAspect.color)!
        ._data
        .color;
  }

  static int fontSizeOf(BuildContext context) {
    return InheritedModel.inheritFrom<ThemeModel>(context,
            aspect: ThemeModelAspect.fontSize)!
        ._data
        .fontSize;
  }

  @override
  bool updateShouldNotifyDependent(
      ThemeModel oldWidget, Set<ThemeModelAspect> dependencies) {
    if (oldWidget._data.fontSize != _data.fontSize &&
        dependencies.contains(ThemeModelAspect.fontSize)) {
      return true;
    }
    if (oldWidget._data.color != _data.color &&
        dependencies.contains(ThemeModelAspect.color)) {
      return true;
    }
    return false;
  }
}

enum ThemeModelAspect { color, fontSize }

class MyThemeData {
  const MyThemeData(this.color, this.fontSize);

  final MaterialColor color;
  final int fontSize;

  MyThemeData copyWith({MaterialColor? color, int? fontSize}) =>
      MyThemeData(color ?? this.color, fontSize ?? this.fontSize);
}
