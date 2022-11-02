// Bir ekran olacak
//Bu ekranda 3 buton ve bunlara basinca renk degisimi olacak
//Secili olan butonda selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  final Color? initialColor;
  const ColorDemosView({Key? key, required this.initialColor}) : super(key: key);

  @override
  _ColorDemosViewState createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(oldWidget.initialColor != _backgroundColor && widget.initialColor != null);
    inspect(oldWidget.initialColor != _backgroundColor && widget.initialColor != null);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      backgroundColor: _backgroundColor,
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.red,
            ),
            label: 'red'),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.yellow,
            ),
            label: 'yellow'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'blue'),
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else {
      changeBackgroundColor(Colors.blue);
    }
  }
}

class _ColorContainer extends StatelessWidget {
  final Color color;
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}

enum _MyColors {
  red,
  yellow,
  blue;
}
