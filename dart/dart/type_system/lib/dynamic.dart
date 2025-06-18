/*
dynamic is a variable (reference) type
dynamic isn't can't be instantiated

dynamic moves type safety checks from compile-time to runtime
  т.е. 'dynamicVar.nonExistingMethod() пройдет компиляцию,
  но система типо-безопасности бросит ошибку в рантайме
 */
void basics() {
  dynamic a = 1;
  a = 'hello';
  a = true;
  print(a.runtimeType);
}

void typeParameter() {
  var aList = <dynamic>[1];
  aList.add('1');
  aList.add(true);
  print(aList[0].runtimeType);
  // print(a.runtimeType);
}