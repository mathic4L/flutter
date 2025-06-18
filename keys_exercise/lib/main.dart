import 'package:flutter/material.dart';
import 'package:keys_exercise/model/color.dart';
import 'package:keys_exercise/model/person.dart';
import 'package:keys_exercise/view/person_card.dart';

void main() {
  runApp(MaterialApp(
    home: MyList(persons: [
      Person('valerii', MyColor.blue),
      Person('anton', MyColor.red),
      Person('dmitrii', MyColor.green),
      Person('olga', MyColor.blue),
      Person('olga', MyColor.blue),
    ]),
  ));
}

class MyList extends StatefulWidget {
  const MyList({super.key, required this.persons});

  final List<Person> persons;

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  late var _persons = widget.persons;

  void remove(Person value) {
    setState(() {
      _persons.remove(value);
    });
  }

  void add(Person value) {
    setState(() {
      _persons.add(value);
    });
  }

  void swap(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex >= newIndex) {
        _persons = _persons
            .take(newIndex)
            .followedBy([_persons[oldIndex]])
            .followedBy(_persons.skip(newIndex).take(oldIndex - newIndex))
            .followedBy(_persons.skip(oldIndex + 1))
            .toList();
      } else {
        _persons = _persons
            .take(oldIndex)
            .followedBy(
                _persons.skip(oldIndex + 1).take(newIndex - oldIndex - 1))
            .followedBy([_persons[oldIndex]])
            .followedBy(_persons.skip(newIndex))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        add(Person('new', MyColor.red));
      }),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          swap(oldIndex, newIndex);
        },
        children: _persons
            .map((e) => PersonCard(
                key: ObjectKey(e),
            person: e, remove: () => remove(e)))
            .toList(),
      ),
    );
  }
}
