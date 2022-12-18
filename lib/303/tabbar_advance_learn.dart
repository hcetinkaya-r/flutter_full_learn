import 'package:flutter/material.dart';

import '../101/list_tile_learn.dart';
import 'feed_view.dart';

enum _MyTabViews { home, settings, favorite, profile }

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({Key? key}) : super(key: key);

  @override
  _TabbarAdvanceLearnState createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        appBar: AppBar(),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child: _myTabBar(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _tabBarView(),
      ),
    );
  }

  TabBar _myTabBar() =>
      TabBar(controller: _tabController, tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        FeedView(),
        ListTileLearn(),
        ListTileLearn(),
        ListTileLearn(),
      ],
    );
  }
}

extension _MyTabViewExtension on _MyTabViews {}
