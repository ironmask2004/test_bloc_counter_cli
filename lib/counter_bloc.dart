import 'dart:async';
import 'counterEvent.dart';
import 'counter_cli.dart';


class Counterbloc {

  int _counter = 0; //int.parse( fetchCounter("reset").toString());

  StreamController<counterevent> _eventController =
      StreamController<counterevent>();
  Stream<counterevent> get eventStream => _eventController.stream;
  Sink<counterevent> get eventSink => _eventController.sink;

  StreamController<int> _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  Counterbloc()   {
    print("test srv");
    eventStream.listen((counterevent event) async {
      if (event == counterevent.Increment) {
        _counter = await fetchCounter("inc");
        counterSink.add(_counter);
      } else if (event == counterevent.Decrement) {
        _counter = await fetchCounter("dec");
        counterSink.add(_counter);
      } else if (event == counterevent.Reset) {
        _counter = await setCounter("0");
        counterSink.add(_counter);
      } else if (event == counterevent.Set) {
        _counter = await setCounter("999");
        counterSink.add(_counter);
      } else if (event == counterevent.Current) {
        _counter = await fetchCounter("");
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
