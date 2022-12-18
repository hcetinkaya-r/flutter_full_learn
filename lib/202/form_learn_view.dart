import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  _FormLearnViewState createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            print('onChange');
          },
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  return (value?.isNotEmpty ?? false) ? null : 'Bu alan bos gecilemez';
                },
              ),
              TextFormField(
                validator: FormFieldValidator().isNotEmpty,
              ),
              DropdownButtonFormField<String>(
                  validator: FormFieldValidator().isNotEmpty,
                  items: const [
                    DropdownMenuItem(value: 'a', child: Text('istanbul')),
                    DropdownMenuItem(value: 'b', child: Text('ankara')),
                    DropdownMenuItem(value: 'c', child: Text('izmir'))
                  ],
                  onChanged: (value) {}),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('Form is validate');
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ));
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bu alan bos gecilemez';
}
