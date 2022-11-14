import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_101/202/services/comment_learn_view.dart';
import 'package:flutter_101/202/services/post_model.dart';
import 'package:flutter_101/202/services/post_service.dart';

class ServiceLearnGetView extends StatefulWidget {
  const ServiceLearnGetView({Key? key}) : super(key: key);

  @override
  _ServiceLearnGetViewState createState() => _ServiceLearnGetViewState();
}

class _ServiceLearnGetViewState extends State<ServiceLearnGetView> {
  List<PostModel>? _items;

  String? name;

  bool _isLoading = true;

  late final Dio _dio;

  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  late final IPostService _postService;

  @override
  void initState() {
    super.initState();

    _dio = Dio(BaseOptions(baseUrl: _baseUrl));

    _postService = PostService();

    name = 'basladi';
    fetchPostItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    _items = await _postService.fetchPostItems();

    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox()],
      ),
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              }),
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
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CommentLearnView(
              postId: _model?.id,
            );
          }));
        },
        title: Text(_model?.title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red)),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
