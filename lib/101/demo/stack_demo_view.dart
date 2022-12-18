import 'package:flutter/material.dart';
import 'package:flutter_101/core/random_img.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);

  final double _cardHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: _cardHeight/2,
                  child: const RandomImg(),
                ),
                Positioned(
                  height: _cardHeight,
                  bottom: 0,
                  width: 200,
                  child: const Card(
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
