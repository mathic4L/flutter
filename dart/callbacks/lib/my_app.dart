import 'package:callbacks/my_parent.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyParent(items: [
        'item1',
        'item2',
        'item3',
      ]),
    );
  }
}
