import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyDividedSlider extends StatefulWidget {
  const MyDividedSlider({super.key});

  @override
  State<MyDividedSlider> createState() => _MyDividedSliderState();
}

class _MyDividedSliderState extends State<MyDividedSlider> {
  var value = 3.0;

  void Function(double) get onChanged {
    return (double value) {
      setState(() {
        this.value = value;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'slider with sticky divisions',
      state: Text('current state = $value'),
      body: SizedBox(
          width: 360,
          child: Slider(
            label: 'discrete volume',
            value: value,
            onChanged: onChanged,
            min: 1,
            max: 5,
            divisions: 4,
          )),
    );
  }
}
