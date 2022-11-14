import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({Key? key}) : super(key: key);

  @override
  _PasswordTextfieldState createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  final TextEditingController _controller = TextEditingController();
  final _obscuringCharacter = '-';
  bool _isSecure = false;

  _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obscuringCharacter,
      decoration: InputDecoration(border: UnderlineInputBorder(), hintText: 'Password', suffix: _onVisibilityIcon()),
    );
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState: !_isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/*  child: IconButton(
        onPressed: () {
          _changeLoading();
        },
        icon: !_isSecure ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
      ), */