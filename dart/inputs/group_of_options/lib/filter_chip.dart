import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';

/*
filter chip is used for multi-select inputs
 */
void main() => runApp(MyCore(body: MyFilterChips()));

class MyFilterChips extends StatefulWidget {
  const MyFilterChips({super.key});

  @override
  State<MyFilterChips> createState() => _MyFilterChipsState();
}

class _MyFilterChipsState extends State<MyFilterChips> {
  var itemsNames = ['apple', 'samsung', 'tecno'];
  var selection = [true, false, true];

  onSelected(int index) {
    return (bool isSelected) {
      setState(() {
        selection[index] = !selection[index];
      });
    };
  }

  List<FilterChip> get list {
    var filterChips = <FilterChip>[];
    for (var i = 0; i < itemsNames.length; i++) {
      filterChips.add(FilterChip(
        label: Text(itemsNames[i]),
        selected: selection[i],
        onSelected: onSelected(i),
      ));
    }
    return filterChips;
  }

  @override
  Widget build(BuildContext context) {
    return MyTitleBody(
        title: 'filter chips',
        state: Text('currently selected: ${[
          for (var i = 0; i < itemsNames.length; i++)
            if (selection[i]) itemsNames[i]
        ]}'),
        body: Wrap(
          children: mySpacer(list),
        ));
  }
}
