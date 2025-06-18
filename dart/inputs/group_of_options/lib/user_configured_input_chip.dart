import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyUserConfigurationInputChips extends StatefulWidget {
  const MyUserConfigurationInputChips({super.key});

  @override
  State<MyUserConfigurationInputChips> createState() =>
      _MyUserConfigurationInputChipsState();
}

class _MyUserConfigurationInputChipsState
    extends State<MyUserConfigurationInputChips> {
  final items = [
    (name: 'alex', sex: 'male'),
    (name: 'jessica', sex: 'female'),
    (name: 'sidney', sex: 'female'),
  ];
  late var selection = items.map((e) => false).toList();

  List<String> get selectedItems {
    var out = <String>[];
    for (var i = 0; i < items.length; i++) {
      if (selection[i]) {
        out.add(items[i].name);
      }
    }
    return out;
  }

  void Function(bool) getOnSelected(int index) {
    return (bool selected) {
      setState(() {
        selection[index] = !selection[index];
      });
    };
  }

  List<Widget> get children {
    var output = <InputChip>[];
    for (var i = 0; i < items.length; i++) {
      output.add(InputChip(
        avatar: CircleAvatar(),
        label: Row(
          children: [
            Text(items[i].name),
            SizedBox(
              width: 16,
              height: 16,
            ),
            Text(
              items[i].sex,
              style: TextStyle(color: Colors.blueGrey),
            )
          ],
        ),
        onSelected: getOnSelected(i),
        selected: selection[i],
      ));
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
        title: 'user-configured input chips',
        desc: 'достаем данные из пула, которым управляет пользователь\n'
            'управление данными в другом месте',
        state: Text('state = $selectedItems'),
        body: Wrap(
          children: children,
          spacing: 16,
        ));
  }
}
