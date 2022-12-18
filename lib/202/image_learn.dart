import 'package:flutter/material.dart';
import 'package:flutter_101/product/global/resource_context.dart';
import 'package:provider/provider.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                context.read<ResourceContext>().clear();
              },
              icon: Icon(Icons.remove))
        ],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
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
