import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({
    Key? key,
    required this.name,
    this.username,
  }) : super(key: key);

  final String name;
  final String? username;

  ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome $name, ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: ProjectStyles.welcomeStyle,
            ),
            Text(
              'Hello $name, ${name.length}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: ProjectColors.welcomeColor),
            ),
            Text(username ?? ''),
            Text(keys.welcome),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    wordSpacing: 2,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    letterSpacing: 2,
    color: Colors.lime,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
