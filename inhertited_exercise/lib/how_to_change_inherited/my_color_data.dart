import 'package:flutter/material.dart';

class MyThemeData {
  MyThemeData(this.isDark);

  bool isDark;

  MyThemeData copyWith({bool? isDark}) => MyThemeData(isDark ?? this.isDark);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyThemeData &&
          runtimeType == other.runtimeType &&
          isDark == other.isDark;

  @override
  int get hashCode => isDark.hashCode;
}
