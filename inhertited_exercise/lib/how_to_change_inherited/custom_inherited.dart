import 'package:flutter/material.dart';
import 'package:inhertited_exercise/how_to_change_inherited/my_color_data.dart';

class ChangeableTheme extends StatefulWidget {
  const ChangeableTheme({super.key, required this.data, required this.child});

  final MyThemeData data;
  final Widget child;

  @override
  State<ChangeableTheme> createState() => ChangeableThemeState();

  static ChangeableThemeState of(BuildContext context) {
    final output = ChangeableTheme.maybeOf(context);
    assert(output != null, 'no ChangeableTheme in scope');
    return output!;
  }

  static ChangeableThemeState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<ChangeableThemeState>();
  }
}

class ChangeableThemeState extends State<ChangeableTheme> {
  late MyThemeData _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  void changeTheme(bool isDark) {
    setState(() {
      _data = _data.copyWith(isDark: isDark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeableThemeInherited(data: _data, child: widget.child);
  }
}

class ChangeableThemeInherited extends InheritedWidget {
  const ChangeableThemeInherited({
    super.key,
    required this.data,
    required super.child,
  });

  final MyThemeData data;

  @override
  bool updateShouldNotify(ChangeableThemeInherited oldWidget) {
    return data != oldWidget.data;
  }

  static MyThemeData of(BuildContext context) {
    final output = maybeOf(context);
    assert(output != null, 'no ChangeableThemeInherited in scope');
    return output!;
  }

  static MyThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChangeableThemeInherited>()
        ?.data;
  }
}
