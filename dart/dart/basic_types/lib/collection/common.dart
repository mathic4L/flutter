/*
'trailing comma' allows less copy-paste mistakes
 */
void trailingComma() {
  List<int> trailingCommaList = [
    1,
    2,
    3,
  ];
}

/*
instantiation can be done via
  - literal
  - constructor
 */
void instantiation() {
  var list = [1, 2, 3]; // literal
  var set = Set<int>(); // constructor
}

/*
allows to insert source collection's values into target collection
instead of insertion of source collection itself
 */
void spreadOperator() {
  var list = [1, 2, 3];
  var set = <int>{...list};

  /*
  null-aware spread operator
   */
  List<int>? list2;
  var set2 = <int>{...?list2};
}

/*
Control-flow operators with collection
  - collection for
  - collection if
    - if
    - if case
 */
void collectionForAndIf() {
  var condition = true;
  var ifList = [1, 2, if (condition) 3];

  var login = 'Manager';
  var ifCaseList = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory'
  ];

  var forMapKeys = [0, 1, 2];
  var forMapValues = ['ford', 'bmw', 'audi'];
  var forMap = {
    for (var i in forMapKeys) '$i': forMapValues[i],
    '3': 'kia',
  };
}
