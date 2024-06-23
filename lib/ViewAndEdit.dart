// import 'package:flutter/material.dart';
//
// // Container(width: 200, height: 200, color: Colors.black87,)
// main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             EditAndView(
//                 view: Container(height: 40, width: 40, color: Colors.black87),
//                 edit: Container(height: 100, width: 40, color: Colors.blueAccent)),
//             // ...List.filled(
//             //     5,
//             //     Container(
//             //       height: 100,
//             //       width: 100,
//             //       child: Container(
//             //         height: 64,
//             //         width: 100,
//             //         color: Colors.grey,
//             //       ),
//             //     ))
//           ],
//         ),
//       ),
//     ),
//   ));
// }
//
// class EditAndView extends StatefulWidget {
//   const EditAndView({super.key, required this.view, required this.edit, this.isOpenedInitially = false});
//
//   final Widget view;
//   final Widget edit;
//   final bool isOpenedInitially;
//
//   @override
//   _EditAndView createState() => _EditAndView();
// }
//
// class _EditAndView extends State<EditAndView> {
//   late bool isOpened;
//   late OverlayEntry modeless;
//
//   @override
//   void initState() {
//     super.initState();
//     isOpened = widget.isOpenedInitially;
//
//     super.initState();
//     modeless = OverlayEntry(
//         opaque: false,
//         builder: (context) {
//           return Positioned(
//             top: 50.0,
//             left: 50.0,
//             child: new SizedBox(
//               height: 50.0,
//               child: Card(
//                   child: Text("I'm a modeless")
//               ),
//             ),
//           );
//         });
//
//     Future.microtask(() {
//       Overlay.of(context).insert(modeless);
//     });
//   }
//
//   @override
//   void dispose() {
//     modeless.remove();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           child: widget.view,
//           onTap: () {
//             setState(() {
//               isOpened = !isOpened;
//             });
//           },
//         ),
//         if (isOpened) Positioned(top: 10, left: 10, child: widget.edit)
//       ],
//     );
//   }
// }


import "package:flutter/material.dart";

main() {
  runApp(MaterialApp(

  ));
}

class Test extends InheritedWidget {
  const Test(this.number, {super.key, required super.child});

  final int number;

  @override
  bool updateShouldNotify(Test oldWidget) => number != oldWidget.number;



}
