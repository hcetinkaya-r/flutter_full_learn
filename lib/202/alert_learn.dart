import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({Key? key}) : super(key: key);

  @override
  _AlertLearnState createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return _ImageZoomDialog();
                // UpdateDialog(context: context);
                // _UpdateDialog();
              });
          inspect(response);
          /* showAboutDialog(context: context, applicationIcon: Icon(Icons.abc), applicationName: 'APP', children: [Text('hakan')],); */
        },
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Keys.versionUpdate),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version update!';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Update'),
            ),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String _url =  'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
         _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height*0.6,
        ),
      ),
    );
  }
}
