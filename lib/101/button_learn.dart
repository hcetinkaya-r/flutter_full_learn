import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Text(
              'Text Button',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.isEmpty) {
                return Colors.green;
              }
              return Colors.red;
            })),
            child: const Text('Elevated Button'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.accessibility_new_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.amber, shape: const CircleBorder(), padding: const EdgeInsets.all(50)),
            child: const Text('Oulined Button'),
          ),
          InkWell(
            onTap: () {},
            child: const Text('Inkwell'),
          )
        ],
      ),
    );
  }
}
