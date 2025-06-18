import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.blueGrey, child: child,);
  }
}
