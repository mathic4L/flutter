@Tags(['matcher'])
import 'package:test/test.dart';
import 'package:tests_exercise/person.dart';

/*
тестирование с метчерами основано на
  - expect
  - expectAsync

если тип параметра 'matcher' != Matcher,
метчер создается через equals(matcher)
 */
void main() {
  group("matcher /", () {
    test("expect", () {
      var age = 21;
      var person = Person(
          sex: Sex.male, name: "valerii", age: age, favoriteColor: 'black');
      person.birthday();
      /*
      matcher methods:
        - allOf
        - anyOf
        - contains
        - isNot
        - ...
       */
      expect(person.age, allOf([equals(++age)]));
    });

    /*
    completion позволяет проверить соответствие на future
    expectLater возвращает future, завершающийся когда будет выполнена проверка
     */
    test("expectLater", () async {
      await expectLater(() => Future<int>.value(13), completion(13));
    });
  });
}
