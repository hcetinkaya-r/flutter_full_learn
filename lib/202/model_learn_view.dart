import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  _ModelLearnViewState createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  @override
  void initState() {

    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'vb';

    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'b', 'a');

    user2.body = 'a';

    final user3 = PostModel3(1, 2, 'b', 'a');
    user3.title;

    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    user4.id;

    final user5 = PostModel5(userId: 1, id: 2, title: 'a', body: 'b');

    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');

    final user7 = PostModel7(userId: 1, id: 2, title: 'a', body: 'b');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
