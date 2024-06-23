import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  bool isSelected = false;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isSelected ? bottomAppBar : navigationBar,
      body: Center(
        child: FilledButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Text("sdfs"),
        ),
      ),
    );
  }

  get bottomAppBar => BottomAppBar();

  get navigationBar => NavigationBar(
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int i) {
        setState(() {
          currentPageIndex = i;
        });
      },
      destinations: List.generate(
          4,
          (index) => NavigationDestination(
              icon: Icon(Icons.abc, color: Colors.black), label: "sdf")));
}
