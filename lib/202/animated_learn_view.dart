import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedLearnViewState createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  bool _isVisible = true;

  bool _isOpacity = false;

  late AnimationController _controller;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _animatedWidget(),
        ),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems.durationLow,
                  opacity: _isOpacity ? 1 : kZero,
                  child: Text('DATA', style: Theme.of(context).textTheme.headline1)),
              trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: const Icon(Icons.flutter_dash_sharp),
              ),
            ),
            AnimatedDefaultTextStyle(
                style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? const TextStyle(),
                duration: _DurationItems.durationLow,
                child: const Text('DATA')),
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _controller),
            AnimatedContainer(
              duration: _DurationItems.durationLow,
              height: _isVisible ? kZero : (MediaQuery.of(context).size.height) * 0.2,
              width: (MediaQuery.of(context).size.width) * 0.2,
              color: _isVisible ? Colors.red : Colors.blue,
              margin: const EdgeInsets.all(10),
            ),
            Expanded(
              child: AnimatedList(
                  initialItemCount: 5,
                  itemBuilder: (context, index, animation) {
                    return const Text('DATA');
                  }),
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber.shade300,
                ),
                AnimatedPositioned(
                  top: _isVisible ? 30 : 80,
                  duration: _DurationItems.durationLow,
                  curve: Curves.bounceIn,
                  child: const FlutterLogo(),
                ),
              ],
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          _changeOpacity();
          _changeVisible();
          _controller.animateTo(_isVisible ? 1 : kZero);
        }));
  }

  AnimatedCrossFade _animatedWidget() {
    return AnimatedCrossFade(
      firstChild: const FlutterLogo(
        size: 100,
      ),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
      secondChild: const Placeholder(),
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
