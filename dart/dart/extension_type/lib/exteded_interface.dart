void extendedInterface() {
  var newInt = NewInt(1);
  print('newInt is ${newInt.isFibonacci() ? '' : 'not'} fibonacci');
}

extension type NewInt(int value) implements int {
  bool isFibonacci() {
    return value == 1 || value == 2 || value == 3 || value == 5; //...
  }
}
