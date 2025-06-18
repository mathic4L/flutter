int globalCounter = 0;

class A {
  final int id;
  static final A instance = A._internal();

  A._internal() : id = ++globalCounter;

  factory A() {
    return instance;
  }
}

class B {
  final A a;
  final int bId;

  B({A? a})
      : a = a ?? A._internal(),
        bId = ++globalCounter;
}

void second_modified() {
  print('First B: ${B().a.id}, ${B().bId}');
  print('Second B: ${B(a: A()).a.id}, ${B(a: A()).bId}');
}