import "package:flutter/material.dart";

/*
 button with paprameters

 parameter type: on/off, single-select, text
 parameters count: (0, 1, n)
 parameters size ( depends on parameter's a) length, height and density, b) count)
 parameters variation frequency (how often changes): never, rarely, often, usually
 parameters variation type: chaotically, between some options

 0 values -> button
 1 value -> parameters[0].size == big
    ? split

    parameters[0].type == single-select && parameters[0].size == big
        ? return splitButton (options[])
    parameters[0].type == on/off && parameters[0].size == big
        ? return splitButton (action, action with option)

    parameters[0].type == single-select && parameters[0].size == small
        ? return splitButtonWithNestedControl (options[])
    parameters[0].type == on/off && parameters[0].size == small
        ? return splitButtonWithNestedControl (action, action with option)


 */


class Button extends StatefulWidget {
  const Button(this.usuallyPickedAction, {super.key, required this.lotsOfSpace, required this.actions});

  final List<String> actions;
  final String? usuallyPickedAction;
  final bool lotsOfSpace;

  get actionType {

    actions.length == 1
        ? "single action"
        : actions.length <= 3 && lotsOfSpace
            ? "exposed in a row"
            : usuallyPickedAction == null
                ? "dropdown button"
                : "button with toggle";
  }

  get actionType2 {

    actions.length == 1
        ? "single action"
        : actions.length <= 3 && lotsOfSpace
        ? "exposed in a row"
        : usuallyPickedAction == null
        ? "dropdown button"
        : "button with toggle";
  }

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {}
}
