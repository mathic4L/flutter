/*
function is required to marked with 'sync*' to use 'yield' in its body
 */
Iterable<int> createFromToIntList(int from, int to) sync* {
  for (int i = from; i < to; i++) {
    yield i;
  }
}