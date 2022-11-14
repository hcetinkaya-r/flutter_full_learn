import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_101/202/services/comment_model.dart';
import 'package:flutter_101/202/services/post_model.dart';

enum _PostServicePath { posts, comments }

enum _PostQueryPath { postId }

abstract class IPostService {
  Future<List<PostModel>?> fetchPostItems();
  Future<bool> addItemToService(PostModel model);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);

  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  late final Dio _dio;

  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get(_PostServicePath.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
      return null;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<bool> addItemToService(PostModel model) async {
    try {
      final response = await _dio.post(_PostServicePath.posts.name, data: model);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }

    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.post('${_PostServicePath.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }

    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.post(_PostServicePath.posts.name);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }

    return false;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {

    try {
      final response = await _dio.get(_PostServicePath.comments.name, queryParameters: {_PostQueryPath.postId.name: postId});



      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
 

      _ShowDebug.showDioError(error, this);
    }
    return null;
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-------');
    }
  }
}
