import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class Texts extends StatefulWidget {
  const Texts({super.key});

  @override
  State<Texts> createState() => _TextsState();
}

class _TextsState extends State<Texts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Text("plain text"),
        SelectableText("selectable"),
        RichText(
            text: const TextSpan(children: [
          TextSpan(text: "default; "),
          TextSpan(
              text: "term ", style: TextStyle(fontStyle: FontStyle.italic)),
          TextSpan(
              text: "important; ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: "colored; ", style: TextStyle(color: Colors.indigo)),
          TextSpan(
              text: "underlined; ",
              style: TextStyle(decoration: TextDecoration.underline)),
          TextSpan(
              text: "strikethrough; ",
              style: TextStyle(decoration: TextDecoration.lineThrough)),
          //  link
        ]))
      ]),
    );
  }
}
