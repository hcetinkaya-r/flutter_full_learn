import 'package:flutter/material.dart';
import 'package:flutter_101/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({Key? key}) : super(key: key);

  @override
  _StateManageLearnViewState createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeVisible();
        changeOpacity();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.grey : Colors.blue,
        title: const Text('Title'),
      ),
      body: Container(),
    );
    ;
  }
}
