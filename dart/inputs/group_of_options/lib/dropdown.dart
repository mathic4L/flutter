import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

void main() => runApp(MyCore(body: MyDropDown()));

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  final laptops = [macAir, msiModern, lenovoYoga, dexpAtlas];

  @override
  Widget build(BuildContext context) {
    Widget getEntryWidget(MyLaptop laptop) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [Text(laptop.name), space16, Text('${laptop.cpu}')],
            ),
          ),
          Text('${laptop.price}')
        ],
      );
    }

    return MyTitleBody(
      title: 'dropdown',
      body: SizedBox(
        width: 1024,
        child: DropdownMenu(
          // а если инишалСелешн нет в листе дропдаунМенюЕнтрис?
          // initialSelection:
          //     DropdownMenuEntry(value: macAir, label: macAir.name),
          controller: TextEditingController(text: 'pick a laptop'),
          label: Text('your laptop'),
          enableFilter: true,
          width: 360,
          dropdownMenuEntries: laptops
              .map((e) => DropdownMenuEntry(
                  leadingIcon: Icon(Icons.laptop),
                  value: e,
                  labelWidget: getEntryWidget(e),
                  label: ''))
              .toList(),
        ),
      ),
    );
  }
}
