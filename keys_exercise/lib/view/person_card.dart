import 'package:flutter/material.dart';
import 'package:keys_exercise/model/color.dart';
import 'package:keys_exercise/model/person.dart';

class PersonCard extends StatefulWidget {
  const PersonCard({super.key, required this.person, required this.remove});

  final Person person;
  final VoidCallback remove;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  late Person person = widget.person;
  late var controller = TextEditingController(text: person.name);

  void changeName(String value) {
    setState(() {
      person.name = value;
    });
  }

  void changeColor(MyColor value) {
    setState(() {
      person.favouriteColor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameField = Container(
      width: 128,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          changeName(value);
        },
      ),
    );

    final colorDropDownMenu = DropdownMenu<MyColor>(
        initialSelection: person.favouriteColor,
        // controller: TextEditingController(),
        onSelected: (value) {
          changeColor(value!);
        },
        dropdownMenuEntries: MyColor.values
            .map((e) => DropdownMenuEntry(
                value: e,
                label: e.name,
                leadingIcon: Container(
                  width: 8,
                  height: 8,
                  color: e.materialColor,
                )))
            .toList());

    return ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [nameField, colorDropDownMenu],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${person.name} ${person.favouriteColor.name} '),
            IconButton(
                onPressed: widget.remove, icon: Icon(Icons.delete_outline)),
          ],
        ));
  }
}
