import 'dart:async';

/*
'yield' with 'async*'
to use 'yield' for stream function must be marked with 'async*'

- generation automatically pauses on 'yield' statement when subscriber pauses
- automatically
  - stops production, when subscription is cancelled, the next yield acts as a return
    with all 'finally' executed
  - doesn't produce before the stream has a listener
 */
Stream<String> createCharsWithYieldAndAsync() async* {
  for (int i = 65; i < 68; i++) {
    yield String.fromCharCode(i);
  }

  yield String.fromCharCode(68);
}

/*
as opposed to function generators
  if the stream doesn't have a subscription yet, events are buffered instead of being send
    this might lead to memory leak
  controller can't be prevented from producing events when subscription is paused

 */
Stream<String> createWithStreamController() {

}
