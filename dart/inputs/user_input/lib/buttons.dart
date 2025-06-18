import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

/*
key params
  onPressed
    void callback
  child
  style
 */

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          FilledButton.tonal(
            onPressed: () => myShowDialog(context),
            child: const Text("Click me"),
          ),
          Divider(),
          FilledButton.icon(
            onPressed: () => myShowDialog(context),
            icon: Icon(Icons.add),
            label: Text("Click me"),
          ),
        ],
      ),
    );
  }
}
