import 'dart:math';
import 'package:decoration/stages/petit_buerre_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decoration Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(
      () {
        _counter++;
      },
    );
  }

  void _decrementCounter() {
    setState(
      () {
        _counter--;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Decoration Demo'),
            Text(
              'by widgeters.dev',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
      body: Center(
        child: FittedBox(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            // padding: EdgeInsets.all(sqrt(32) + 2),
            decoration: PetitBuerre(radius: 16.0 + _counter),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _counter > 0 ? _decrementCounter : null,
            tooltip: 'Decrement',
            disabledElevation: 2,
            child: Icon(Icons.remove),
            backgroundColor: _counter > 0 ? Colors.red[800] : Colors.grey,
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
