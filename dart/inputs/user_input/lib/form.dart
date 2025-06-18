import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';
import 'package:provider/provider.dart';

/*
form as an ancestor provides descendants access to FormState
form widgets should be wrapped with FormFields
  there're convenient pre-wrapped versions of common form widgets:
    textField -> textFormField
    ...
 */
class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();

  /*
  executed by FormState.validate()
  should return
    incorrect input -> error string
    correct input -> null
   */
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'input is empty(';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(16),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            validator: validator,
          ),
          FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  myShowDialog(context);
                }
              },
              child: Text("send form!"))
        ],
      )),
    );
  }
}
