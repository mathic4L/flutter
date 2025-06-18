import 'dart:async';
import 'dart:io';

void main() async {
  // pauseResumeFstExercise();
  pauseResumeScdExercise();
}

/*
output:
-> paused
-> '1' handled
 */
void pauseResumeScdExercise() {
  var streamController = StreamController<int>(
      onPause: () => print('paused'), onResume: () => print('resumed'));
  var subscription =
      streamController.stream.listen((data) => print('\'$data\' handled'));
  streamController.add(1);
  subscription.pause();
  subscription.resume();
  streamController.add(2);
}

void pauseResumeFstExercise() async {
  var chunkBuf = <String>[];
  var streamController = StreamController(
      onPause: () => stdout.write('paused\n'),
      onResume: () => stdout.write('resumed\n'),
      onListen: () => stdout.write('begun to be listened\n'));

  var streamSubscription = streamController.stream.listen(null);
  streamSubscription.onData((data) {
    stdout.write('received $data\n');
    chunkBuf.add(data);
    stdout.write('$chunkBuf\n');
    if (chunkBuf.length == 3) {
      streamSubscription.pause(Future.delayed(Duration(seconds: 1)).then((_) {
        chunkBuf = <String>[];
      }));
    }
  });

  streamController.addStream(chunkStream());
}

Stream<String> chunkStream() async* {
  for (int i = 1; i <= 24; i++) {
    yield 'chunk $i';
    await Future<void>.delayed(Duration(milliseconds: 300));
  }
}
