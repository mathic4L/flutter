import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  // readEntireFileAtOnce();
  writeEntireValuesToFile();
}

/*
reading an entire file
  big files will put pressure on memory
 */
void readEntireFileAtOnce() async {
  var basicsFile = File('./resources/basics.txt');

  // + readAsStringSync
  var contents =
      await basicsFile.readAsString(encoding: Encoding.getByName('utf-8')!);
  // + readAsLinesSync
  var contentsAsLines = await basicsFile.readAsLines();
  // + readAsBytesSync
  var contentsAsBytes = await basicsFile.readAsBytes();

  print(contents);
  print(contentsAsLines);
  print(contentsAsBytes);
}

void writeEntireValuesToFile() async {
  var outputFile = File('./resources/output.txt');

  // + writeAsStringSync
  await outputFile.writeAsString('hello\n').then(
    (value) {
      return value.writeAsString('world!\n\n', mode: FileMode.append);
    },
  );

  // + writeAsBytesSync
  var bytes = 'hello\nworld!\n'.codeUnits;
  await outputFile.writeAsBytes(bytes, mode: FileMode.append);
}
