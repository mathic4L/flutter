import 'dart:io';

import 'package:stream/await_for.dart';
import 'package:stream/common.dart';

void main() {
  // listen();
  pauseAndResume();
}

void listen() {
  var intList = <int>[];
  var streamSubscription =
  countStream(10).listen(intList.add, onDone: () => print(intList));
}

void pauseAndResume() {
  var stream = Stream<int>.periodic(Duration(seconds: 2), (i) => i);

  var subscription = stream.listen((data) => print('current value: $data'));
  Future(() {
    var keep = true;
    while (keep) {
      stdout.write('waiting for command...');
      var command = stdin.readLineSync();
      switch (command) {
        case 'exit':
          keep = false;
        case 'pause':
        case 'resume':
      }
    }
  });
}
