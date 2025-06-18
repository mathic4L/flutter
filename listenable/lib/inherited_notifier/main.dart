import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listenable/inherited_notifier/account_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountInheritedNotifier(
        notifier: AccountModel(AccountData(
            'valerii', 'sergeyev', 'mathic', Icons.emoji_emotions_outlined)),
        child: MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              var notifier = context
                  .dependOnInheritedWidgetOfExactType<AccountInheritedNotifier>()!
                  .notifier!;
              return Column(
                children: [
                  Icon(notifier.value.avatar),
                  FilledButton(
                      onPressed: () {
                        final icons = [
                          Icons.emoji_emotions_outlined,
                          Icons.thumb_up_outlined,
                          Icons.star_outline
                        ];
                        final randomIndex = Random().nextInt(icons.length);
                        notifier.changeAvatar(icons[randomIndex]);
                      },
                      child: Text('change'))
                ],
              );
            }),
          ),
        ));
  }
}
