/*
error happening in future instance methods callbacks
  result in future being completed with that error
    allowing handling methods to handle it

errors thrown in preceding sync code can't be handled
by future instance methods though
  solution - wrapping preceding sync code and async code in sync Future.sync()

if async() callback ends up with:
  If the callback itself returns a Future, the value or the error of that Future completes Future.sync()'s Future.
  error -> future completed with that error
  non-future value -> that non-future value
 */

void main() async {
  /*
  additional try-catch handling
   */
  try {
    await syncError();
  } catch (e) {
    print(e);
  }

  /*
  no extra headache
   */
  await asyncError();
}

Future<void> syncError() {
  int a = (() {
    throw Exception('exception');
    return 42;
  }).call();
  return Future(() => print(a));
}

Future<void> asyncError() {
  return Future.sync((){
    int a = (() {
      throw Exception('exception');
      return 42;
    }).call();
    return Future(() => print(a));
  });
}
