import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  var stream = filesStream();
  var fileStreamSubscription = stream.listen((data) => print(data));

  var stdinSubscription = stdin.transform(utf8.decoder).listen((data) {
    switch (data) {
      case 'pause':
        fileStreamSubscription.pause();
      case 'resume':
        fileStreamSubscription.resume();
      case 'cancel':
        fileStreamSubscription.cancel();
      default:
        throw Exception('invalid input');
    }
  });
}

Stream<String> filesStream() {
  late StreamController<String> streamController;
  late StreamSubscription<String> subscription;

  void onListen() {
    var iterator = [
      File('./resources/hello.txt').openRead().transform(utf8.decoder),
      File('./resources/world.txt').openRead().transform(utf8.decoder)
    ].iterator;

    void onData(data) async {
      subscription.pause();
      streamController.add(data);
      await Future.delayed(Duration(seconds: 3));
      subscription.resume();
    }

    iterator.moveNext();
    subscription = iterator.current.listen(onData, onDone: () {
      if (iterator.moveNext()) {
        subscription = iterator.current.listen(onData);
      } else {}
    });
  }

  void onPause() {
    subscription.pause();
  }

  void onResume() {
    subscription.resume();
  }

  /*
  releasing resources
   */
  void onCancel() {
    subscription.cancel();
  }

  streamController = StreamController<String>(
      onListen: onListen,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel);

  return streamController.stream;
}
