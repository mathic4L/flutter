import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(

  ))
}

enum Type { onSelect, onDemand }

class ContextMenuItem {
  ContextMenuItem(this.onPress, this.nested, {required this.option, required this.hint});


  final IconData? hint;
  final String option;
  final List<ContextMenuItem> nested;
  final VoidCallback onPress;


// Description descr
// List nested

}

class ContextMenu extends StatefulWidget {
  const ContextMenu({super.key, required this.type, required this.itemsGroups});

  final Type type;
  final List<List<ContextMenuItem>> itemsGroups;

  // visuals : size

  @override
  _ContextMenuState createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {

  @override
  Widget build(BuildContext context) {

  }

}

// void main() {
//   runApp(
//     const MaterialApp(home: Scaffold(body: CntxtMenuController())),
//   );
// }

// class CntxtMenuController extends StatefulWidget {
//   const CntxtMenuController({super.key});
//
//   @override
//   State<CntxtMenuController> createState() => _CntxtMenuControllerState();
// }
//
// class _CntxtMenuControllerState extends State<CntxtMenuController> {
//   void _showDialog(BuildContext context) {
//     Navigator.of(context).push(
//       DialogRoute<void>(
//         context: context,
//         builder: (BuildContext context) => const AlertDialog(title: Text('You clicked print!')),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       // disable the browser's context menu
//       BrowserContextMenu.disableContextMenu();
//     }
//   }
//
//   @override
//   void dispose() {
//     if (kIsWeb) {
//       BrowserContextMenu.enableContextMenu();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _ContextMenuRegion(
//       contextMenuBuilder: (BuildContext context, Offset offset) {
//         // The custom context menu will look like the default context menu
//         // on the current platform with a single 'Print' button.
//         return AdaptiveTextSelectionToolbar.buttonItems(
//           anchors: TextSelectionToolbarAnchors(
//             primaryAnchor: offset,
//           ),
//           buttonItems: <ContextMenuButtonItem>[
//             ContextMenuButtonItem(
//               onPressed: () {
//                 ContextMenuController.removeAny();
//                 _showDialog(context);
//               },
//               label: 'Print',
//             ),
//           ],
//         );
//       },
//       // In this case this wraps a big open space in a GestureDetector in
//       // order to show the context menu, but it could also wrap a single
//       // widget like an Image to give it a context menu.
//       child: ListView(
//         children: <Widget>[
//           Container(height: 20.0),
//           const Text('Right click (desktop) or long press (mobile) anywhere, not just on this text, to show the custom menu.'),
//         ],
//       ),
//     );
//   }
// }
//
// // Shows and hides CM by default on right clicks and long presses
// class _ContextMenuRegion extends StatefulWidget {
//   const _ContextMenuRegion({
//     required this.child,
//     required this.contextMenuBuilder,
//   });
//
//   final Widget Function(BuildContext context, Offset offset) contextMenuBuilder;
//   final Widget child; // listened to for gestures
//
//   @override
//   State<_ContextMenuRegion> createState() => _ContextMenuRegionState();
// }
//
// class _ContextMenuRegionState extends State<_ContextMenuRegion> {
//   Offset? _longPressOffset;
//
//   final ContextMenuController _contextMenuController = ContextMenuController();
//
//   static bool get _longPressEnabled {
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//       case TargetPlatform.iOS:
//         return true;
//       case TargetPlatform.macOS:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//         return false;
//     }
//   }
//
//   void _onSecondaryTapUp(TapUpDetails details) {
//     _show(details.globalPosition);
//   }
//
//   void _onTap() {
//     if (!_contextMenuController.isShown) {
//       return;
//     }
//     _hide();
//   }
//
//   void _onLongPressStart(LongPressStartDetails details) {
//     _longPressOffset = details.globalPosition;
//   }
//
//   void _onLongPress() {
//     assert(_longPressOffset != null);
//     _show(_longPressOffset!);
//     _longPressOffset = null;
//   }
//
//   void _show(Offset position) {
//     _contextMenuController.show(
//       context: context,
//       contextMenuBuilder: (BuildContext context) {
//         return widget.contextMenuBuilder(context, position);
//       },
//     );
//   }
//
//   void _hide() {
//     _contextMenuController.remove();
//   }
//
//   @override
//   void dispose() {
//     _hide();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onSecondaryTapUp: _onSecondaryTapUp,
//       onTap: _onTap,
//       onLongPress: _longPressEnabled ? _onLongPress : null,
//       onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
//       child: widget.child,
//     );
//   }
// }
