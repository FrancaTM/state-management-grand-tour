import 'package:flutter/material.dart';

/// Stateful builder
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;
//  final List _counter = [0];
//  final Map _counter = {'value': 0};

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        return Scaffold(
          body: Center(
            child: Text('$_counter'),
//            child: Text('${_counter[0]}'),
//            child: Text('${_counter['value']}'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                _counter++;
//                _counter[0]++;
//                _counter['value']++;
              });
            },
          ),
        );
      },
    );
  }
}
