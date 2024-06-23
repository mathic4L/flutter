import 'package:flutter/material.dart';
import "bottomCTA.dart";

// once keyinfo disappeared cuz of scrolling, it gotta be rendered at bottomCTA

Widget ky = Container(color: Colors.black87, width: 100, height: 48);

main() {
  runApp(MaterialApp(
    home: KeyInfoMigration(
      keyInfo: ky,
      body: Column(
        children: [
          ky,
          ...List.filled(10, Container(height: 300, width: 10, color: Colors.yellow,))
        ],
      ),
    ),
  ));
}

class KeyInfoMigration extends StatefulWidget {
  const KeyInfoMigration({super.key, required this.body, required this.keyInfo});

  final Widget body;
  final Widget keyInfo;

  @override
  _KeyInfoMigration createState() => _KeyInfoMigration();
}

class _KeyInfoMigration extends State<KeyInfoMigration> {

  ScrollController _scrollController = ScrollController();
  bool showBottomList = false;
  final GlobalKey _wrapKey = GlobalKey();
  final GlobalKey _bottomBarKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            double pixels = notification.metrics.pixels;
            double maxScrollExtent = _scrollController.position.maxScrollExtent;

            final RenderBox renderBox = _wrapKey.currentContext?.findRenderObject() as RenderBox;
            final double wrapHeight = renderBox.size.height;

            setState(() {
              showBottomList = pixels >= wrapHeight;
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                  key: _wrapKey,
                  child: widget.body
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: showBottomList
          ? BottomCta(onPressed: () {}, cta: Text("sth"), ctaDescr: Container(key: _wrapKey, child: widget.keyInfo))
          : BottomCta(onPressed: () {}, cta: Text("sth"), separated: false),
    );
  }
}


