
/*
entry point
 */
void main() {

}

void variables(int input) {
  /*
  dynamic может изменять тип значения на любой
  "dynamic" type means no type checks of the variable at compile time
  */
  dynamic a = "abc";
  a = 45;
  a = false;

  /*
  compile-time and run-time constants
   */
  const int c = 45;
  final int b = input;

  var auto = "valera";
}

void operators() {
  /*
  a / 4 // ->->-> 1.5 (double)
  a ~/ 4 // ->->-> 1 (int)
   */
}

List a = [1, 2, true, "abc"];




