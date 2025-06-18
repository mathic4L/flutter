import 'entities.dart';

void immutabilityTest() {
  var a = 1;
  a = 2; // ok

  var aList = const ['a', 'b', 'c'];
  /*
  runtime exception 'cannot modify unmodifiable list'
   */
  // aList[0] = 'd';

  /*
  const instances can't be changed since:
    const custom type instance requires const constructor
      -> const constructor requires final fields
        -> final fields don't generate setters
   */
  var aLaptop = const Laptop('Apple', 'Macbook', Cpu('Intel', 'Core i5'));
  // aLaptop.brand = 'Dell'; // runtime exception 'the setter isn't defined'
}

void constContextTest() {
  /*
  'const' implicitly creates const context for entire instantiation it is used with;
    meaning all constructors receive 'const' before them
    -> the constructors must be const
      -> all types used in initializer must declare const constructors
   */
  var air = const Laptop('Apple', 'Air', const Cpu('Intel', 'Core i5'));

  /*
  const variable creates const context for entire initializer too;
   */
  const airPro =
      const Laptop('Apple', 'Air Pro', const Cpu('Intel', 'Core i7'));
  /*
  fails, OemConfig doesn't declare const constructor
   */
  // const oemConfig = OemConfig([]);
}
