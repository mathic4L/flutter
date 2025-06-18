/*
shadowing is when nested scope variable (including parameter)
is used instead of outer scope one with the same name
 */

void func<T>(T a) {
  void innerFunc<T>(T a) { // refers to inner "T"
    print(a); // refers to inner "a"
  }
}



