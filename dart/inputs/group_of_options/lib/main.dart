import 'package:flutter/material.dart';
import 'package:group_of_options/user_configured_input_chip.dart';
import 'package:my_lib/my_lib.dart';

import 'package:group_of_options/action_chip.dart';
import 'package:group_of_options/choice_chip.dart';
import 'package:group_of_options/filter_chip.dart';
import 'package:group_of_options/input_chip.dart';

void main() {
  runApp(const MyApp());
}

/*
m3 spec -> flitter m3:
  filter - choice, filter
  input - input
  suggestion - action
  action - action
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Widget> widgets = const [
    MyChoiceChips(),
    MyFilterChips(),
    MyActionChips(),
    MyInputChips(), // Forms()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return widgets[index];
          },
        ),
      ),
    );
  }
}
