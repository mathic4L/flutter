import 'entities.dart';

/*
const constructors and const literals share the same identity
  meaning they point to the same objects in memory
 */
void identityTest() {

  const aAir = Laptop('Apple', 'Air', Cpu('Intel', 'Core i5'));
  const bAir = Laptop('Apple', 'Air', Cpu('Intel', 'Core i5'));
  print(identical(aAir, bAir));
  print(identical(bAir.cpu.brand, 'Intel'));

  const aInt = 1;
  const bInt = 1;
  print(identical(aInt, bInt));
}