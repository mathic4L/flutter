/*
library tag
 */
@Tags(['computer'])
/*
platform selector
 */
// @TestOn('vm')
import 'package:test/test.dart';
import 'package:tests_exercise/computer.dart';
import 'package:tests_exercise/person.dart';

void main() {
  group('computer /', () {
    late Computer computer;
    final cpu = Cpu.intel;
    final storageAmount = 512;
    final ramAmount = 16;
    final price = 40000;
    computer = Computer(price, cpu, ramAmount, storageAmount);

    /*
    скип позволяет запускать тест сут
    без необходимости помещать временно опущенные тесты в комментарии
     */
    test(
      "price test",
      skip: "disabled by now",
      testOn: 'windows',
      () {
        expect(computer.price, price);
      },
    );

    /*
    таймаут позволяет изменить время с начала, после которого
    тест раннер завершит тест
      по умолчанию таймаут = 30с

     */
    test("cpu test",
        /*
        указание параметра на уровне отдельного теста
        переопределяет его значение на уровне сута/группы
         */
        timeout: Timeout(Duration(seconds: 2)),
            () async {
      var i = 0;
      await Future.delayed(Duration(seconds: 1));
      i++;
      await Future.delayed(Duration(seconds: 1));
      i++;
      await Future.delayed(Duration(seconds: 1));
      expect(computer.cpu, cpu);
    });
  });
}
