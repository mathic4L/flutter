import 'package:flutter/material.dart';

enum CarColor {
  red(color: Colors.red),
  green(color: Colors.green),
  blue(color: Colors.blue);

  const CarColor({required this.color});

  final Color color;
}
