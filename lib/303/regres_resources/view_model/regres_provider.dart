import 'package:flutter/cupertino.dart';
import 'package:flutter_101/product/global/resource_context.dart';

import '../model/resource_model.dart';
import '../service/regres_service.dart';

class RegressProvider extends ChangeNotifier {
  final IRegresService regresService;
  List<Data> resources = [];

  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  RegressProvider(this.regresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await regresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
