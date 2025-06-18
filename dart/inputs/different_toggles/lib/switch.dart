import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

/*
SwitchListTile = ListTile with 'trailing: Switch'
 */
void main() => runApp(MyCore(body: MySwitch()));

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  var toggle = false;

  get onChanged => (bool? value) {
        setState(() {
          toggle = value!;
        });
      };

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'switch',
      state: Text('state = $toggle'),
      body: ListTile(
          leading: Switch(
            value: toggle,
            onChanged: onChanged,
          ),
          title: const Text('some option')),
    );
  }
}
