/*
type alias
 */

typedef IntList = List<int>;

void basics() {
  IntList il = [1, 2, 3];
}

typedef ListMapper<X> = Map<X, List<X>>;

void parameterizedType() {
  ListMapper<String> m2 = {};
}

typedef CompareGeneral<T> = int Function(T a, T b); // or
typedef int CompareFunction<T>(T a, T b); // function typedefs special syntax
void functionTypedef() {
  CompareFunction<int> sort = (int a, int b) => a - b;
}
