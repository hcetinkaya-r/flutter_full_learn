import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_101/202/image_learn.dart';
import 'package:flutter_101/303/regres_resources/service/regres_service.dart';
import 'package:flutter_101/303/regres_resources/view_model/regres_provider.dart';
import 'package:flutter_101/product/extension/string_extension.dart';
import 'package:flutter_101/product/global/resource_context.dart';
import 'package:flutter_101/product/global/theme_notifier.dart';
import 'package:flutter_101/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';
import '../view_model/regres_view_model.dart';

class RegresView extends StatefulWidget {
  const RegresView({Key? key}) : super(key: key);

  @override
  State<RegresView> createState() => _RegresViewState();
}

// class _RegresViewState extends RegresViewModel {

class _RegresViewState extends State<RegresView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegressProvider>(
      lazy: false,
      create: (BuildContext context) => RegressProvider(RegresService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<RegressProvider>().isLoading ? const CircularProgressIndicator.adaptive() : null,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<RegressProvider>().saveToLocale(context.read<ResourceContext>());
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ImageLearn();
                    }));
                  },
                  icon: const Icon(Icons.zoom_in_sharp))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          body: Column(
            children: [
              Selector<RegressProvider, bool>(
                builder: (BuildContext context, value, Widget? child) {
                  return value ? const Placeholder() : const Text('data');
                },
                selector: (BuildContext context, provider) {
                  return provider.isLoading;
                },
              ),
              Expanded(child: _resourceListView(context, context.watch<RegressProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? ''));
        });
  }
}
