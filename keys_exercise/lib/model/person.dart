import 'package:flutter/material.dart';
import 'package:keys_exercise/model/color.dart';

class Person {
  Person(this.name, this.favouriteColor);

  String name;
  MyColor favouriteColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          (name == other.name && favouriteColor == other.favouriteColor);

  @override
  int get hashCode => name.hashCode ^ favouriteColor.hashCode;
}
