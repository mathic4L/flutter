import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: UniqueKeys(),
    ),
  ));
}

class UniqueKeys extends StatefulWidget {
  UniqueKeys({super.key});

  final smartphones = List.generate(16, (i) => 'poco m${i + 1}');

  @override
  State<UniqueKeys> createState() => _UniqueKeysState();
}

class _UniqueKeysState extends State<UniqueKeys> {
  late Iterator<String> _smartphonesIterator;
  late List<String> _smartphones;

  void refreshSmartphones() {
    _smartphonesIterator.moveNext();
    _smartphones = [_smartphonesIterator.current];
    _smartphonesIterator.moveNext();
    _smartphones.add(_smartphonesIterator.current);
  }

  @override
  void initState() {
    super.initState();
    _smartphonesIterator = widget.smartphones.iterator;
    refreshSmartphones();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._smartphones.map((x) => Smartphone(modelName: x, key: UniqueKey(),)),
          FilledButton(
              onPressed: () {
                setState(() {
                  refreshSmartphones();
                });
              },
              child: Text('next page'))
        ],
      ),
    );
  }
}

class Smartphone extends StatefulWidget {
  const Smartphone({super.key, required this.modelName});

  final String modelName;

  @override
  State<Smartphone> createState() => _SmartphoneState();
}

class _SmartphoneState extends State<Smartphone> {
  var dark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.modelName),
          GestureDetector(
            onTap: () {
              setState(() {
                dark = !dark;
              });
            },
            child: Row(
              children: [
                Text('color: '),
                Container(
                  height: 16,
                  width: 16,
                  color: dark ? Colors.black : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
