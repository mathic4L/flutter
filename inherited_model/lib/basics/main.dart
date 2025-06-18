import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inherited_model/basics/theme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _data = MyThemeData(Colors.blue, 16);

  void changeColor(MaterialColor value) => setState(() {
        _data = _data.copyWith(color: value);
      });

  void changeFontSize(int value) => setState(() {
        _data = _data.copyWith(fontSize: value);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ThemeModel(
        data: _data,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColorSettings(
              changeColor: changeColor,
            ),
            Divider(),
            FontSizeSettings(
              changeFontSize: changeFontSize,
            )
          ],
        ),
      ),
    ));
  }
}

class ColorSettings extends StatelessWidget {
  const ColorSettings({super.key, required this.changeColor});

  final void Function(MaterialColor color) changeColor;

  @override
  Widget build(BuildContext context) {
    final color = ThemeModel.colorOf(context);
    return Row(children: [
      Container(
        width: 32,
        height: 32,
        color: color,
      ),
      FilledButton(
          onPressed: () {
            final colors = [Colors.red, Colors.blue, Colors.green];
            final randomIndex = Random().nextInt(colors.length);
            final color = colors[randomIndex];
            changeColor(color);
          },
          child: Text('change'))
    ]);
  }
}

class FontSizeSettings extends StatelessWidget {
  const FontSizeSettings({super.key, required this.changeFontSize});

  final void Function(int value) changeFontSize;

  @override
  Widget build(BuildContext context) {
    final fontSize = ThemeModel.fontSizeOf(context);
    return Row(
      children: [
        Text(
          'fontsize is ${fontSize}',
          style: TextStyle(fontSize: fontSize as double),
        ),
        FilledButton(
            onPressed: () {
              final random = Random();
              final options = [16, 20, 24];
              final randomValue = options[random.nextInt(options.length)];
              changeFontSize(randomValue);
            },
            child: Text('change'))
      ],
    );
  }
}
