Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Stream<int> flawedCountStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i % 3 == 0) {
      yield* Stream.error(Exception('event: $i'));
    } else {
      yield i;
    }
  }
}

Stream<int> doneAfterFirstExceptionCountStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception();
    } else {
      yield i;
    }
  }
}
