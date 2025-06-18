/*
extension type leaves no traces in runtime
 */
void erasure() {
  var id1 = Id(1);
  print('\'id1\' has runtime type \'${id1.runtimeType}\'');

  var id2 = Id(2);
  print('\'id\' is ${id2 is int ? '' : 'not'}of \'int\' type');

  var i = 1;
  print('\'i\' is ${i is Id ? '' : 'not'}of \'Id\' type');
}

extension type Id(int value) {}
