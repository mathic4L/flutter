/*
помещение кода коллбека в event queue посредством инстанциации - await
тело функции после await'а = .then()
try-catch-finally - catchError() + whenComplete()
...
 */
void main() {
  withFuture();
}

Future<String> withFuture() {
  return Future(() {
    var msg = 'with';
    print(msg);
    return msg;
  }).then((msg) {
    msg += 'Future';
    print(msg);
    return msg;
  });
}