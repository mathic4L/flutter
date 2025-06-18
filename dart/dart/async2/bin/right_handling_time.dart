/*
handling must be chained with failed future
  otherwise exception will propagate
 */
rightHandlingTest() async {
  var future = Future<String>(() => throw Exception('exception'));
  await Future(() => 'succeeded');
  await future.catchError((e) {
    print(e);
    return 'handled';
  });
}


/*
Potential problem: failing to register error handlers early
#
It is crucial that error handlers are installed before a Future completes: this avoids scenarios where a Future completes with an error, the error handler is not yet attached, and the error accidentally propagates. Consider this code:

void main() {
  Future<Object> future = asyncErrorFunction();

  // BAD: Too late to handle asyncErrorFunction() exception.
  Future.delayed(const Duration(milliseconds: 500), () {
    future.then(...).catchError(...);
  });
}
content_copy
In the code above, catchError() is not registered until half a second after asyncErrorFunction() is called, and the error goes unhandled.

The problem goes away if asyncErrorFunction() is called within the Future.delayed() callback:

void main() {
  Future.delayed(const Duration(milliseconds: 500), () {
    asyncErrorFunction()
        .then(...)
        .catchError(...); // We get here.
  });
}
 */