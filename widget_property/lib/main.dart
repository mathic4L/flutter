import 'package:flutter/material.dart';
import 'package:widget_property/car.dart';
import 'package:widget_property/car_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late var color = Colors.blue;

  Widget get colorPicker => Row(
        mainAxisSize: MainAxisSize.min,
        children: [Colors.blue, Colors.green, Colors.red]
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      color = e;
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    color: e,
                  ),
                ))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            colorPicker,
            Divider(),
            CarWidget(car: Car(WheelSize.medium, color))
          ],
        ),
      ),
    );
  }
}
