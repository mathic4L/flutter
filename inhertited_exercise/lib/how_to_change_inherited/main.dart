import 'package:flutter/material.dart';
import 'package:inhertited_exercise/how_to_change_inherited/my_color_data.dart';

import 'custom_inherited.dart';

void main() {
  runApp(ChangeableTheme(data: MyThemeData(false), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    print('dependencies changed');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*
    gives us api to change _ChangeableThemeInherited
    */
    final changeableThemeState = ChangeableTheme.of(context);

    /*
    propagates data and creates a dependency
    */
    final data = ChangeableThemeInherited.of(context);

    void changeTheme(bool isDark) => changeableThemeState.changeTheme(isDark);

    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: data.isDark ? Colors.white : Colors.black,
                  backgroundColor: data.isDark ? Colors.black: Colors.white),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('dark theme'),
                SizedBox.square(
                  dimension: 16,
                ),
                Switch(value: data.isDark, onChanged: changeTheme)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
