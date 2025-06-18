import 'package:flutter/material.dart';
import 'package:listenable/basics/theme_model.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key, required this.themeNotifier});

  final ThemeModel themeNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, value, child) =>
          Text('theme: ${value ? 'dark' : 'light'}'),
    );
  }
}

class ThemeWidgetWOBuilder extends StatelessWidget {
  const ThemeWidgetWOBuilder({super.key, required this.themeNotifier});

  final ThemeModel themeNotifier;

  @override
  Widget build(BuildContext context) {
    return Text('theme: ${themeNotifier.value ? 'dark' : 'light'}');
  }
}

class ThemeWidgetManualSubscribing extends StatefulWidget {
  const ThemeWidgetManualSubscribing({super.key, required this.themeNotifier});

  final ThemeModel themeNotifier;

  @override
  State<ThemeWidgetManualSubscribing> createState() =>
      _ThemeWidgetManualSubscribingState();
}

class _ThemeWidgetManualSubscribingState
    extends State<ThemeWidgetManualSubscribing> {
  late bool value = widget.themeNotifier.value;

  @override
  void initState() {
    super.initState();
    widget.themeNotifier.addListener(_onNotifierChange);
  }

  void _onNotifierChange() {
    setState(() {
      value = widget.themeNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('theme: ${value ? 'dark' : 'light'}');
  }
}
