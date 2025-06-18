import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

/*
choice chip is used for single-select inputs
 */
void main() => runApp(MyCore(body: MyChoiceChips()));

class MyChoiceChips extends StatefulWidget {
  const MyChoiceChips({super.key});

  @override
  State<MyChoiceChips> createState() => _MyChoiceChipsState();
}

class _MyChoiceChipsState extends State<MyChoiceChips> {
  var itemsNames = ['apple', 'samsung', 'tecno'];
  var selectedItemIndex = 0;

  onSelected(int index) {
    return (bool isSelected) {
      setState(() {
        selectedItemIndex = index;
      });
    };
  }

  List<ChoiceChip> get list {
    var choiceChips = <ChoiceChip>[];
    for (var i = 0; i < itemsNames.length; i++) {
      choiceChips.add(ChoiceChip(
        label: Text(itemsNames[i]),
        selected: i == selectedItemIndex,
        onSelected: onSelected(i),
      ));
    }
    return choiceChips;
  }

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
      title: 'choice chips',
      state: Text('currently selected - ${itemsNames[selectedItemIndex]}'),
      body: Wrap(
        children: mySpacer(list),
      ),
    );
  }
}
