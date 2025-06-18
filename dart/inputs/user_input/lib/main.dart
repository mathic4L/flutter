import 'package:flutter/material.dart';
import 'package:user_input/buttons.dart';
import 'package:user_input/form.dart';
import 'package:user_input/group_of_options/segmented_button.dart';
import 'package:user_input/text.dart';
import 'package:user_input/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Buttons(),
            Texts(),
            TextFields(),
            // Forms()
          ],
        ),
      ),
    );
  }
}
