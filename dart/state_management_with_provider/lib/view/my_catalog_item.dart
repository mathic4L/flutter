import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/model/item.dart';
import 'package:state_management_with_provider/model/my_cart_model.dart';

class MyCatalogCartItem extends StatelessWidget {
  const MyCatalogCartItem({super.key, required this.content});

  final Item content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.gif_box),
      title: Text("${content.name} - ${content.price}\$"),
      trailing: Val,
    )
  }
}

/*
Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 50,
            ),
            Text("${content.name} - ${content.price}\$")
          ],
        ),
        FilledButton(
            onPressed: () =>
                Provider.of<MyCartModel>(context, listen: false).add(content),
            child: Text)
      ],
    );
 */
