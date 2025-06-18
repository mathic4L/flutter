import 'dart:collection';
import 'dart:io';

class IoManager {
  String readRequest() {
    try {
      final input = stdin.readLineSync();
      if (input == null) {
        throw Exception('no input provided');
      } else {
        return input;
      }
    } on IOException catch (ex) {
      throw Exception('input exception');
    }
  }

  void myPrint(dynamic output) {
    print(output);
  }
}
