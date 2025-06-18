import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: GlobalKeysForReparenting(),
    ),
  ));
}

class GlobalKeysForReparenting extends StatefulWidget {
  const GlobalKeysForReparenting({super.key});

  @override
  State<GlobalKeysForReparenting> createState() =>
      _GlobalKeysForReparentingState();
}

class _GlobalKeysForReparentingState extends State<GlobalKeysForReparenting> {
  var _cardView = false;
  final _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilledButton(
            onPressed: () {
              setState(() {
                _cardView = !_cardView;
              });
            },
            child: Text(_cardView ? 'table view' : 'card view')),
        SizedBox.square(
          dimension: 16,
        ),
        _cardView
            ? Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 64,
                        width: 64,
                        color: _color,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Favourite(
                      key: GlobalObjectKey('favourite'),
                    ),
                  ),
                ],
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        color: _color,
                        width: 16,
                        height: 16,
                      ),
                      SizedBox.square(
                        dimension: 8,
                      ),
                      Favourite(
                        key: GlobalObjectKey('favourite'),
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  var _marked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _marked = !_marked;
        });
      },
      child: Icon(_marked ? Icons.star : Icons.star_border),
    );
  }
}
