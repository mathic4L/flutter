class LazyIntGenerator extends Iterable<int> {
  final int start;
  final int count;

  LazyIntGenerator(this.start, this.count);

  @override
  Iterator<int> get iterator => _LazyIntIterator(start, count);
}

class _LazyIntIterator implements Iterator<int> {
  int _current;
  final int _end;
  bool _started = false;

  _LazyIntIterator(int start, int count)
      : _current = start - 1,
        _end = start + count;

  @override
  int get current => _current;

  @override
  bool moveNext() {
    if (!_started) {
      _started = true;
      _current++;
    } else {
      _current++;
    }
    return _current < _end;
  }
}
