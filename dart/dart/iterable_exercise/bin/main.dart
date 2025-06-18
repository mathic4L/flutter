import 'package:iterable/generator_function.dart';
import 'package:iterable/lazy_char_generator.dart';
import 'package:iterable/lazy_int_generator.dart';
import 'package:iterable/transform_and_filter.dart';

void main(List<String> arguments) {
  final intGen = LazyIntGenerator(1, 100);
  final result = transformAndFilter(intGen);
  print(result.take(10).toList());

  final pageGen = LazyPageGenerator(3, 11);
  print(pageGen.toList());

  print(createFromToIntList(0, 10).toList());

}



