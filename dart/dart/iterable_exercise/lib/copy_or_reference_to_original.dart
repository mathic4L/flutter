void main() {
  var intList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var iterator = intList.iterator;

  iterator.moveNext();
  print(iterator.current);

  intList.removeWhere((e) => e == 1);
  print(intList.toString());

  // iterator.moveNext();
  // print(iterator.current);
}
