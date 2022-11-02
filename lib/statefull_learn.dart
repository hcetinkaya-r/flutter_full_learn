import 'package:flutter/material.dart';
import 'package:flutter_101/product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  _StatefullLearnState createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _calculateIncrementValue(bool value) {
    if (value == true) {
      setState(() {
        _countValue = ++_countValue;
      });
    } else {
      setState(() {
        _countValue = --_countValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Placeholder(),
          CounterHelloButton(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _incrementButton(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _deincrementButton(),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _deincrementButton() => FloatingActionButton(
        onPressed: () {
          _calculateIncrementValue(false);
        },
        child: Icon(Icons.remove),
      );

  FloatingActionButton _incrementButton() {
    print('increment_button');
    return FloatingActionButton(
      onPressed: () {
        _calculateIncrementValue(true);
      },
      child: Icon(Icons.add),
    );
  }
}
