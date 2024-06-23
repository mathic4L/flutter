// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: MyHomePage(),
//   )
//   );
// }
//
// class MyHomePage extends StatefulWidget {
//
//   @override
//   State<StatefulWidget> createState() => _MyHomePage();
// }
//
// class _MyHomePage extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Stack(
//           children: [],
//         )
//         GestureDetector(
//           child: Container(width: 200, height: 200, color: Colors.grey,),
//         ),
//         ...List.generate(3, (index) => Container(width: 100, height: 100, color: Colors.grey,)),
//       ],
//     );
//   }
//
// }
//
//
//

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOverlayOpened = false;

  Widget buildChild() {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Tap me to toggle overlay',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = buildChild();

    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Example'),
      ),
      body: Stack(
        children: [
          // Parent widget
          GestureDetector(
            child: child,
            onTap: () {
              setState(() {
                isOverlayOpened = !isOverlayOpened;
              });
            },
          ),

          // Overlay
          if (isOverlayOpened)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isOverlayOpened = !isOverlayOpened;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: child, // Use the same child widget
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

