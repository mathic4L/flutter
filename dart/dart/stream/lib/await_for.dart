/*
'await for' is a .listen&subscription counterpart with synchrony

to use 'await for' loop function must be marked as 'async'
within 'await for' values have type E from Stream<E>

'await for' isn't returned to if the corresponding stream never fires an event
 */

import 'package:stream/common.dart';

Future<void> awaitFor() async {
  final chars = countStream(10);
  final intList = <int>[];

  await for (final char in chars) {
    intList.add(char);
  }

  print(intList);
}


