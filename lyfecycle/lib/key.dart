import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  Container
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool extra = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                Car(
                  // key: Key('1'),
                  modelName: 'x',
                ),
                if (extra) Icon(Icons.check),
                FilledButton(
                    onPressed: () {
                      setState(() {
                        extra = !extra;
                      });
                    },
                    child: Text('click')),
                Car(
                  // key: Key('2'),
                  modelName: 'y',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Car extends StatefulWidget {
  const Car({
    super.key,
    required this.modelName,
  });

  final String modelName;

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  var black = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all()),
      child: Row(
        children: [
          Text(widget.modelName),
          GestureDetector(
              onTap: () {
                setState(() {
                  black = !black;
                });
              },
              child: Container(
                width: 32,
                height: 32,
                color: black ? Colors.black : Colors.white70,
              ))
        ],
      ),
    );
  }
}
