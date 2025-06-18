Future<void> main() async {
  for (final func in [
    thenHandlingTest,
    catchErrorTest,
    catchErrorTestTest,
    whenCompleteTest,
  ]) {
    await func();
    print('');
  }
}

/*
Register the optional onError callback  only if you want to
  differentiate between when future then() invoked on completed
    - with value
    - with error
 */
thenHandlingTest() async {
  return Future<String>(() {
    throw Exception('exception at 0th then');
  }).then<String>((value) {
    print('hello from then invoked on succeeded future 1');
    return 'after then';
  }).then<String>((value) {
    print('hello from then invoked on succeeded future 2');
    return 'after then';
  }, onError: (e, s) {
    print('hello from then invoked on failed future!\n$e');
    return '';
  });
}

/*
catchError fires only if there's an error that is
  - before it
  - unhandled by catchError encountered
 */
catchErrorTest() async {
  return Future(() => 'catchErrorTest').then<String>((value) {
    throw Exception('exception at then');
  }).catchError((e) {
    print(e);
    return 'handled';
  });
}

/*
catchError allows to mimic 'on'
  and gives even more flexibility with its 'test' param
 */
catchErrorTestTest() async {
  return Future<String>(() => throw 'string error')
      .catchError(test: (e) => e is int, (e) {
    print('int error: $e');
    return 'handled';
  }).catchError(test: (e) => e is String, (e) {
    print('string error: $e');
    return 'handled';
  });
}

/*
whenComplete ~ finally

whenComplete preserves completion value throughout its call
  if invoked on future is completed with error,
    whenComplete returns the same failed future
  if invoked on future is completed with value,
    whenComplete returns the same succeeded future
 */
whenCompleteTest() async {
  await Future<String>(() => throw Exception('exception')).whenComplete(() {
    print('in whenComplete');
  }).catchError((e) {
    print(e);
    return 'handled';
  });

  await Future<String>(() => 'succeeded').whenComplete(() {
    print('in whenComplete');
  }).then((value) {
    print(value);
  });
}
