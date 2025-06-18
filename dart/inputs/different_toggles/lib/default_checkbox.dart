import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyDefaultCheckbox extends StatefulWidget {
  const MyDefaultCheckbox({super.key});

  @override
  State<MyDefaultCheckbox> createState() => _MyDefaultCheckboxState();
}

class _MyDefaultCheckboxState extends State<MyDefaultCheckbox> {
  var toggle = false;
  get onChanged => (bool? value) {
    setState(() {
      toggle = value!;
    });
  };

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'simple checkbox',
      state: Text('state = $toggle'),
      body: Row(
        children: [
          Checkbox(
            value: toggle,
            onChanged: onChanged,
          ),
          const Text('some option')
        ],
      ),
    );
  }
}
