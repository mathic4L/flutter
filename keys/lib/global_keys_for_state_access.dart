import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GlobalKeysForStateAccess(),
    ),
  ));
}

class GlobalKeysForStateAccess extends StatefulWidget {
  const GlobalKeysForStateAccess({super.key});

  final smartphones = const [
    'realme 12 pro+',
    'realme 13 pro+',
    'realme 14 pro+',
    'realme 15 pro+',
  ];

  @override
  State<GlobalKeysForStateAccess> createState() =>
      _GlobalKeysForStateAccessState();
}

class _GlobalKeysForStateAccessState extends State<GlobalKeysForStateAccess> {
  late final List<GlobalObjectKey<_SmartphoneState>> _globalKeys;

  @override
  void initState() {
    super.initState();
    /*
    keys' values are usually taken from widget configuration data
      here, Smartphone's configuration is String modelName
     */
    _globalKeys = widget.smartphones
        .map((e) => GlobalObjectKey<_SmartphoneState>(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FilledButton(
                onPressed: () {
                  _globalKeys.forEach((e) => e.currentState?.unpick());
                },
                child: Text('unpick all')),
            FilledButton(
                onPressed: () {
                  _globalKeys.forEach((e) => e.currentState?.pick());
                },
                child: Text('pick all')),
          ],
        ),
        for (int i = 0; i < widget.smartphones.length; i++)
          Smartphone(
            key: _globalKeys[i],
            modelName: widget.smartphones[i],
          )
      ],
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
  var _picked = false;

  void pick() => setState(() {
        _picked = true;
      });

  void unpick() => setState(() {
        _picked = false;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_picked) {
          unpick();
        } else {
          pick();
        }
      },
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text(widget.modelName),
              SizedBox.square(
                dimension: 16,
              ),
              if (_picked) Icon(Icons.check)
            ],
          ),
        ),
      ),
    );
  }
}
