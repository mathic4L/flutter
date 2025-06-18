import 'dart:async';

Future<void> main() async {
  then();
  exceptionHandling();

  wait();
  iterableWait();
  recordWait();
}

/*
If the callback registered with then() returns a Future,
  then() returns that Future
If the callback returns a value of any other type,
  then() creates a new Future that completes with the value.

then() allows callback chaining
 */
Future<void> then() async {}

/*
catchError only handles errors that happens before its invocation
callbacks of chaining at (failed then; catchError) are never executed
 */
Future<void> exceptionHandling() async {
  Future(() => throw Exception('exception in exceptionHandling')).then((value) {
    print('hello future');
  }).catchError((e) {
    print(e);
  });
}

/*
completes
  either with list of results
  or with error
 */
Future<void> wait() async {
  Future.wait([
    Future(() {
      print('hello');
    }),
    Future(() {
      print('future');
    }),
    Future(() {
      print('!');
    }),
  ]);
}

/*
iterable.wait = future.wait
  + parallel operations
  + exception handling and disposal of successful results
 */
Future<void> iterableWait() async {
  try {
    String fst() => 'hello, wait in iterable!';
    String scd() => throw Exception('exception in iterableWait');
    var res = await [
      Future(fst),
      Future(scd),
    ].wait;
  } on ParallelWaitError<List<String?>, List<AsyncError?>> catch (e) {
    print('iterableWait:\n'
        'values: ${e.values[0]}, ${e.values[1]}; '
        'errors: ${e.errors[0]}, ${e.errors[1]}');
  }
}

/*
record.wait = future.wait
  + futures can be of different types
'FutureRecord<amount of futures>' extension is used
 */
Future<void> recordWait() async {
  String fst() => 'hello, wait in record!';
  int scd() => 42;
  var res = await (Future(fst), Future(scd)).wait;
  print('recordWait:\n'
      'fst: ${res.$1}, scd: ${res.$2}');
}
