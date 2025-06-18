import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {

  final outlined = const TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Outlined!"),
  );
  final filled = const TextField(
    decoration: InputDecoration(
        filled: true,
        labelText: "Filled!",
        hintText: "boo! it's input's hint!"),
  );
  final noBox = TextField(
    decoration: InputDecoration(
      labelText: "no box inputfield!",
    ),
  );
  final withInitialText = TextField(
    decoration: InputDecoration(
      labelText: "with initial text!",
    ),
    controller: TextEditingController(
      text: "it is initial value!",
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          outlined,
          Divider(),
          filled,
          Divider(),
          noBox,
          Divider(),
          withInitialText,
        ],
      ),
    );
  }
}
