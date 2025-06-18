import 'dart:isolate';

/*
function don't have to be async
  to return Future
  to instantiate and manipulate Future
 */
Future<void> main(List<String> arguments) async {
  /*
  instantiated Futures are executed after sync code
  Future instantiation puts the corresponding callback to event queue,
    not assignment, function of instantiation or anything else
   */
  (() {
    return (() {
      print('1st');
      return Future(() {
        print('5th');
      });
    }).call();
  }).call();
  // (() => Future(() => print('func returning Future to main'))).call();

  print('2nd');

  // controlFlowWithAwait();

  print('4th');
}