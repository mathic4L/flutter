import 'package:callbacks/my_child.dart';
import 'package:flutter/material.dart';

class MyParent extends StatefulWidget {
  const MyParent({super.key, required this.items});

  final List<String> items;

  void onItemClick(counter) => counter++;

  @override
  State<MyParent> createState() => _MyParentState();
}

class _MyParentState extends State<MyParent> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("$counter"),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.items
            .map((e) => MyChild(
                  content: e,
                  onChange: () {
                    setState(() {
                      widget.onItemClick(counter++);
                    });
                  },
                ))
            .toList(),
      )
    ]);
  }
}
