import 'package:different_toggles/default_checkbox.dart';
import 'package:different_toggles/three_state_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

/*
CheckboxListTile = ListTile with 'trailing: Checkbox'
 */
void main() => runApp(MyCore(body: MyCheckboxes()));

class MyCheckboxes extends StatefulWidget {
  const MyCheckboxes({super.key});

  @override
  State<MyCheckboxes> createState() => _MyCheckboxesState();
}

class _MyCheckboxesState extends State<MyCheckboxes> {
  @override
  Widget build(BuildContext context) {
    return MyTitleBody(title: 'checkboxes', descendants: [
      MyDefaultCheckbox(),
      MyThreeStateCheckbox(),
    ]);
  }
}
