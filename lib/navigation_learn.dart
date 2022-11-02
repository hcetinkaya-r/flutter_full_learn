import 'package:flutter/material.dart';
import 'package:flutter_101/icon_learn.dart';
import 'package:flutter_101/navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigationLearnState createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            final response = await navigateToWidgetNormal<bool>(
              context,
              NavigateDetailLearn(
                isOkey: selectedItems.contains(index),
              ),
            );

            if (response is bool) {
              addSelected(index, response);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(color: selectedItems.contains(index) ? Colors.green : Colors.red),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await navigateToWidgetNormal<bool>(
            context,
            const NavigateDetailLearn(),
          );
          if (response == true) {}
        },
        child: const Icon(Icons.navigation_rounded),
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return widget;
          },
          settings: const RouteSettings()),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return widget;
          },
          settings: const RouteSettings()),
    );
  }
}
