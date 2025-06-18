import 'package:flutter/material.dart';
import 'package:listenable/basics/color_model.dart';
import 'package:listenable/basics/theme_model.dart';
import 'package:listenable/basics/theme_widget.dart';

import 'color_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _colorNotifier = ColorModel(Colors.blue);
  final _themeNotifier = ThemeModel(false);

  void changeColor(MaterialColor value) {
    _colorNotifier.changeColor(value);
  }

  void changeTheme(bool isDark) {
    _themeNotifier.changeTheme(isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu(
                  onSelected: (value) => changeColor(value!),
                  dropdownMenuEntries: [Colors.blue, Colors.red, Colors.green]
                      .map((e) => DropdownMenuEntry(
                          value: e, label: e.toString().substring(0, 16)))
                      .toList(),
                ),
                ColorWidget(colorNotifier: _colorNotifier)
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('w listenableBuilder'),
                FilledButton(
                    onPressed: () => changeTheme(!_themeNotifier.value),
                    child: Text('reverse')),
                ThemeWidget(themeNotifier: _themeNotifier)
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('w manual subscribing to listener'),
                FilledButton(
                    onPressed: () => changeTheme(!_themeNotifier.value),
                    child: Text('reverse')),
                ThemeWidget(themeNotifier: _themeNotifier)
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('w/o listenableBuilder'),
                FilledButton(
                    onPressed: () => changeTheme(!_themeNotifier.value),
                    child: Text('reverse')),
                ThemeWidgetWOBuilder(themeNotifier: _themeNotifier)
              ],
            )
          ],
        ),
      ),
    );
  }
}
