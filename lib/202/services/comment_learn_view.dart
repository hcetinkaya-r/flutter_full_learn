import 'package:flutter/material.dart';
import 'package:flutter_101/202/services/comment_model.dart';
import 'package:flutter_101/202/services/post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  _CommentLearnViewState createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final IPostService postService;
  bool _isLoading = true;

  List<CommentModel>? _commentItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();

    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();

    _commentItem = await postService.fetchRelatedCommentsWithPostId(postId);

    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: ListView.builder(
            itemCount: _commentItem?.length ?? 0,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Card(
                  margin: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _commentItem?[index].email ?? '',
                      style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              );
            }));
  }
}
