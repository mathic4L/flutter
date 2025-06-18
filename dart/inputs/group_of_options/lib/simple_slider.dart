import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MySimpleSlider extends StatefulWidget {
  const MySimpleSlider({super.key});

  @override
  State<MySimpleSlider> createState() => _MySimpleSliderState();
}

class _MySimpleSliderState extends State<MySimpleSlider> {
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
      title: 'simple slider with [min;max] restriction',
      state: Text('current state = $value'),
      body: SizedBox(
          width: 360,
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: 1,
            max: 5,
          )),
    );
  }
}
