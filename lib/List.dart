import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      theme: ThemeData(),
      home: ActionableList(
        search: () {},
        richContent: true,
        backButton: true,
        fab: FloatingActionButton(onPressed: () {}),
        children: List.filled(
            40,
            FilledButton.tonal(
              onPressed: () {},
              child: null,
            )),
      )));
}

class ActionableList extends StatelessWidget {
  const ActionableList({super.key,
    this.richContent = true,
    required this.children,
    required this.fab,
    this.backButton = false,
    this.search,
    this.actions});

  final bool richContent;
  final List<Widget> children;
  final FloatingActionButton fab;
  final bool backButton;
  final VoidCallback? search;
  final List<IconButton>? actions;
  // also could be text buttons

  Widget get bottomAppBar {
    return BottomAppBar(
      color: richContent ? Colors.white : Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: richContent ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if(backButton)
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: search,),
                  IconButton(icon: Icon(Icons.search), onPressed: () {},),
                  ...?actions, // ??? could/gotta be reversed-colored (black) just like some toasts, google docs tooltips, airbnb fab
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          fab
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomAppBar,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children),
        ));
  }
}
