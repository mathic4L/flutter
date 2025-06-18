void elseTest() {
  arrowFunctionTest();
  varsAndFuncsTest();
}

/*
arrow functions
 */
void arrowFunctionTest() {
  String arrowFunction(int a) => a.toString();

  void errorFunction() => Exception("Error");

  void voidFunction() => print("Hello, World!");
}

/*
variables and functions
 */
void varsAndFuncsTest() {
  /*
  assignment and initialization
   */
  var function = () => print("Hello, World!");

  void errorFunction() => Exception("Error");
  var function1 = errorFunction;

  /*

   */
  // errorFunction = () => print("Hello, World!");
}
