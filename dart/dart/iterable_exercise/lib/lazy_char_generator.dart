class LazyPageGenerator extends Iterable<Page> {
  LazyPageGenerator(this.pageSize, this.primesCount);

  final int pageSize;
  final int primesCount;

  @override
  Iterator<Page> get iterator => _PageIterator(pageSize, primesCount);
}

class _PageIterator implements Iterator<Page> {
  _PageIterator(this.pageSize, this.primesCount) : _currenInt = 0;

  final int pageSize;
  final int primesCount;

  late Page _current;
  int _currenInt;
  int _currentPrimesCount = 0;

  int get _nextPrime {
    _currenInt++;
    while (!_isPrime(_currenInt)) {
      _currenInt++;
    }
    _currentPrimesCount++;
    return _currenInt;
  }

  bool _isPrime(int value) {
    for (int i = value - 1; i >= 2; i--) {
      if (value % i == 0) return false;
    }
    return true;
  }

  @override
  Page get current => _current;

  @override
  bool moveNext() {
    if (primesCount - _currentPrimesCount < pageSize) {
      return false;
    } else {
      _current = Page(Iterable.generate(pageSize, (i) => _nextPrime).toSet());
      return true;
    }
  }
}

class Page {
  Page(this.primes);

  final Set<int> primes;

  @override
  String toString() {
    return 'Page{primes: $primes}';
  }
}
