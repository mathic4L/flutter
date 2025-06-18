
import 'package:test/test.dart';
import 'package:tests_exercise/person.dart';

void main() {
  /*
  описание группы будет добавляться префиксом к описанию каждого из ее тестов
   */
  group('person construction /', () {
    late Person person;
    final sex = Sex.male;
    final name = 'Anton';
    final age = 18;
    final favouriteColor = 'grey';
    person =
        Person(sex: sex, name: name, age: age, favoriteColor: favouriteColor);

    /*
    исполняется перед каждым тестом в группе
     */
    setUp(() {
      print('person is set up');
    });

    /*
    исполняется после каждого теста в группе
      даже если тест проваливается
     */
    tearDown(() {
      print('person test is done');
    });

    /*
    ~~ assert(actual == mather)
     */
    test("name test", () {
      expect(person.name, 'hi');
    });

    test("sex test", () {
      expect(person.sex, sex);
    });
  });
}
