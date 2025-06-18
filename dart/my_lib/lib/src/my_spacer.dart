import 'package:flutter/cupertino.dart';
import 'package:my_lib/my_lib.dart';

List<Widget> mySpacer<T extends Widget?>(List<T> list) {
  var newList = <Widget>[];
  for (var i = 0; i < list.length; i++) {
    if (list[i] != null) {
      newList.add(list[i]!);
    }
    if (i != list.length - 1) {
      newList.add(space16);
    }
  }
  return newList;
}
