import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt();

// Global variable
//Counter counterService = Counter();

/// Inherited widget
void main() {
  getIt.registerSingleton<Counter>(Counter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// Data model
class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);

  Observable get stream$ => _counter.stream;
  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
  }
}

// StreamBuilder widget
class MyHomePage extends StatelessWidget {
  final counterService = getIt.get<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: counterService.stream$,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Text('${snapshot.data}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          return counterService.increment();
        },
      ),
    );
  }
}
