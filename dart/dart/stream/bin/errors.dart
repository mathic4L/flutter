import 'dart:async';

import 'package:stream/common.dart';

void main() async {
  print('exceptionsWithAwaitFor:');
  await exceptionsWithAwaitFor();

  print('handleError:');
  await handleError();

  print('transform');
  await transform();

  print('cancelOnError');
  cancelOnError();
}

/*
streams' unhandled error events throws by 'await for' statement
  and handled by ordinary try-catch
 */
Future<void> exceptionsWithAwaitFor() async {
  var stream = flawedCountStream(10);
  var intList = <int>[];

  try {
    await for (final value in stream) {
      intList.add(value);
    }
  } catch (e, s) {
    print('exception in exceptionsWithAwaitFor');
  }
  print(intList);
}

/*
.handleError handles error events
it allows the following 'await for' not to throw
 */
Future<void> handleError() async {
  var streamWithErrors = flawedCountStream(10);

  var clearedStream = streamWithErrors.handleError(
    (e) => print('exception in handleError'),
  );
  var values = <int>[];

  await for (final value in clearedStream) {
    values.add(value);
  }
  print(values);
}

/*
.transform allows more general way to handle error events
 */
Future<void> transform() async {
  var stream = createFlawedStream();
  var transformedStream =
      stream.transform(StreamTransformer<String, String>.fromHandlers(
    handleData: (data, eventSink) => eventSink.add(data),
    handleError: (e, s, eventSink) => print(e),
  ));

  var messagesList = <String>[];
  await for (final e in transformedStream) {
    messagesList.add(e);
  }
  print(messagesList);
}

/*
'throw' sends error + done event; further code is never accessible
'yield <error event>' allows further event production
 */
Stream<String> createFlawedStream() async* {
  yield 'hi'; // data event

  /*
  yield* passes control over yielding values to its operand
    it integrates other generator's values into the current
    ~~ '...' for collection
   */
  yield* Stream.error(Exception('network error')); // error event
  yield 'i\'m'; // data event
  yield 'valera'; // data event

  yield 'and'; // data event
  throw Exception('network error'); // error event + done event
  yield '...'; // data event
}

void cancelOnError() {
  var subscription = flawedCountStream(10).listen((data) => print(data),
      onError: (e) => print(e), cancelOnError: false);
}
