import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  readFileWithStream();
  writeToFileWithStream();
}

void readFileWithStream() {
  var file = File('./resources/stream_read.txt');

  void Function(List<int> data, EventSink<String> eventSink)
      createHandleData() {
    String buf = '';
    var chunkCounter = 0;
    return (data, eventSink) {
      var decodedLines = String.fromCharCodes(data).split(RegExp(r'\n'));
      decodedLines[0] = '${buf}${decodedLines[0]}';
      for (int i = 0; i < decodedLines.length - 1; i++) {
        eventSink.add('${chunkCounter}_${i}_${decodedLines[i]}');
      }
      buf = decodedLines[decodedLines.length - 1];
      chunkCounter++;
    };
  }

  /*
  in order to make sure the file resource is released
    either file's stream must be listened to the end
    or subscription must be canceled
   */
  var stream = file.openRead().transform(
      StreamTransformer.fromHandlers(handleData: createHandleData()));
  stream.listen((data) => print(data));
}

void writeToFileWithStream() async {
  var file = File('./resources/stream_write.txt');

  Stream<String> contentsStream() async* {
    yield 'valera ';
    yield 'sergeyev\n';
  }

  var ioSink = file.openWrite(mode: FileMode.writeOnly);
  // ~~ ioSink.add(object.toString().codeUnits)
  ioSink.write('hello ');
  // ioSink.write(object + '\n')
  ioSink.writeln('world!');
  ioSink.add('i\'m '.codeUnits);
  await ioSink.addStream(contentsStream().transform(utf8.encoder));
  // shouldn't be called before addStream completes
  await ioSink.flush();
  /*
  adds done event that
   */
  await ioSink.close();
}
