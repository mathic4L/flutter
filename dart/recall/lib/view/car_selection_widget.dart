import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recall_dart/model/car_selection.dart';

import '../model/car.dart';
import '../model/engine.dart';
import 'car_widget.dart';

class CarSelectionWidget extends StatefulWidget {
  const CarSelectionWidget({super.key, required this.carSelection});

  final CarSelection carSelection;

  @override
  State<CarSelectionWidget> createState() => _CarSelectionWidgetState();
}

class _CarSelectionWidgetState extends State<CarSelectionWidget> {
  int? pickedIndex;

  @override
  void initState() {
    super.initState();
    pickedIndex = widget.carSelection.pickedIndex;
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (int i = 0; i < widget.carSelection.cars.length; i++) {
      widgets.add(CarWidget(
        car: widget.carSelection.cars[i],
        picked: i == pickedIndex,
        onTap: () {
          setState(() {
            pickedIndex = i;
          });
        },
      ));
      if (i < widget.carSelection.cars.length - 1) {
        widgets.add(Divider(
          height: 16,
        ));
      }
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}
