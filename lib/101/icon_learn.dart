import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  const IconLearn({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.abc_outlined,
              size: IconSize.iconSmall2x,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc_outlined, color: IconColors.froly),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc_outlined),
          ),
          const Card(
            child: SizedBox(
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}

class IconSize {
  final double iconSmall = 40;
  static const double iconSmall2x = 80;
}

class IconColors {
  static const Color froly = Color(0XffED617A);
}
