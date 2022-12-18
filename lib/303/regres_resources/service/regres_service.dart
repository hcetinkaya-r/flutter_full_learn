import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/resource_model.dart';

enum _RegresPath { resource }

abstract class IRegresService {
  final Dio dio;

  IRegresService(this.dio);

  Future<ResourceModel?> fetchResourceItem();
}

class RegresService extends IRegresService {
  RegresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_RegresPath.resource.name}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
