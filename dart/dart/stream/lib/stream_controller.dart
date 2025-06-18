import 'dart:async';

import 'package:stream/common.dart';

void main() async {
  await filling();
}

Future<void> filling() async {
  var streamController = StreamController<int>(
      onListen: () => print('listening'),
      onPause: () => print('paused'),
      onResume: () => print('resumed'),
      onCancel: () => print('cancelled'));

  /*
  -> hasListener == true
  -> 'listening'
   */
  var streamSubscription = streamController.stream.listen((e) => print(e));
  streamController.hasListener;

  /*
  -> isPaused == true
  -> 'paused'
   */
  streamSubscription.pause();
  streamController.isPaused;

  await streamSubscription.cancel();

  // streamController.add(0);
  // await streamController.addStream(countStream(10));
  // streamController.add(11);
}
