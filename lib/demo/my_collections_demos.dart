import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  _MyCollectionsDemosState createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = _CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Demos'),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          }),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility.paddingOnly,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: PaddingUtility.paddingTop,
              child: Image.asset(
                _model.imagePath,
              ),
            )),
            Padding(
              padding: PaddingUtility.paddingHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _model.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text('${_model.price} eth'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;
  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class _CollectionItems {
  late final List<CollectionModel> items;
  _CollectionItems() {
    items = [
      CollectionModel(imagePath: ProjectImmages.imageCollection, title: 'Abstract Art-1', price: 3.4),
      CollectionModel(imagePath: ProjectImmages.imageCollection, title: 'Abstract Art-2', price: 4.2),
      CollectionModel(imagePath: ProjectImmages.imageCollection, title: 'Abstract Art-3', price: 3.8)
    ];
  }
}

class PaddingUtility {
  static const paddingTop = EdgeInsets.only(top: 20);
  static const paddingHorizontal = EdgeInsets.symmetric(vertical: 20, horizontal: 40);
  static const paddingOnly = EdgeInsets.only(bottom: 20, right: 20, left: 20);
}

class ProjectImmages {
  static const imageCollection = 'images/png/photo.jpeg';
}
