import 'package:flutter/material.dart';

class MyChild extends StatelessWidget {
  const MyChild({super.key, required this.content, required this.onChange});

  final String content;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 50, height: 50),
          Text(content),
          FilledButton(
            onPressed: onChange,
            child: const Text("click"),
          )
        ]);
  }
}
