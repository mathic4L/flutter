import 'package:flutter/widgets.dart';

class StateContainer extends InheritedWidget {
  const StateContainer({
    super.key,
    required super.child,
    required this.name,
    required this.surname,
    required this.age,
  });

  final String name;
  final String surname;
  final int age;

  StateContainer of(BuildContext context) {
    final state = context.dependOnInheritedWidgetOfExactType<StateContainer>();
      return state!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}
