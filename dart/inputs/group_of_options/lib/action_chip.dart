import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

void main() => runApp(MyCore(body: MyActionChips()));

class MyActionChips extends StatefulWidget {
  const MyActionChips({super.key});

  @override
  State<MyActionChips> createState() => _MyActionChipsState();
}

class _MyActionChipsState extends State<MyActionChips> {
  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'action chips',
      body: ActionChip(
        label: Text('click!'),
        tooltip: 'i\'m a tooltip!',
        avatar: CircleAvatar(),
        onPressed: () {
          myShowDialog(context);
        },
      ),
    );
  }
}
