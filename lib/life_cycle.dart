import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  String _message = '';
  late final bool _isOdd;

  @override
  void initState() {
    print('init state');
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeLength();
  }

  void _computeLength() {
    if (_isOdd) {
      _message += ' Cift';
    } else {
      _message += ' Tek';
    }
  }

  @override
  void didUpdateWidget(covariant LifeCycle oldWidget) {
    print('Did Update Widget');
    super.didUpdateWidget(oldWidget);

    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeLength();
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    print('Did change dependencies');

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.message.length.isOdd ? Text(_message) : Text(_message),
        ),
        body: widget.message.length.isOdd
            ? TextButton(onPressed: () {}, child: Text(' $_message'))
            : ElevatedButton(onPressed: () {}, child: Text(' $_message')));
  }
}
