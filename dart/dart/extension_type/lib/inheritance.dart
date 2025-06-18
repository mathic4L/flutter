/*
extension type, just like class, allows
  - type parameters
  - named, factory and other constructors
  - class & instance members (excluding non-external variables and abstract methods)
    */
import 'package:meta/meta.dart';

extension type SpecialList<T>(List<T> elements) {
  //...
}

/*
extension type allows multiple implementations from
  - extension type on the same representation type
  - representation type or its supertype

member with the same name as supertype member's
  doesn't override but redeclare
 */
extension type Implementing(int i) implements Implemented, int {
  @redeclare
  void myPrint() {
    print('Implementing with value of $i');
  }
//...
}
extension type Implemented(int i) {
  void myPrint() {
    print('Implemented with value of $i');
  }
}