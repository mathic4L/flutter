import 'package:flutter/material.dart';

class MyCore extends StatelessWidget {
  const MyCore({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }
}
