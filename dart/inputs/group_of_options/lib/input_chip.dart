import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

import 'user_configured_input_chip.dart';
import 'user_provided_input_chips.dart';

void main() => runApp(MyCore(body: MyInputChips()));

class MyInputChips extends StatefulWidget {
  const MyInputChips({super.key});

  @override
  State<MyInputChips> createState() => _MyInputChipsState();
}

class _MyInputChipsState extends State<MyInputChips> {
  @override
  Widget build(BuildContext context) {
    return const MyTitleBody(
      title: 'input chips',
      descendants: [
        MyUserConfigurationInputChips(),
        MyUserProvidedInputChips(),
      ],
    );
  }
}
