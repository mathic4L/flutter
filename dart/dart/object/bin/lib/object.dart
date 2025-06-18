import 'dart:js_interop';

void object() {
  Object obj = "hello world!";

  print(obj.runtimeType); // runtime type
  print(obj.hashCode); // hashcode
  print(obj.toString()); // toString()
  // print(obj.noSuchMethod(...)); // invoked when not existing instance member (method or property) accessed

  // extensions' methods
  obj.toExternalReference;
  obj.toJSBox;
  obj.jsify();
}
