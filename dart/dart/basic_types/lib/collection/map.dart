void basics() {
  Map<int, int> map = {1: 1, 2: 2, 3: 3};
}

void typeInference() {
  var details = <int, ({String name, int age})>{};
  var data = {}; // infers Map<dynamic, dynamic>
}

void subscriptAssignmentOperator() {
  var gifts = {'first': 'partridge'};
  gifts['fourth'] = 'calling birds'; // Add a key-value pair
}
