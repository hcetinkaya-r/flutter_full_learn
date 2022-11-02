// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_101/icon_learn.dart';
import 'package:flutter_101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);

  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: PageView(
          controller: _pageController,
          padEnds: true,
          onPageChanged: _updatePageIndex,
          children: [
            StackLearn(),
            IconLearn(title: 'Icon Learn'),
            Container(color: Colors.blue),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Current page index: $_currentPageIndex',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.bounceIn);
                },
                child: Icon(Icons.chevron_left)),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.bounceIn);
              },
              child: Icon(Icons.chevron_right),
            )
          ],
        ));
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
