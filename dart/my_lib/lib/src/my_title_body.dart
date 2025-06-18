import 'package:flutter/material.dart';
import 'package:my_lib/my_lib.dart';
import 'package:my_lib/src/my_anchor.dart';
import 'package:my_lib/src/my_state_view.dart';

import 'consts/my_edge_insets.dart';


class MyTitleBody extends StatelessWidget {
  const MyTitleBody(
      {super.key,
      this.descendants,
      required this.title,
      this.state,
      this.desc,
      this.body});

  final String title;
  final String? desc;
  final List<Widget>? descendants;
  final Widget? state;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: edgeInsets16,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MyAnchor(title: title),
          Padding(
            padding: EdgeInsets.only(left: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space16,
                if (desc != null) ...[Text(desc!), space16],
                if (state != null) ...[MyStateView(child: state!), space16],
                if (body != null) ...[body!, space16],
                if (descendants != null) ...mySpacer(descendants!),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
