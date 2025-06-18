extension StringWavy on String {
  String get wavy {
    String result = '';
    for (int i = 0; i < length; i + 2) {
      result += this[i];
      result += this[i + 1].toUpperCase();
    }
    return result;
  }
}

class Person {
  String name = '';

  String get wavyName => name.wavy;
}

/*
xxx str._position // extension methods don't have access to private members
 */
/*
xxx int get length // extension methods can't redefine existing members
 */

/*
If you use an extension on a subclass that isn't typed as the base class,
it won't apply unless declared properly
 */