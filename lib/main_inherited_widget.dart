import 'package:flutter/material.dart';

/// Inherited widget
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritedCounter(child: MyHomePage()),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  final Map _counter = {'value': 0};
  final Widget child;

  InheritedCounter({this.child}) : super(child: child);

  increment() {
    _counter['value']++;
  }

  get counter => _counter['value'];

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static InheritedCounter of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedCounter);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        int counter = InheritedCounter.of(context).counter;
        Function increment = InheritedCounter.of(context).increment;

        return Scaffold(
          body: Center(
            child: Text('$counter'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () => setState(() => increment()),
          ),
        );
      },
    );
  }
}
