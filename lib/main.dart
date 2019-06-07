import 'package:flutter/material.dart';

/// Stateful Widget
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // state

  void _incrementeCounter() {
    // function(state)
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // UI = function(state)
    return Scaffold(
      body: Center(
        child: Text('$_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementeCounter,
      ),
    );
  }
}
