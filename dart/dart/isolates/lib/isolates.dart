/*
  future in worker isolates is ignored
   */
isolateWorker();

void isolateWorker() {
  Isolate.run(() {
    Future(() => print('func called in worker with Future in its own stack'));
    return 1;
  });
}