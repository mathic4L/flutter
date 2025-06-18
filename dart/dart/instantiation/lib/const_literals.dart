/*
most built-in types' literals are always const
 */
void constLiterals() {
  int age1 = 10;
  int age2 = (18 + 21) ~/ 3;

  double version = 2.0 * 7; // const

  /*
  doesn't compile
  'version' var must be const; not its value that might be reassigned during runtime
   */
  // const message = "hello! the app version is $version";

  /*
  doesn't compile
  interpolated expression not only must be const, but also must evaluate to bool/num/string/null
   */
  // const janeMessage = "hello, i'm ${(const Person(name: 'jane')).name}";
}

/*
collection literals are non-const by default
they allow 'const' if all the elements are const too
 */
void collectionLiterals() {
  var people = ["john", "susie"]; // non-const, despite all value are const
  var alphabet = const ["a", "b", "c"]; // const

  var philipp = "philipp";
  var jane = "jane";
  /*
  doesn't compile; values in const list must be const
   */
  // var people2 = const ["nick", ...people];

  /*
  doesn't compile; values in a const map must be const
   */
  // var flatNeighbours = const <String>{philipp, jane};

  /*
  doesn't compile; keys in a const map must be const
   */
  // var couples = const <String, String>{philipp: jane,};
}

// ------------------------

class Person {
  const Person({
    required this.name,
  });

  final String name;
}
