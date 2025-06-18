import 'dart:async';

/// Simulated source of data – emits one line at a time.
Stream<String> readFileLines() async* {
  final lines = [
    'User: Alice, Action: Login',
    'User: Bob, Action: UploadFile',
    'User: Carol, Action: Logout',
    'User: Dave, Action: DeleteAccount',
  ];
  for (var line in lines) {
    await Future.delayed(Duration(milliseconds: 300)); // simulate read delay
    yield line;
  }
}

/// Simulated heavy processing per line (e.g., database call).
Future<void> processLine(String line) async {
  print('Processing: $line');
  await Future.delayed(Duration(seconds: 1)); // Simulated heavy task
  print('Finished processing: $line');
}

Future<void> main() async {
  final controller = StreamController<String>();
  final subscription = controller.stream.listen(null); // start paused

  // Attach a custom listener that pauses/resumes on each line
  subscription.onData((line) async {
    subscription.pause(); // pause before heavy processing
    await processLine(line);
    subscription.resume(); // resume after done
  });

  subscription.onDone(() => print('All lines processed.'));

  // Add lines to the controller
  await for (final line in readFileLines()) {
    controller.add(line);
  }

  await controller.close();
}
