import 'package:flutter/material.dart';

/*
key parameters:
  segments
    list of options; int, String, bool and enum allowed
  multiSelectionEnabled
  emptySelectionAllowed
  selected
    initial value
  onSelectionChanged
  style
 */

enum Company { ford, kia, bmw, rimac }

class MySegmentedButton extends StatefulWidget {
  const MySegmentedButton({super.key});

  @override
  State<MySegmentedButton> createState() => _MySegmentedButtonState();
}

class _MySegmentedButtonState extends State<MySegmentedButton> {
  var selected = const <Company>{};

  void onSelectionChanged(Set<dynamic> newSelected) {
    setState(() {
      selected = newSelected.cast<Company>();
    });
  }

  SegmentedButton get segmentedButton {
    return SegmentedButton(
      segments: Company.values
          .map((e) => ButtonSegment(
              value: e, label: Text(e.name), icon: Icon(Icons.abc)))
          .toList(),
      selected: selected,
      emptySelectionAllowed: true,
      onSelectionChanged: onSelectionChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [segmentedButton],
      ),
    );
  }
}
