import 'package:flutter/material.dart';
import 'package:widget_property/car.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({super.key, required this.car});

  final Car car;

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  late final car = widget.car;

  void changeWheelSize(WheelSize value) => setState(() {
        widget.car.wheelSize = value;
      });

  MaterialColor get color {
    // correct
    return widget.car.color;

    // incorrect
    // return car.color;
  }

  double get wheelsDimension => switch (widget.car.wheelSize) {
        WheelSize.big => 128,
        WheelSize.medium => 64,
        WheelSize.small => 32,
      };

  @override
  Widget build(BuildContext context) {
    final wheel = Container(
      color: Colors.black,
      width: wheelsDimension,
      height: wheelsDimension,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${car == widget.car}'),
        Container(
          height: 64,
          width: 128,
          color: color,
        ),
        Container(
          height: 64,
          width: 256,
          color: color,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 64,
                ),
                wheel
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                wheel,
                SizedBox.square(
                  dimension: 64,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
