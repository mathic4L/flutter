import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

class MyUserProvidedInputChips extends StatefulWidget {
  const MyUserProvidedInputChips({super.key});

  @override
  State<MyUserProvidedInputChips> createState() =>
      _MyUserProvidedInputChipsState();
}

class _MyUserProvidedInputChipsState extends State<MyUserProvidedInputChips> {
  final items = <String>[];

  void Function() getOnDeleted(int i) {
    return () {
      setState(() {
        items.removeAt(i);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    Widget inputField() {
      return Container(
        width: 480,
        child: TextField(
          decoration: InputDecoration(hintText: 'enter keywords',),
          onSubmitted: (value) {
            setState(() {
              items.add(value);
              controller.clear();
            });
          },
          controller: controller,
        ),
      );
    }

    List<Widget> children() {
      var output = <InputChip>[];
      for (var i = 0; i < items.length; i++) {
        output.add(InputChip(
          label: Text(items[i]),
          // onSelected: getOnSelected(i),
          // selected: selection[i],
          onDeleted: getOnDeleted(i),
        ));
      }
      return output;
    }


    return MyTitleBody(
        title: 'user-provided input chips',
        state: Text('state = $items'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              children: children(),
            ),
            Divider(),
            inputField()
          ],
        ));
  }
}
