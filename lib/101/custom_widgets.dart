import 'package:flutter/material.dart';
import 'package:flutter_101/101/demo/note_demo.dart';

class CustomWidgets extends StatelessWidget {
  final String title = 'Food';
  const CustomWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: PaddingItems.horizontalPadding,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFoodButton(
                  title: title,
                  onPressed: () {},
                )),
          ),
          SizedBox(height: 150),
          CustomFoodButton(
            title: title,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  final String title;

  final VoidCallback onPressed;
  CustomFoodButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        shape: StadiumBorder(),
      ),
      onPressed: () {},
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color white = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16);
}
