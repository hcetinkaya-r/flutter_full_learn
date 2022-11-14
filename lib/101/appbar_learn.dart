import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarLearn extends StatelessWidget {
  const AppbarLearn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Icon(Icons.chevron_left),
        toolbarTextStyle: TextStyle(color: Colors.red),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.analytics_sharp),
          ),
          const Center(
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
