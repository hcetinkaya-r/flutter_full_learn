import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  _ListViewBuilderLearnState createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: //ListView.builder(itemBuilder: (context, index)

          ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.red,
            height: 20,
          );
        },
        itemBuilder: (context, index) {
          print(index);
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Image.network(
                  'https://abload.de/img/flatcastbizmanzarares7ykm9.png',
                  fit: BoxFit.fill,
                ),
                Text('$index'),
              ],
            ),
          );
        },
        itemCount: 15,
      ),
    );
  }
}
