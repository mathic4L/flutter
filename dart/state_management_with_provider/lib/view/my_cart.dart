import 'package:flutter/material.dart';
import 'package:state_management_with_provider/model/item.dart';

class MyCart extends StatelessWidget {

  final List<Item> items;

  const MyCart({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Cart"),
        const Divider(),
        Column(
          children: items.map((e) => Text("${e.name} - ${e.price}\$")).toList(),
        )
      ],
    );
  }

}