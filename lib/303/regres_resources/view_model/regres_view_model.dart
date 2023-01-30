import '../../../202/cache/shared_learn_cache.dart';
import '../../../product/service/project_dio.dart';
import '../../../product/service/project_network_manager.dart';
import '../model/resource_model.dart';
import '../service/regres_service.dart';
import '../view/regres_view.dart';

abstract class RegresViewModel extends LoadingState<RegresView> with ProjectDioMixin {
  late final IRegresService regresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();

    regresService = RegresService(ProjectNetworkManager.instance.service);

    ProjectNetworkManager.instance.addBaseHeaderToToken('veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await regresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
