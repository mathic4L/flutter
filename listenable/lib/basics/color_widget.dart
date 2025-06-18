import 'package:flutter/material.dart';

import 'color_model.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.colorNotifier});

  final ColorModel colorNotifier;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorNotifier,
      child: Icon(
        Icons.color_lens_outlined,
        color: Colors.white,
      ),
      /*
      context - BuildContext passed from ListenableBuilder.build
      child - 'child' field with corresponding constructor's parameter
       */
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: 32,
          height: 32,
          color: colorNotifier.color,
          child: child,
        );
      },
    );
  }
}
