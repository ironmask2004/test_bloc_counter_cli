import 'dart:async';
import 'counterEvent.dart';

class CounterLocalBloc {
  int _counterLocal = 0;

  StreamController<counterevent> _eventController =
      StreamController<counterevent>();
  Stream<counterevent> get eventStream => _eventController.stream;
  Sink<counterevent> get eventSink => _eventController.sink;

  StreamController<int> _counterLocalController = StreamController<int>();
  Stream<int> get counterLocalStream => _counterLocalController.stream;
  Sink<int> get counterLocalSink => _counterLocalController.sink;

  CounterLocalBloc() {
    print("test local");
    eventStream.listen((counterevent event) async {
      if (event == counterevent.Increment) {
        counterLocalSink.add(++_counterLocal);
      } else if (event == counterevent.Decrement) {
        counterLocalSink.add(--_counterLocal);
      } else if (event == counterevent.Reset) {
        _counterLocal = 0;
        counterLocalSink.add(_counterLocal);
      }
    });
  }

  void dispose() {
    _counterLocalController.close();
    _eventController.close();
    //super.dispose();
  }
}
