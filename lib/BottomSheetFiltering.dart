import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: Scfld()));
}

class Scfld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FilledButton.tonal(
              onPressed: () {
                showBS(context, List.generate(10, (index) => BottomSheetItem(name: "name $index")));
              },
              child: Text("sdf")),
        ],
      ),
    );
  }
}

@override
void showBS(BuildContext buildContext, List<BottomSheetItem> items) {
  showModalBottomSheet(
      context: buildContext,
      builder: (BuildContext context) {
        return SizedBox(
          child: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("filtering"),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('clear fiters'),
                        ),
                      ],
                    ),
                    exposedFieldsPlug,
                    ...items
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Do something when the bottom sheet button is pressed
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Close Bottom Sheet'),
                  ),
                )),
          ]),
        );
      });
}

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({super.key, required this.name});

  final String name;

  @override
  _BottomSheetItemState createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: double.infinity,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(widget.name), Icon(Icons.chevron_right)],
          ),
        ),
        SizedBox(height: 16)
      ],
    );
  }
}

Column exposedFieldsPlug = Column(
  children: List.generate(
    3,
    (index) => Column(
      children: [
        SegmentedButton(segments: List.generate(3, (index) => (ButtonSegment(value: index, icon: Icon(Icons.abc)))), selected: <int>{1}),
        SizedBox(height: 8)
      ],
    ),
  ),
);

Column notExposedFieldsPlug = Column(
  children: [],
);
