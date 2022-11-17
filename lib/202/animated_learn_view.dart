import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  _AnimatedLearnViewState createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  bool _isVisible = true;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _animatedWidget(),),
        body: Column(
          children: [
            _animatedWidget(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeVisible,
        ));
  }

  AnimatedCrossFade _animatedWidget() {
    return AnimatedCrossFade(
      firstChild: FlutterLogo(
        size: 500,
      ),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
      secondChild: Placeholder(),
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
