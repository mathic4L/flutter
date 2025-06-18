import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
гипотеза не оправдалась
 */

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: OwnerAndPetBarberShop()),
  ));
}

class OwnerAndPetBarberShop extends StatefulWidget {
  const OwnerAndPetBarberShop({super.key});

  @override
  State<OwnerAndPetBarberShop> createState() => _OwnerAndPetBarberShopState();
}

class _OwnerAndPetBarberShopState extends State<OwnerAndPetBarberShop> {
  var _reversed = false;

  void reverse() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: _reversed
              ? [
                  Person(
                    key: ValueKey('pet'),
                  ),
                  Animal(
                    key: ValueKey('owner'),
                  )
                ]
              : [
                  Person(
                    key: ValueKey('owner'),
                  ),
                  Animal(
                    key: ValueKey('pet'),
                  )
                ],
        ),
        FilledButton(onPressed: reverse, child: Text('change haircut'))
      ],
    );
  }
}

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State createState() => _HairState();
}

class Animal extends StatefulWidget {
  const Animal({super.key});

  @override
  State createState() => _HairState();
}

class _HairState extends State {
  var _color = Colors.black;

  void changeColorToRandom() {
    setState(() {
      final Random random = Random();
      _color = Color.fromARGB(
        255, // Fully opaque
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(switch (widget.runtimeType) {
          Person => 'person',
          Animal => 'animal',
          _ => 'else'
        }),
        SizedBox.square(
          dimension: 8,
        ),
        Text('color'),
        SizedBox.square(
          dimension: 8,
        ),
        Container(
          width: 16,
          height: 16,
          color: _color,
        ),
        IconButton(
            onPressed: changeColorToRandom,
            icon: Icon(Icons.change_circle_outlined))
      ],
    );
  }
}
