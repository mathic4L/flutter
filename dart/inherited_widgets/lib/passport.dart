import 'package:flutter/widgets.dart';
import 'package:inherited_widgets/StateContainer.dart';
import 'package:inherited_widgets/data';

class Passport extends StatelessElement {
  Passport(super.widget);
  @override

  Widget build() {
    final data = StateContainer(child: this, name: name, surname: surname, age: age)
    return const Column(
      children: [

      ],
    )
  }
}