import 'dart:async';

enum counterevent { Increment, Decrement, Reset , Set }

class Counterbloc {
  int _counter = 0;

  StreamController<counterevent> _eventController =
      StreamController<counterevent>();
  Stream<counterevent> get eventStream => _eventController.stream;
  Sink<counterevent> get eventSink => _eventController.sink;

  StreamController<int> _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  Counterbloc() {
    eventStream.listen((counterevent event) {
      if (event == counterevent.Increment) {
        counterSink.add(++_counter);
      } else if (event == counterevent.Decrement) {
        counterSink.add(--_counter);
      } else if (event == counterevent.Reset) {
        _counter = 0;
        counterSink.add(_counter);
      }
    });
  }
  void dispose() {
    _counterController.close();
    _eventController.close();
    //super.dispose();
  }
}
