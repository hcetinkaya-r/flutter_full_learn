import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  final bool isOkey;
  const NavigateDetailLearn({Key? key, this.isOkey = false}) : super(key: key);

  @override
  _NavigateDetailLearnState createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();

  //   // ModalRoute.of(context)?.settings.arguments;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOkey);
          },
          icon: Icon(Icons.check, color: widget.isOkey ? Colors.red : Colors.green),
          label: widget.isOkey ? const Text('red') : const Text('onayla')
        ),
      ),
    );
  }
}
