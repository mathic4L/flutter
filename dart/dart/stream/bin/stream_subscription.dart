import 'package:stream/common.dart';

void main() {
  streamSubscription();
}

void streamSubscription() async {
  var stream = countStream(10);
  var intList = <int>[];
  var subscription = stream.listen(null);

  subscription.onData((data) {
    intList.add(data);
    print('added $data');
  });

  await Future.delayed(Duration(seconds: 2));
}
