void closureTest() {
  simpleClosurePrinterTest();
  loopClosureTest();
}

/*

 */
void simpleClosurePrinterTest(){
  var printer = simpleClosurePrinter("Hello, World!");
  printer();
  printer();
  printer();
}

void Function() simpleClosurePrinter(String input) {
  return () => print(input);
}

/*

 */
void loopClosureTest(){
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print("Hello, World! $i"));
  }
  for (final c in callbacks) {
    c();
  }
}
