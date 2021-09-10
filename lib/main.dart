import 'package:flutter/material.dart';
import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counterbloc _counterBloc = Counterbloc();

  //int _counter = 0;
  void dispose() {
    // Don't forget to close all the stream
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'will Get Counter Value From Server:',
              style: Theme.of(context).textTheme.headline6,
            ),
            StreamBuilder(
              stream: _counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return (Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ));
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterevent.Increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterevent.Reset);
            },
            tooltip: 'Increment',
            child: Icon(Icons.reset_tv),
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.eventSink.add(counterevent.Decrement);
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
