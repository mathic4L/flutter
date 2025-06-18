import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyThreeStateCheckbox extends StatefulWidget {
  const MyThreeStateCheckbox({super.key});

  @override
  State<MyThreeStateCheckbox> createState() => _MyThreeStateCheckboxState();
}

class _MyThreeStateCheckboxState extends State<MyThreeStateCheckbox> {
  bool? toggle = false;

  /*
  cycle goes through
    false -> true -> null -> false
   */
  get onChanged => (bool? value) {
        setState(() {
          toggle = value;
        });
      };

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'threestate checkboxes',
      state: Text('state = $toggle'),
      body: ListTile(
        leading: Checkbox(
          value: toggle,
          onChanged: onChanged,
          tristate: true,
        ),
        title: const Text('some option'),
      ),
    );
  }
}
