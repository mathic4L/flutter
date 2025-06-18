import 'dart:async';

void main() {
  var sensor = createSensor();
  late StreamSubscription<int> sensorSubscription;

  var transformedSensor = sensor
      .where((event) => event.isOdd)
      .map((event) => event * event)
      .handleError((error) => print(error));

  sensorSubscription = transformedSensor.listen((data) => print(data),
      onDone: () => print('Stream completed'));
}

Stream<int> createSensor() {
  late StreamController<int> streamController;

  void onListen() async {
    for (int i = 1; i <= 20; i++) {
      if (i % 5 == 0) {
        streamController.addError(Exception('$i'));
      } else {
        print('emitted $i');
        streamController.add(i);
      }
      await Future.delayed(Duration(milliseconds: 300));
    }
    streamController.close();
  }

  streamController = StreamController<int>(
    onListen: onListen,
    onCancel: ()=>print('cancelled')
  );

  return streamController.stream;
}
