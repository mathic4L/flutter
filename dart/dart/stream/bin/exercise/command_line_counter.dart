import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  late int currentData;
  var subscription = getController().stream.listen((data) => print(data));

  void onData(data) {
    switch (data) {
      case '0':
        if (!subscription.isPaused) subscription.pause();
        break;
      case '1':
        if (subscription.isPaused) subscription.resume();
        break;
      case '2':
        subscription.cancel();
        break;
      default:
        throw Exception('invalid input');
    }
  }

  void onDone() {
    print('done');
  }

  var inputSubscription = stdin
      .transform(utf8.decoder)
      .transform(StreamTransformer<String, String>.fromHandlers(
          handleData: (data, eventSink) => eventSink.add(data[0])))
      .listen(onData, onDone: onDone);
}

StreamController<int> getController() {
  var counter = 0;
  var isGenerating = true;

  late StreamController<int> streamController;

  void generation() async {
    while (isGenerating) {
      streamController.add(counter++);
      await Future.delayed(Duration(milliseconds: 500));
      if (counter == 32) break;
    }
  }

  void onListen() {
    print('listened');
    generation();
  }

  void onPause() {
    print('paused');
    isGenerating = false;
  }

  void onResume() {
    print('resumed');
    isGenerating = true;
    generation();
  }

  void onCancel() {
    print('canceled');
    isGenerating = false;
    streamController.close();
  }

  return streamController = StreamController(
      onListen: onListen,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel);
}
