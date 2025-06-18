void nullableObjectAndDynamic() {
  dynamic message1 = "hello1";
  Object? message2 = "hello2";

  /*
  direct method call
  no compile-time type safety checks
   */
  message1.toUpperCase();
  /*
  type safety requires cast to use stored object's methods
   */
  (message2 as String).toUpperCase();
}