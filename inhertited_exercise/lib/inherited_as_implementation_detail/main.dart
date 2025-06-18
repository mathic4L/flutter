import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inhertited_exercise/inherited_as_implementation_detail/inherited_as_implementation_details.dart';
import 'package:inhertited_exercise/inherited_as_implementation_detail/my_color_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyTheme(
            data: MyThemeData(true),
            child: Builder(builder: (context) {
              final isDark = MyTheme.of(context).isDark;
              return Container(
                // width: 128,
                // height: 32,
                color: isDark ? Colors.black : Colors.white,
                child: Text(
                  '${isDark ? 'dark' : 'light'} theme',
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
              );
            })),
      ),
    );
  }
}
