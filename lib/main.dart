import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ContinuousRectangleBorder shape = ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16), bottomRight: Radius.circular(30)));

FlexibleSpaceBar flexibleSpaceBar = FlexibleSpaceBar(
    background: Image.asset(
  "./../web/favicon.png",
));

List<IconButton> actions = List.generate(
    3,
    (index) =>
        IconButton.filled(onPressed: () {}, icon: Icon(Icons.arrow_back)));

SliverAppBar sap = SliverAppBar(
    leading: IconButton.filled(onPressed: () {}, icon: Icon(Icons.arrow_back)),
    actions: actions,
    expandedHeight: 200.0,
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
// elevation: 1000,
// surfaceTintColor: Colors.white,
// shadowColor: Colors.black,
// toolbarHeight: 48,
    shape: shape,
    bottom: TabBar(tabs: List.generate(3, (index) => Tab(text: "$index"))),
    flexibleSpace: flexibleSpaceBar);

class MySPHD extends SliverPersistentHeaderDelegate {
  const MySPHD(
      {required this.title,
      required this.actions,
      required this.minHeight,
      required this.maxHeight});

  final double minHeight;
  final double maxHeight;
  final String title;
  final List<IconButton> actions;

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(MySPHD oldDelegate) {
    return super != oldDelegate;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            if (shrinkOffset >= maxExtent - minExtent) Text(title),
            Row(
              children: actions,
            ),
          ],
        ),
      ),
    ));
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 1000,
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.yellow),
                  Container(color: Colors.green),
                  Container(color: Colors.red),
                  Container(color: Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
