import 'package:flutter/material.dart';

class ImageLearn extends StatefulWidget {
  const ImageLearn({Key? key}) : super(key: key);

  @override
  _ImageLearnState createState() => _ImageLearnState();
}

class _ImageLearnState extends State<ImageLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ImagePath.photo.toWidget(height: 100),
    );
  }
}

enum ImagePath { photo }

extension ImagePathsExtension on ImagePath {
  String path() {
    return 'images/png/$name.jpeg';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(path(), height: height);
  }
}
