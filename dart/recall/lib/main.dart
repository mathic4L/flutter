import 'package:flutter/material.dart';
import 'package:recall_dart/model/car_color.dart';
import 'package:recall_dart/model/car_selection.dart';
import 'package:recall_dart/view/car_selection_widget.dart';
import 'package:recall_dart/view/car_widget.dart';
import 'package:recall_dart/model/engine.dart';

import 'model/car.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var carSelection = CarSelection(0, [
    Car(
        maxSpeed: 100,
        engine: Engine.ecobust,
        price: 10000,
        modelName: "ford fiesta",
        color: CarColor.blue),
    Car(
        maxSpeed: 200,
        engine: Engine.hemi,
        price: 22000,
        modelName: "dodge viper",
        color: CarColor.blue),
    Car(
        maxSpeed: 120,
        engine: Engine.twojz,
        price: 15000,
        modelName: "toyota supra",
        color: CarColor.blue),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: CarSelectionWidget(carSelection: carSelection),
        ),
      ),
    );
  }
}
