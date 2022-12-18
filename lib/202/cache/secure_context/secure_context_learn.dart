import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureKeys { token }

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({Key? key}) : super(key: key);

  @override
  _SecureContextLearnState createState() => _SecureContextLearnState();
}

class _SecureContextLearnState extends State<SecureContextLearn> {
  final _storage = const FlutterSecureStorage();

  String _title = '';

  final TextEditingController _controller = TextEditingController();

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  getSecureItems() async {
    _title = await _storage.read(key: SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print('App daha once kullanilmis ve tokeni bu');
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),
      ),
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        minLines: 2,
        maxLines: 4,
      ),
    );
  }
}
