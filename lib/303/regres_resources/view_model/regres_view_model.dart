
import 'package:flutter_101/202/cache/shared_learn_cache.dart';
import 'package:flutter_101/303/regres_resources/model/resource_model.dart';
import 'package:flutter_101/303/regres_resources/service/regres_service.dart';
import 'package:flutter_101/product/service/project_dio.dart';

import '../view/regres_view.dart';

abstract class RegresViewModel extends LoadingState<RegresView> with ProjectDioMixin {
  late final IRegresService regresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();

    regresService = RegresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await regresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }





}
