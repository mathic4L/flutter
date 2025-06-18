import 'dart:async';
import 'dart:io';

void main() async {
  var loggerA = Logger('./results/logger_a.txt', 'logger_a');
  var loggerB = Logger('./results/logger_b.txt', 'logger_b');

  var stream = createBroadcastStream();
  var subscriptionA = stream.listen((data) {
    loggerA.write(data);
  }, onDone: () {
    loggerA.write('done');
  });

  await Future.delayed(Duration(seconds: 1));

  var subscriptionB = stream.listen((data) {
    loggerB.write(data);
  }, onDone: () {
    loggerB.write('done');
  });

  await Future.delayed(Duration(seconds: 2));

  subscriptionA.cancel();

  await Future<void>.delayed(Duration(seconds: 1));

  subscriptionA = stream.listen((data) {
    loggerA.write(data);
  }, onDone: () {
    loggerA.write('done');
  });

  await loggerA.close();
  await loggerB.close();
}

Stream<String> createBroadcastStream() {
  late StreamController<String> controller;

  controller = StreamController.broadcast(
      /*
      fires every time there's a listener
       */
      onListen: () async {
    for (int i = 1; i <= 10; i++) {
      controller.add('event_$i');
      await Future.delayed(Duration(milliseconds: 500));
    }
    controller.close();
  },
      /*
      fires when there's no more listeners
       */
      onCancel: () {
    print('no more listeners');
  });

  return controller.stream;
}

class Logger {
  Logger(String path, this.name) : _outputController = File(path).openWrite();

  final IOSink _outputController;
  final String name;

  void write(String string) {
    _outputController.write('$string\n');
  }

  Future<void> close() async {
    await _outputController.flush();
    await _outputController.close();
  }
}
