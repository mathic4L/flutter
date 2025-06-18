/*
stream has similar methods as iterable
+ distinct
+ asyncExpand, asyncMap
+ transform
+ timeout
+ drain, pipe

 */
import 'dart:async';
import 'package:stream/common.dart';

void main() async {
  print(await countStream(10).map((e) => e * 2).toList());
  print(await countStream(10).takeWhile((e) => e <= 5).toList());

  await transform();
  await pipe();
}

/*
 */
Future<void> pipe() async {
  var streamController = StreamController<int>();

  // streamController.
  countStream(10).pipe(streamController);
  streamController.add(11);

  var intList = <int>[];
  await streamController.stream.forEach((e)=>intList.add(e));
  print(intList);
}

/*
transform is a generalized 'map'
transform is simpy 'return streamTransformer.bind(this)'
 */
Future<void> transform() async {
  Stream<String> bind(Stream<int> source) async* {
    await for (final intValue in source) {
      yield '$intValue';
    }
  }

  var intsAsStringStream =
      countStream(10).transform(StreamTransformer<int, String>.fromBind(bind));

  var stringList = <String>[];
  await for (final value in intsAsStringStream) {
    stringList.add(value);
  }
  print(stringList);

  // ---

  var instsWithNegativeCounterparts = flawedCountStream(10).transform(
      StreamTransformer<int, int>.fromHandlers(handleData: (data, eventSink) {
        eventSink.add(data);
        eventSink.add(-data);
      }, handleError: (e, s, eventSink) {
        print('exception in transform');
      }));

  var itList = <int>[];
  await for (final value in instsWithNegativeCounterparts) {
    itList.add(value);
  }
  print(itList);
}
