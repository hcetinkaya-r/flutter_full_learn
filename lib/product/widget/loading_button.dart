import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key, required this.title, required this.onPress}) : super(key: key);

  final String title;

//void Function()
  final Future<void> Function() onPress;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_isLoading) return;
        _changeLoading();
        await widget.onPress.call();
        _changeLoading();
      },
      child: _isLoading
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            )
          : Text(widget.title),
    );
  }
}
