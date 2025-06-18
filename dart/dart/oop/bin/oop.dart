
void main(List<String> arguments) {
  print('Hello world: !');
}

import 'package:flutter/material.dart';

/*
entry point
 */
void main() {

}

void interpolation() {
  String world = "world!";
  print("hello $world");
}

void variables(int input) {
  /*
  dynamic может изменять тип значения на любой
  "dynamic" type means no type checks of the variable at compile time
  */
  dynamic a = "abc";
  a = 45;
  a = false;

  /*
  compile-time and run-time constants
   */
  const int c = 45;
  final int b = input;

  var auto = "valera";
}

void elses() {
  /*
  a / 4 // ->->-> 1.5 (double)
  a ~/ 4 // ->->-> 1 (int)
   */
}

void collections() {
  /*
  // List == java collections
  List a = [1, 2, true, "abc"];
  List<int> b = [1, 2, 3];
  list.add(element);
// list.first == list[0], list.last == list[n]

   */
}
