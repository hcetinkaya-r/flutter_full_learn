import 'package:flutter/material.dart';
import 'package:flutter_101/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({Key? key}) : super(key: key);

  @override
  _OopLearnViewState createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();

    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: const [
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        download?.downloadItem(null);
      }),
    );
  }
}
