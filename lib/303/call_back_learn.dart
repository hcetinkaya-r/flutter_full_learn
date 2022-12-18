import 'package:flutter/material.dart';
import 'package:flutter_101/product/widget/answer_button.dart';
import 'package:flutter_101/product/widget/callback_dropdown.dart';

import '../product/widget/loading_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  _CallBackLearnState createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          CallbackDropdown(onUserSelected: (CallBackUser user) {
            print(user);
          }),
          AnswerButton(
            onNumber: (int number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
            onPress: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
            title: 'Save',
          )
        ]),
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  // TODO Dummy Remove it

  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('vb1', 101),
      CallBackUser('vb2', 102),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
