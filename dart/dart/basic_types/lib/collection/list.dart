void basics() {
  List<int> list = [1, 2, 3];
}

void typeInference() {
  var list = []; // infers List<dynamic>
  print(list.runtimeType);
}