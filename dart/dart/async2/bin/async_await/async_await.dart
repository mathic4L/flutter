/*
asynchronous function is a function with at least one asynchronous operation
  it can also perform synchronous operations!

в async функции при встрече await
  весь код начиная с await помещается в event queue
    (не только expression из await <expression>)

при том, что следующий за await код функции помещается в event queue,
поток исполнения выходит из этой функции и продолжает выполнение
кода вызывающей функции

async функции могут возвращать только Future
  при этом expression из 'return <expression>;' может быть не Future
    оно в него обернется неявно; главное чтобы Future был в сигнатуре функции

 */
Future<void> controlFlowWithAwait() async {
  var a = 42;
  var b = MyLaptop(model: 'macbook air', year: 2021);
  (() async {
    await Future(() => print('bugging future'));
    print('after bugging future');
    a++;
    b.year++;
  }).call();
  print('3rd: a: $a, b: $b');
}

class MyLaptop {
  MyLaptop({required this.model, required this.year});

  final String model;
  int year;

  @override
  String toString() {
    return 'MyLaptop{model: $model, year: $year}';
  }
}

/*
await имеет свойство распаковывать Future
  но async функция содержащая этот await все равно должна возвращать Future
 */
Future<String> unwrapping() async {
  String msg = await ((() async => 'hello world!')).call();
  return await Future(() => msg);
}

/*
In 'await <expression>', expression is usually a Future;
  if it isn’t, then the value is automatically wrapped in a Future
 */
// illustration to be done...