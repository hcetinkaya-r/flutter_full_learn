import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldLearn extends StatefulWidget {
  const TextfieldLearn({Key? key}) : super(key: key);

  @override
  _TextfieldLearnState createState() => _TextfieldLearnState();
}

class _TextfieldLearnState extends State<TextfieldLearn> {
  final key = GlobalKey();

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formatter],
            autofocus: true,
            textInputAction: TextInputAction.next,
            focusNode: focusNodeTextFieldOne,
            maxLength: 20,
            buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            decoration: _InputDecorator()._emailInput,
          ),
          TextField(
            focusNode: focusNodeTextFieldTwo,
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: key,
      duration: Duration(seconds: 1),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.amber[100 * ((currentLength ?? 0) ~/ 2)],
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue == 'q') {
      return oldValue;
    }
    return newValue;
  });
}

class _InputDecorator {
  final _emailInput = InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: 'Mail',
  );
}
