import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_101/202/services/post_model.dart';

class ServiceLearnPostView extends StatefulWidget {
  const ServiceLearnPostView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServiceLearnPostViewState createState() => _ServiceLearnPostViewState();
}

class _ServiceLearnPostViewState extends State<ServiceLearnPostView> {
  String? name;
  bool _isLoading = false;

  late final Dio _dio;

  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel model) async {
    _changeLoading();
    final response = await _dio.post('posts', data: model);

    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? 'Basarisiz'),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: Column(
        children: [
          TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Title')),
          TextField(
              controller: _bodyController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Body')),
          TextField(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              autofillHints: [AutofillHints.creditCardNumber],
              decoration: InputDecoration(labelText: 'UserId')),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                          title: _titleController.text,
                          userId: int.tryParse(_userIdController.text),
                          body: _bodyController.text);

                      _addItemToService(model);
                    }
                  },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(_model?.title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red)),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
