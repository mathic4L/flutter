import 'package:flutter/material.dart';

void myShowDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("pressssed!"),
          actions: [
            FilledButton(onPressed: () {
              Navigator.of(context).pop();
            },
                child: Text("close that bih!")
            )
          ],
        );
      });
}