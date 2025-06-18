import 'package:flutter/material.dart';

class MyStateView extends StatelessWidget {
  const MyStateView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(235, 233, 233, 1)
      ),
      child: child,
    );
  }
}
