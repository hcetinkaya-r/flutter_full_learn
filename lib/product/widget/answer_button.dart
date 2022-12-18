import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, required this.onNumber}) : super(key: key);

  final bool Function(int number)? onNumber;

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: _backgroundColor),
      onPressed: () {
        final result = Random().nextInt(10);

        final response = widget.onNumber?.call(result) ?? false;

        setState(() {
          _backgroundColor = response ? Colors.green : Colors.amber;
        });
      },
      child: const Text('Answer'),
    );
  }
}
