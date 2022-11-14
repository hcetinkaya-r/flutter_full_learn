import 'package:flutter/material.dart';

class ContainerSizedbox extends StatelessWidget {
  final String name;
  const ContainerSizedbox({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text(name * 30),
          ),
          // SizedBox.shrink(
          //   child: Text(name * 30),
          // ),
          SizedBox.square(
            dimension: 150,
            child: Text(name * 10),
          ),

          Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            constraints: const BoxConstraints(
              maxWidth: 150,
              minWidth: 50,
            ),
            decoration: ProjectContainerDecoration(),
            child: Text(name * 2),
            // ProjectUtility.boxDecoration,
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Colors.red, Colors.black38],
    ),
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [
      const BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 0.1),
    ],
    border: Border.all(width: 10, color: Colors.white12),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.black38],
          ),
          boxShadow: [
            const BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 0.1),
          ],
          border: Border.all(width: 10, color: Colors.white12),
        );
}
