import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnchor extends StatelessWidget {
  const MyAnchor({super.key, required this.title});

  final String title;
  static const color = CupertinoColors.systemBlue;

  Widget get avatar {
    return Container(
      width: 48,
      height: 48,
      child: Icon(
        Icons.check_box,
        color: color,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Color.fromRGBO(color.red, color.green, color.blue, 0.32)),
    );
  }

  Widget get body {
    return Text(title, style: TextStyle(fontSize: 32),);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        avatar,
        SizedBox(width: 24),
        body
      ],
    );
  }
}
