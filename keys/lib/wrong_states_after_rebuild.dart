import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: WrongStatesAfterRebuild(),
    ),
  ));
}

class WrongStatesAfterRebuild extends StatefulWidget {
  const WrongStatesAfterRebuild({super.key});

  @override
  State<StatefulWidget> createState() => _WrongStatesAfterRebuildState();
}

class _WrongStatesAfterRebuildState extends State<WrongStatesAfterRebuild> {
  var _apps = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: const App(key: Key('a'), name: 'a'),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: const App(key: Key('b'), name: 'b'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._apps,
        FilledButton(
            onPressed: () {
              setState(() {
                _apps = _apps.reversed.toList();
              });
            },
            child: Text('reorder'))
      ],
    );
  }
}

class App extends StatefulWidget {
  const App({super.key, required this.name});

  final String name;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          darkTheme = !darkTheme;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('app \'${widget.name}\''),
            Row(
              children: [
                Text('theme: '),
                Container(
                  color: darkTheme ? Colors.black : Colors.grey,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
