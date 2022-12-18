// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                )),
                Expanded(
                    child: Container(
                  color: Colors.yellow,
                )),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(),
                const FlutterLogo(),
                const FlutterLogo(),
              ],
            ),
          ),
          SizedBox(
            height: CardHeight.cardHeight,
            child: Column(
              children: <Widget> [
                const Expanded(child: FlutterLogo()),
                const Expanded(child: FlutterLogo()),
                const Expanded(child: FlutterLogo()),
                const Spacer(),
                const Expanded(child: FlutterLogo()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardHeight {
  static const double cardHeight = 200;
}
