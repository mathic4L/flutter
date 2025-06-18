import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ThemeInherited(
            color: Colors.blue,
            child: MyBuilder(
                builder: (context) => Container(
                      width: 32,
                      height: 32,
                      color: context
                          .dependOnInheritedWidgetOfExactType<ThemeInherited>()!
                          .color,
                    ))),
      ),
    );
  }
}

class MyBuilder extends StatelessWidget {
  const MyBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

class ThemeInherited extends InheritedWidget {
  const ThemeInherited({super.key, required super.child, required this.color});

  final MaterialColor color;

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) {
    return color != oldWidget.color;
  }
}
