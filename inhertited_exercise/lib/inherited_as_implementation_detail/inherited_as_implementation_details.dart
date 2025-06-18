import 'package:flutter/material.dart';

import 'my_color_data.dart';

class MyTheme extends StatefulWidget {
  const MyTheme({super.key, required this.data, required this.child});

  final MyThemeData data;
  final Widget child;

  @override
  State<MyTheme> createState() => _MyThemeState();

  static MyThemeData of(BuildContext context) {
    final output = maybeOf(context);
    assert(output != null, 'no MyTheme in the scope');
    return output!;
  }

  static MyThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_MyThemeInherited>()
        ?.data;
  }
}

class _MyThemeState extends State<MyTheme> {
  void changeTheme(bool isDark) {
    setState(() {
      widget.data.isDark = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(value: widget.data.isDark, onChanged: (value)=>changeTheme(value)),
        _MyThemeInherited(data: widget.data, child: widget.child)
      ],
    );
  }
}

class _MyThemeInherited extends InheritedWidget {
  const _MyThemeInherited({
    required this.data,
    required super.child,
  });

  final MyThemeData data;

  @override
  bool updateShouldNotify(_MyThemeInherited oldWidget) {
    return oldWidget.data != data;
  }
}
