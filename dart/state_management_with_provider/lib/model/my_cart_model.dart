import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:state_management_with_provider/model/item.dart';

class MyCartModel extends ChangeNotifier {
  var _items = <Item>[];

  List<Item> get items => _items;

  double get totalPrice =>
      _items.map((e) => e.price).reduce((value, element) => value += element);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
