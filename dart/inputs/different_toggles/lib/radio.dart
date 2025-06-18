import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

void main() => runApp(MyCore(body: MyRadio()));

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  var values = [
    macAir,
    msiModern,
    gigabyteG7,
    lenovoYoga,
  ];
  int? selectedIndex;

  MyLaptop? get selected =>
      selectedIndex != null ? values[selectedIndex!] : null;

  void Function(MyLaptop? laptop) get onChanged => (MyLaptop? value) {
        setState(() {
          if (value != null) {
            selectedIndex = values.indexOf(value);
          }
        });
      };

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'radios',
      state: Text('state = ${selectedIndex != null ? selected : null}'),
      body: SizedBox(
        width: 360,
        child: Column(
          children: values
              .map((e) => ListTile(
                    leading: Radio(
                        value: e, groupValue: selected, onChanged: onChanged),
                    title: Text('${e.name}'),
                    trailing: Text(
                      '${e.price}',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
