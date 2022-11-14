import 'package:flutter/material.dart';
import 'package:flutter_101/101/demo/color_demos_view.dart';

class ColorLifecycleView extends StatefulWidget {
  const ColorLifecycleView({Key? key}) : super(key: key);

  @override
  _ColorLifecycleViewState createState() => _ColorLifecycleViewState();
}

class _ColorLifecycleViewState extends State<ColorLifecycleView> {
  Color? _backgroundColor;



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
            onPressed: () {
              _changeBackground();
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Spacer(),
          Expanded(child: ColorDemosView(initialColor: _backgroundColor)),
        ],
      ),
    );
  }

  void _changeBackground() {
     _backgroundColor = Colors.pink;
    setState(() {
      
    });
  }
}
