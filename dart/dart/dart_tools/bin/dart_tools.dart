import 'package:dart_tools/dart_tools.dart';

void main(List<String> arguments) {
  info();
  warning();
  error();
}

void info() {
  var contents = [1, 2, 3];
  var message = 'inList: ${contents}';
  print(message);
}

void warning() {
  var variable = 'hello world!';
}

void error() {
  var variable = 'hello'
  print(variable);
}


