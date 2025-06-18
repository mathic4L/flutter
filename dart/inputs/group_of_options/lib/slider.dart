import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_of_options/divided_slider.dart';
import 'package:group_of_options/simple_slider.dart';
import 'package:my_lib/my_lib.dart';

void main() {runApp(MyCore(body: MySlider()));}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var value = 0.0;

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
      title: 'slider',
      descendants: [
        MySimpleSlider(),
        MyDividedSlider()
      ],
    );
  }
}
