/*
https://dart.dev/tools/non-promotion-reasons
type promotion - when dart automatically promotes variable to a narrow type
when there's a prove it's of that type
type promotion happens based on flow analysis

type promotion is available for
- local variables, including parameters
- private final non-external fields, excluding getters

*/
void typePromotionToSpecificType() {
  Object person = "John";

  /*
  within "if" clause person can only be of type String
   */
  if (person is String) {
    print(person.toUpperCase());
  }
}

void typePromotionToNonNullableType() {
  String? person = "John";
  if (person != null) {
    print(person.toUpperCase());
  }
}

void typePromotionWays() {
  Object person = "John";
  String? message = "Hello";
  String? assignee = null;

  // is
  if (person is String) {
    print(person.toUpperCase());
  }

  // != null
  if (assignee != null) {
    print("ticket No34 is assigned to $assignee");
  }

  // !
  print(message.toUpperCase());

  // as
  // todo:

  /*
  // runtimeType == // doesn't work as type promotion
  if (person.runtimeType == String) {
    print(person.toUpperCase());
  }
   */
}