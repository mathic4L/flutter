import 'lazy_int_generator.dart';

Iterable<String> transformAndFilter(LazyIntGenerator lazyIntGenerator) {
  var square = lazyIntGenerator.map((int x) => x * x);

  bool divisibleByThree(int x) => x % 3 == 0;

  var skipped = 0;
  var skippedTwoDivisibleByThree = Iterable<int>.empty();
  while (skipped < 2) {
    var takenI = square.takeWhile((x) => !divisibleByThree(x));
    skippedTwoDivisibleByThree = skippedTwoDivisibleByThree.followedBy(takenI);
    square = square.skip(takenI.length);

    var skippedI = square.takeWhile(divisibleByThree);
    square = square.skip(skippedI.length);
    skipped += skippedI.length;
  }

  bool isEven(int x) => x.isEven;
  Iterable<int> evenFour = Iterable<int>.empty();

  var appended = 0;
  while (appended < 4) {
    square = square.skipWhile((x) => !isEven(x));
    var i = square.takeWhile(isEven);
    evenFour = evenFour.followedBy(i);
    appended += i.length;
    square = square.skip(i.length);
  }

  final result = skippedTwoDivisibleByThree
      .followedBy(evenFour)
      .map((x) => x.toRadixString(16));

  return result;
}
