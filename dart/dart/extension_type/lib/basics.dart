import 'package:meta/meta.dart';

void basics() {}

/*
'extension type <Name>(<RepresentationType> <representationTypeInstanceName>)'
  his declaration also implicitly creates
    - getter for representation type variable returning representation type
      (String get str)
      the getter is available inside extension type declaration as well as outside, on its instance
    - constructor
      (Name(String str) : str = str;)
 */

/*
~~ String with the only method '+'
 */
extension type Name(String _str) {
  String operator +(Name otherName) {
    return '$_str-$otherName';
  }
}

/*
extension type default constructor could be hidden
 */
extension type HiddenGenerative._(int i) {
  //...
}