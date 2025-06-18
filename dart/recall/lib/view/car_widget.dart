import 'package:flutter/material.dart';
import 'package:recall_dart/model/car_color.dart';

import '../model/car.dart';

class CarWidget extends StatefulWidget {
  const CarWidget({
    super.key,
    required this.car,
    required this.onTap,
    required this.picked,
  });

  final Car car;
  final VoidCallback onTap;
  final bool picked;

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  late CarColor pickedCarColor;

  @override
  void initState() {
    super.initState();
    pickedCarColor = widget.car.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.car.modelName),
                widget.picked ? Icon(Icons.check) : Container()
              ],
            ),
            Column(
              children: [
                keyValue("engine:", "${widget.car.engine}"),
                keyValue("price", "${widget.car.price}"),
                keyValue("max speed", "${widget.car.maxSpeed}"),
                _ColorPanel(
                    pickedCarColor: pickedCarColor,
                    onTap: (x) {
                      setState(() {
                        pickedCarColor = x;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget keyValue(String key, String value) {
    return Row(
      children: [
        Text("$key:"),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _ColorPanel extends StatelessWidget {
  const _ColorPanel(
      {super.key, required this.pickedCarColor, required this.onTap});

  final CarColor pickedCarColor;
  final void Function(CarColor) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: CarColor.values.map((iCarColor) {
        return GestureDetector(
          onTap: () {
            onTap(iCarColor);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: iCarColor.color,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: SizedBox(
              width: 32,
              height: 32,
              child: iCarColor == pickedCarColor
                  ? Icon(
                      Icons.check,
                      size: 32,
                    )
                  : SizedBox(
                      width: 32,
                      height: 32,
                    ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
