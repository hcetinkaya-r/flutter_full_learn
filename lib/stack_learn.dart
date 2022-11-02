import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Stack(
        children: [
          Container(color: Colors.red, height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Colors.blue, height: 100),
          ),
          Positioned(
            child: Container(color: Colors.green),
            bottom: 0,
            height: 100,
            width: 100,
          ),
          Positioned.fill(
            child: Container(color: Colors.blue),
            top: 20,
          ),
        ],
      ),
    );
  }
}
