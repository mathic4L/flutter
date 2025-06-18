import 'package:flutter/material.dart';
import 'package:recall_dart/model/car_color.dart';

import 'engine.dart';

class Car {
  Car({
    required this.maxSpeed,
    required this.engine,
    required this.price,
    required this.modelName,
    required this.color,
  });

  final String modelName;
  final double price;
  final int maxSpeed;
  final Engine engine;
  CarColor color;
}
