/*
Although an async function might perform time-consuming operations,
it doesn't wait for those operations. Instead, it executes until it its first
await expression. Then it returns a Future object, resuming execution after the await expression completes.
 */

Future<void> main() async {
  return await asyncAwaitCallee();
}

asyncAwaitCallee() async {
  var msg = 'async';
  print(msg);
  return msg;
}
